<?php
include '../models/Author.php';
include '../controllers/connectionDB.controller.php';
include '../controllers/author.controller.php';

// Query authors
$controlAuthor = new ControlAuthor();
$result = $controlAuthor->getList();

// start.php vars
$doc_title = "Company Name | Author List";
?>

<?php require("./layout/start.php") ?>
<?php require("./components/dashboard/header.php") ?>

<!-- Content -->
<div class="container flex-grow-1 marketing">
	<div class="row my-3">
		<div class="col-12 col-md-6 mb-3 mb-md-0">
			<h1 class="m-0">Authors List</h1>
		</div>
		<div class="col-12 col-md-6">
			<a class="btn btn-primary float-md-end" href="author-form.php?action=create">Add Author</a>
		</div>
	</div>
	<div class="row mb-2">
		<div class="col">
			<table class="table table-striped">
				<thead>
					<tr>
						<td>Name</td>
						<td>Actions</td>
					</tr>
				</thead>
				<tbody>
					<?php while ($res = mysqli_fetch_array($result)) { ?>
						<tr>
							<td><?php echo $res['name'] ?> </td>
							<td>
								<div class="btn-group">
									<a class="btn btn-primary" href="author-form.php?action=edit&id=<?= $res["id"] ?>">Edit</a>
									<a class="btn btn-danger" href="author-form.php?action=delete&id=<?= $res["id"] ?>" onClick="return confirm('Are you sure you want to delete?')">Delete</a>
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