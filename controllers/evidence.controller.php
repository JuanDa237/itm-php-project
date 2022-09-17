<?php

class ControlEvidence
{
	private ConnectionDB $connectionDB;

	function __construct()
	{
		$this->connectionDB = new ConnectionDB();
	}

	function create(Evidence $evidence)
	{
		$this->connectionDB->executeSqlCommand($evidence->getCreateSqlCommand());
	}

	function update(int $id, Evidence $evidence)
	{
		$this->connectionDB->executeSqlCommand($evidence->getUpdateSqlCommand($id));
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
			$newEvidence = new Evidence($row['title'], $row['description'], $row['dir'], $row['tipe'], $row['lat'], $row['lon']);
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
}
