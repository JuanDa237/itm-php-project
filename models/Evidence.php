<?php

class Evidence
{

	private string $title;
	private string $description;
	private string $dir;
	private string $tipe;
	private int $lat;
	private int $lon;

	function __construct(string $title, string $description, string $dir, string $tipe, int $lat, int $lon)
	{
		$this->title = $title;
		$this->description = $description;
		$this->dir = $dir;
		$this->tipe = $tipe;
		$this->lat = $lat;
		$this->lon = $lon;
	}

	// Getters

	function getTitle()
	{
		return $this->title;
	}

	function getDescription()
	{
		return $this->description;
	}

	function getDir()
	{
		return $this->dir;
	}

	function getTipe()
	{
		return $this->tipe;
	}

	function getLat()
	{
		return $this->lat;
	}

	function getLon()
	{
		return $this->lon;
	}

	// Setters

	function setTitle($title)
	{
		$this->title = $title;
	}

	function setDescription($description)
	{
		$this->description = $description;
	}

	function setDir($dir)
	{
		$this->dir = $dir;
	}

	function setTipe($tipe)
	{
		$this->tipe = $tipe;
	}

	function setLat($lat)
	{
		$this->lat = $lat;
	}

	function setLon($lon)
	{
		$this->lon = $lon;
	}

	// SQL Commands

	function getCreateSqlCommand()
	{
		return "CALL createEvidence('{$this->title}','{$this->description}','{$this->dir}','{$this->tipe}', {$this->lat}, {$this->lon})";
	}

	function getUpdateSqlCommand(int $id)
	{
		return "CALL updateEvidence({$id}, '{$this->title}','{$this->description}','{$this->dir}','{$this->tipe}', {$this->lat}, {$this->lon})";
	}
}
