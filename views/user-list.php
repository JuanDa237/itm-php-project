<?php
include '../models/User.php';
include '../controllers/connectionDB.controller.php';
include '../controllers/user.controller.php';

// Query users
$controlUser = new ControlUser();
$result = $controlUser->getList();

// start.php vars
$doc_title = "Company Name | User List";
?>

<?php require("./layout/start.php") ?>
<?php require("./components/dashboard/header.php") ?>

<!-- Content -->
<div class="container flex-grow-1 marketing">
	<div class="row my-3">
		<div class="col-6">
			<h1 class="m-0">Listado De Usuarios</h1>
		</div>
		<div class="col-6">
			<a class="btn btn-primary float-end" href="user-form.php?action=create">Add User</a>
		</div>
	</div>
	<div class="row mb-2">
		<div class="col">
			<table class="table table-striped">
				<thead>
					<tr>
						<td>User</td>
						<td>Actions</td>
					</tr>
				</thead>
				<tbody>
					<?php while ($res = mysqli_fetch_array($result)) { ?>
						<tr>
							<td><?php echo $res['user'] ?> </td>
							<td>
								<div class="btn-group">
									<a class="btn btn-primary" href="user-form.php?action=edit&id=<?= $res["id"] ?>">Edit</a>
									<a class="btn btn-danger" href="user-form.php?action=delete&id=<?= $res["id"] ?>" onClick="return confirm('Are you sure you want to delete?')">Delete</a>
								</div>
							</td>
						</tr>
					<?php // End while
					}
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<?php require("./components/dashboard/footer.php") ?>
<?php require("./layout/end.php") ?>