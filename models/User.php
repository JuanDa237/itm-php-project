<?php

class User
{
	private string $user;
	private string $password;
	private array $roles;

	function __construct(string $user, string $password, array $roles)
	{
		$this->user = $user;
		$this->password = $password;
		$this->roles = $roles;
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

	function setRoles($roles)
	{
		$this->roles = $roles;
	}

	function getRoles()
	{
		return $this->roles;
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
