<?php
session_start();

$user = $_SESSION["user"];
$roles = $_SESSION["roles"];

$isAdmin = false;
$isValidator = false;
$isChecker = false;

for ($i = 0; $i < count($roles); $i++) {
	if ($roles[$i] == "administrator") {
		$isAdmin = true;
	} else if ($roles[$i] == "validator") {
		$isValidator = true;
	} else if ($roles[$i] == "checker") {
		$isChecker = true;
	}
}

?>

<nav class="navbar navbar-expand-lg bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="dashboard.php">
			<img src="https://upload.wikimedia.org/wikipedia/commons/a/ab/Logo_TV_2015.png" alt="Company logo" width="30" height="24">
			Company Name
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<?php
				if (!$isAdmin) {
				?>
					<li class="nav-item">
						<a class="nav-link" aria-current="page" href="evidence-list.php">Evidences</a>
					</li>
				<?php // End if
				}
				?>

				<?php
				if ($isAdmin) {
				?>
					<li class="nav-item">
						<a class="nav-link" aria-current="page" href="user-list.php">Users</a>
					</li>
				<?php // End if
				}
				?>

				<?php
				if (!$isAdmin) {
				?>
					<li class="nav-item">
						<a class="nav-link" aria-current="page" href="author-list.php">Authors</a>
					</li>
				<?php // End if
				}
				?>
			</ul>
		</div>
	</div>
</nav>