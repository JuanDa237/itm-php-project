<?php

class ConnectionDB
{

	private mysqli|null $connection;

	private string $server;
	private string $user;
	private string $password;
	private string $db;
	private int $port;

	function __construct()
	{
		$this->connection = null;
		$this->server = "localhost";
		$this->user = "root";
		$this->password = "";
		$this->db = "evidencedb";
		$this->port = 3306;
	}

	private function openDB()
	{
		try {
			$this->connection = new mysqli($this->server, $this->user, $this->password, $this->db, $this->port);

			if ($this->connection->connect_errno) {
				printf("BD Connection failed: %s\n", $this->connection->connect_error);
				exit();
			}
		} catch (Exception $e) {
			echo "Error in the opening connection with the DB: " . $e->getMessage() . "\n";
		}
	}

	private function closeDB()
	{
		try {
			$this->connection->close();
		} catch (Exception $e) {
			echo "Error in the closing connection with the DB: " . $e->getMessage() . "\n";
		}
	}

	function executeSqlCommand($sql)
	{
		$this->openDB();

		try {
			$response = $this->connection->query($sql);
		} catch (Exception $e) {
			echo "Error in executing the sql command: " . $e->getMessage() . "\n";
		}

		$this->closeDB();

		return $response;
	}
}
