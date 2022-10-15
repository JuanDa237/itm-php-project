<?php

class Author
{
	private string $name;

	function __construct(string $name)
	{
		$this->name = $name;
	}

	// Getters And Setters

	function setName($name)
	{
		$this->name = $name;
	}

	function getName()
	{
		return $this->name;
	}

	// SQL Commands

	function getCreateSqlCommand()
	{
		return "CALL createAuthor('{$this->name}')";
	}

	function getUpdateSqlCommand(int $id)
	{
		return "CALL updateAuthor({$id}, '{$this->name}')";
	}
}
