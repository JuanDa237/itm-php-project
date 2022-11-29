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

		$result = $this->connectionDB->executeSqlCommand($this->getLastIdCommand());
		$id = -1;

		if ($row = $result->fetch_array(MYSQLI_BOTH)) {
			$id = $row['max'];
		}

		$roles = $user->getRoles();

		for ($i = 0; $i < count($roles); $i++) {
			$this->connectionDB->executeSqlCommand($this->getInsertRoleCommand($id, $roles[$i]));
		}

		return $id;
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
			$user = new User($row['user'], $row['password'], []);
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

		if ($recordSet->num_rows > 0) {
			$user = "";
			$roles = array();

			while ($row = mysqli_fetch_array($recordSet)) {
				$user = $row['user'];
				array_push($roles, $row['role']);
			}

			$newUser = new User($user, "", $roles);
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

	private function getLastIdCommand()
	{
		return "SELECT MAX(id) as max FROM user";
	}

	private function getInsertRoleCommand($id, $roleId)
	{
		return "CALL createUserRole({$id}, {$roleId})";
	}
}
