<?php
include '../models/Evidence.php';
include '../controllers/connectionDB.controller.php';
include '../controllers/evidence.controller.php';

// Query users
$controlEvidence = new ControlEvidence();
$result = $controlEvidence->getList();

// start.php vars
$doc_title = "Company Name | Evidence List";
?>

<?php require("./layout/start.php") ?>
<?php require("./components/dashboard/header.php") ?>

<!-- Content -->
<div class="container flex-grow-1 marketing">
	<div class="row my-3">
		<div class="col-12 col-md-6 mb-3 mb-md-0">
			<h1 class="m-0">Evidences List</h1>
		</div>
		<div class="col-12 col-md-6">
			<a class="btn btn-primary float-md-end" href="evidence-form.php?action=create">Add evidence</a>
		</div>
	</div>
	<div class="row mb-2">
		<div class="col">
			<table class="table table-striped">
				<thead>
					<tr>
						<td>Title</td>
						<td>Description</td>
						<td>Direccion</td>
						<td>Tipo</td>
						<td>Latitud</td>
						<td>Longitud</td>
						<td>Actions</td>
					</tr>
				</thead>
				<tbody>
					<?php while ($res = mysqli_fetch_array($result)) { ?>
						<tr>
							<td><?php echo $res['title'] ?> </td>
							<td><?php echo $res['description'] ?> </td>
							<td><?php echo $res['dir'] ?> </td>
							<td><?php echo $res['tipe'] ?> </td>
							<td><?php echo $res['lat'] ?> </td>
							<td><?php echo $res['lon'] ?> </td>
							<td>
								<div class="btn-group">
									<a class="btn btn-primary" href="evidence-form.php?action=edit&id=<?= $res["id"] ?>">Edit</a>
									<a class="btn btn-danger" href="evidence-form.php?action=delete&id=<?= $res["id"] ?>" onClick="return confirm('Are you sure you want to delete?')">Delete</a>
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