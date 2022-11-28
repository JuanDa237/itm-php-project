<?php

class ControlRole
{
	private ConnectionDB $connectionDB;

	function __construct()
	{
		$this->connectionDB = new ConnectionDB();
	}

	function getList()
	{
		return $this->connectionDB->executeSqlCommand($this->getListSqlCommand());
	}

	// Sql Commands

	private function getListSqlCommand()
	{
		return "CALL getRoleList()";
	}
}
