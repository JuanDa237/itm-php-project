<?php
include '../models/Author.php';
include '../controllers/connectionDB.controller.php';
include '../controllers/author.controller.php';

$action = "";
$id = 0;
if (isset($_GET['action'])) $action = $_GET['action'];
if (isset($_GET['id'])) $id = $_GET['id'];

// Query author
$author = new Author("");

if ($action == 'edit') {
	$controlAuthor = new ControlAuthor();
	$author = $controlAuthor->getOne($id);
}

// Handle Submit
$authorController = new ControlAuthor();

if (isset($_POST['action'])) {
	$author = new Author($_POST['name']);

	switch ($_POST['action']) {
		case 'create':
			$authorController->create($author);
			break;
		case 'edit':
			$authorController->update($_POST['id'], $author);
			break;
		case 'default':
			echo "This actions doesn't exist";
			break;
	}

	header("Location:author-list.php");
} else if ($action == 'delete') {

	$authorController->delete($id);
	header("Location:author-list.php");
}

// start.php vars
$doc_title = "Company Name | Author Form";
?>

<?php require("./layout/start.php") ?>
<?php require("./components/dashboard/header.php") ?>

<!-- Content -->
<div class="container flex-grow-1 marketing">
	<div class="row my-3">
		<div class="col-12 col-md-6 mb-3 mb-md-0">
			<h1 class="m-0">Author Form</h1>
		</div>
		<div class="col-12 col-md-6">
			<a class="btn btn-primary float-md-end" href="author-list.php">Go Back</a>
		</div>
	</div>
	<div class="row mb-2">
		<form id="form" class="col-12 col-xl-6" action="author-form.php" method="POST">
			<div class="col-12 mb-2">
				<label for="name" class="form-label">Name</label>
				<input class="form-control" type="text" placeholder="Juan" name="name" id="name" value="<?php echo $author->getName() ?>" />
				<div class="invalid-feedback" id="name-error"></div>
			</div>
			<div class="col-12 mb-2 d-flex justify-content-end">
				<input type="hidden" name="id" value=<?= $id ?>>
				<input type="hidden" name="action" value=<?= $action ?>>
				<input class="btn btn-primary text-capitalize" type="submit" name="btn" value="<?= $action ?>" />
			</div>
		</form>
	</div>
</div>

<!-- JS Form Validations -->
<script>
	document.addEventListener("DOMContentLoaded", function() {
		document.getElementById("form").addEventListener('submit', validateForm);
	});

	function validateForm(event) {
		event.preventDefault();

		let errors = false;
		let name = document.getElementById('name');

		if (name.value.trim().length == 0) {
			name.classList.add("is-invalid");
			errors = true;

			let nameError = document.getElementById("name-error");
			nameError.innerHTML = 'Please provide a user.';
		}

		if (errors)
			return;
		else
			this.submit();
	}
</script>

<?php require("./components/dashboard/footer.php") ?>
<?php require("./layout/end.php") ?>