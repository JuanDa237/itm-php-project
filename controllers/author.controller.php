<?php

class ControlAuthor
{
	private ConnectionDB $connectionDB;

	function __construct()
	{
		$this->connectionDB = new ConnectionDB();
	}

	function create(Author $author)
	{
		$this->connectionDB->executeSqlCommand($author->getCreateSqlCommand());
	}

	function update(int $id, Author $author)
	{
		$this->connectionDB->executeSqlCommand($author->getUpdateSqlCommand($id));
	}

	function delete(int $id)
	{
		$this->connectionDB->executeSqlCommand($this->getDeleteSqlCommand($id));
	}

	function getOne(int $id)
	{
		$author = null;
		$recordSet = $this->connectionDB->executeSqlCommand($this->getOneSqlCommand($id));

		if ($row = $recordSet->fetch_array(MYSQLI_BOTH)) {
			$author = new Author($row['name']);
		}

		return $author;
	}

	function getList()
	{
		return $this->connectionDB->executeSqlCommand($this->getListSqlCommand());
	}

	// Sql Commands

	private function getDeleteSqlCommand(int $id)
	{
		return "CALL deleteAuthor({$id})";
	}

	private function getOneSqlCommand(int $id)
	{
		return "CALL getAuthor({$id})";
	}

	private function getListSqlCommand()
	{
		return "CALL getAuthorsList()";
	}
}
