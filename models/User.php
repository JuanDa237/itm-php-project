<?php

class User
{
	private string $user;
	private string $password;

	function __construct(string $user, string $password)
	{
		$this->user = $user;
		$this->password = $password;
	}

	// Getters And Setters

	function setUser($user)
	{
		$this->user = $user;
	}

	function getUser()
	{
		return $this->user;
	}

	function setPassword($password)
	{
		$this->password = $password;
	}

	function getPassword()
	{
		return $this->password;
	}

	// SQL Commands

	function getCreateSqlCommand()
	{
		return "CALL createUser('{$this->user}', '{$this->password}')";
	}

	function getUpdateSqlCommand(int $id)
	{
		return "CALL updateUser({$id}, '{$this->user}', '{$this->password}')";
	}

	function getLoginSqlCommand()
	{
		return "CALL login('{$this->user}', '{$this->password}')";
	}
}
