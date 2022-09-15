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
		return "INSERT INTO user VALUES(NULL, '" . $this->user . "','" . $this->password . "')";
	}

	function getUpdateSqlCommand(int $id)
	{
		return "UPDATE user SET user='" . $this->user . "', password='" . $this->password . "' WHERE id='" . $id . "'";
	}
}
