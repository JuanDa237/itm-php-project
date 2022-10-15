<?php
include '../models/Evidence.php';
include '../controllers/connectionDB.controller.php';
include '../controllers/evidence.controller.php';

$action = "";
$id = 0;

if (isset($_GET['action'])) $action = $_GET['action'];
if (isset($_GET['id'])) $id = $_GET['id'];

// Query evidence
$evidence = new Evidence("", "", "", "", 0, 0);

if ($action == 'edit') {
	$controlEvidence = new ControlEvidence();
	$evidence = $controlEvidence->getOne($id);
}

// Handle Submit
$evidenceController = new ControlEvidence();

if (isset($_POST['action'])) {
	$evidence = new Evidence($_POST['title'], $_POST['description'], $_POST['dir'], $_POST['tipe'], $_POST['lat'], $_POST['lon']);

	switch ($_POST['action']) {
		case 'create':
			$evidenceController->create($evidence);
			break;
		case 'edit':
			$evidenceController->update($_POST['id'], $evidence);
			break;
		case 'default':
			echo "This actions doesn't exist";
			break;
	}

	header("Location:evidence-list.php");
} else if ($action == 'delete') {

	$evidenceController->delete($id);
	header("Location:evidence-list.php");
}

// start.php vars
$doc_title = "Company Name | Evidence Form";
?>

<?php require("./layout/start.php") ?>
<?php require("./components/dashboard/header.php") ?>

<!-- Content -->
<div class="container flex-grow-1 marketing">
	<div class="row my-3">
		<div class="col-12 col-md-6 mb-3 mb-md-0">
			<h1 class="m-0">Evidence Form</h1>
		</div>
		<div class="col-12 col-md-6">
			<a class="btn btn-primary float-md-end" href="evidence-list.php">Go Back</a>
		</div>
	</div>
	<div class="row mb-12">
		<form id="form" class="col-12 col-xl-6" action="evidence-form.php" method="POST">

			<div class="col-12 mb-2">
				<label for="title" class="form-label">Title</label>
				<input class="form-control" type="text" placeholder="Titulo" name="title" id="title" value="<?php echo $evidence->getTitle() ?>" />
				<div class="invalid-feedback" id="title-error"></div>
			</div>

			<div class="col-12 mb-2">
				<label for="description" class="form-label">Description</label>
				<textarea class="form-control" rows="4" placeholder="Description" name="description" id="description"><?php echo $evidence->getDescription() ?></textarea>
				<div class="invalid-feedback" id="description-error"></div>
			</div>

			<div class="col-12 mb-2">
				<label for="dir" class="form-label">Dir</label>
				<input class="form-control" type="text" placeholder="Dir" name="dir" id="dir" value="<?php echo $evidence->getDir() ?>" />
				<div class="invalid-feedback" id="dir-error"></div>
			</div>

			<div class="col-12 mb-2">
				<label for="tipe" class="form-label">Tipe</label>
				<input class="form-control" type="text" placeholder="Tipe" name="tipe" id="tipe" value="<?php echo $evidence->getTipe() ?>" />
				<div class="invalid-feedback" id="tipe-error"></div>
			</div>

			<div class="col-12 mb-2">
				<label for="lat" class="form-label">Latitude</label>
				<input class="form-control" type="number" name="lat" id="lat" value="<?php echo $evidence->getLat() ?>" />
				<div class="invalid-feedback" id="lat-error"></div>
			</div>

			<div class="col-12 mb-2">
				<label for="lon" class="form-label">Longitude</label>
				<input class="form-control" type="number" name="lon" id="lon" value="<?php echo $evidence->getLon() ?>" />
				<div class="invalid-feedback" id="lon-error"></div>
			</div>

			<div class="col-12 mb-2">
				<img src="<?php echo $evidence->getDir() ?>" alt="">
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
		let title = document.getElementById('title');

		if (title.value.trim().length == 0) {
			title.classList.add("is-invalid");
			errors = true;

			let evidenceError = document.getElementById("title-error");
			evidenceError.innerHTML = 'Please provide a Title.';
		}

		let description = document.getElementById('description');

		if (description.value.trim().length == 0) {
			description.classList.add("is-invalid");
			errors = true;

			let evidenceError = document.getElementById("description-error");
			evidenceError.innerHTML = 'Please provide a description.';
		}

		let dir = document.getElementById('dir');

		if (dir.value.trim().length == 0) {
			dir.classList.add("is-invalid");
			errors = true;

			let evidenceError = document.getElementById("dir-error");
			evidenceError.innerHTML = 'Please provide a direction.';
		}

		let tipe = document.getElementById('tipe');

		if (tipe.value.trim().length == 0) {
			tipe.classList.add("is-invalid");
			errors = true;

			let evidenceError = document.getElementById("tipe-error");
			evidenceError.innerHTML = 'Please provide a tipe.';
		}

		if (errors)
			return;
		else
			this.submit();
	}
</script>

<?php require("./components/dashboard/footer.php") ?>
<?php require("./layout/end.php") ?>