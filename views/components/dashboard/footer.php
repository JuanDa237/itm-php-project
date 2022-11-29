<div class="container-fluid">
	<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
		<p class="col-md-4 mb-0 text-muted">© 2022 Company Name</p>

		<a href="dashboard.php" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<img src="https://upload.wikimedia.org/wikipedia/commons/a/ab/Logo_TV_2015.png" alt="Company logo" width="50" height="34" class="d-inline-block align-text-top">
		</a>

		<ul class="nav col-md-4 justify-content-end">
			<?php
			if (!$isAdmin) {
			?>
				<li class="nav-item">
					<a class="nav-link px-2 text-muted" aria-current="page" href="evidence-list.php">Evidences</a>
				</li>
			<?php // End if
			}
			?>

			<?php
			if ($isAdmin) {
			?>
				<li class="nav-item">
					<a class="nav-link px-2 text-muted" aria-current="page" href="user-list.php">Users</a>
				</li>
			<?php // End if
			}
			?>

			<?php
			if (!$isAdmin) {
			?>
				<li class="nav-item">
					<a class="nav-link px-2 text-muted" aria-current="page" href="author-list.php">Authors</a>
				</li>
			<?php // End if
			}
			?>
		</ul>
	</footer>
</div>