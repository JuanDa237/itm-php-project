<?php

class ControlUser
{
	private ConnectionDB $connectionDB;

	function __construct()
	{
		$this->connectionDB = new ConnectionDB();
	}

	function create(User $user)
	{
		$this->connectionDB->executeSqlCommand($user->getCreateSqlCommand());
	}

	function update(int $id, User $user)
	{
		$this->connectionDB->executeSqlCommand($user->getUpdateSqlCommand($id));
	}

	function delete(int $id)
	{
		$this->connectionDB->executeSqlCommand($this->getDeleteSqlCommand($id));
	}

	function getOne(int $id)
	{
		$user = null;
		$recordSet = $this->connectionDB->executeSqlCommand($this->getOneSqlCommand($id));

		if ($row = $recordSet->fetch_array(MYSQLI_BOTH)) {
			$user = new User($row['user'], $row['password']);
		}

		return $user;
	}

	function getList()
	{
		return $this->connectionDB->executeSqlCommand($this->getListSqlCommand());
	}

	function login(User $user)
	{
		$newUser = null;
		$recordSet = $this->connectionDB->executeSqlCommand($user->getLoginSqlCommand());

		if ($row = $recordSet->fetch_array(MYSQLI_BOTH)) {
			$newUser = new User($row['user'], $row['password']);
		}

		return $newUser;
	}

	// Sql Commands

	private function getDeleteSqlCommand(int $id)
	{
		return "CALL deleteUser({$id})";
	}

	private function getOneSqlCommand(int $id)
	{
		return "CALL getUser({$id})";
	}

	private function getListSqlCommand()
	{
		return "CALL getUserList()";
	}
}
