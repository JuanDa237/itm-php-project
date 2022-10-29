<?php

class ControlEvidence
{
	private ConnectionDB $connectionDB;

	function __construct()
	{
		$this->connectionDB = new ConnectionDB();
	}

	function create(Evidence $evidence, int $userId, $state)
	{
		$this->connectionDB->executeSqlCommand($evidence->getCreateSqlCommand());

		$result = $this->connectionDB->executeSqlCommand($this->getLastIdCommand());
		$id = -1;

		if ($row = $result->fetch_array(MYSQLI_BOTH)) {
			$id = $row['max'];
		}

		$authors = $evidence->getAuthors();

		for ($i = 0; $i < count($authors); $i++) {
			$this->connectionDB->executeSqlCommand($this->getInsertAuthorCommand($id, $authors[$i]));
		}

		$this->connectionDB->executeSqlCommand($this->getCreateEvidenceStateChangesCommand($id, $userId, '', $state));

		return $id;
	}

	function update(int $id, Evidence $evidence, $userId, $state)
	{
		$this->connectionDB->executeSqlCommand($evidence->getUpdateSqlCommand($id));
		$this->connectionDB->executeSqlCommand($this->getCreateEvidenceStateChangesCommand($id, $userId, '', $state));
	}

	function delete(int $id)
	{
		$this->connectionDB->executeSqlCommand($this->getDeleteSqlCommand($id));
	}

	function getOne(int $id)
	{
		$newEvidence = null;
		$recordSet = $this->connectionDB->executeSqlCommand($this->getOneSqlCommand($id));

		if ($row = $recordSet->fetch_array(MYSQLI_BOTH)) {
			$newEvidence = new Evidence($row['title'], $row['description'], $row['dir'], $row['tipe'], $row['lat'], $row['lon'], []);
		}

		return $newEvidence;
	}

	function getList()
	{
		return $this->connectionDB->executeSqlCommand($this->getListSqlCommand());
	}

	// SQl Commands

	private function getDeleteSqlCommand(int $id)
	{
		return "CALL deleteEvidence({$id})";
	}

	private function getOneSqlCommand(int $id)
	{
		return "CALL getEvidence({$id})";
	}

	private function getListSqlCommand()
	{
		return "CALL getEvidenceList()";
	}

	private function getInsertAuthorCommand($id, $authorId)
	{
		return "CALL createEvidenceAuthor({$id}, {$authorId})";
	}

	private function getLastIdCommand()
	{
		return "SELECT MAX(id) as max FROM evidence";
	}

	private function getCreateEvidenceStateChangesCommand($evidenceId, $userId, $description, $stateVal)
	{
		return "CALL createEvidenceStateChanges({$evidenceId}, {$userId}, '{$description}', '{$stateVal}')";
	}
}
