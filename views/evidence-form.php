<?php
include '../models/Evidence.php';
include '../models/Author.php';
include '../controllers/connectionDB.controller.php';
include '../controllers/evidence.controller.php';
include '../controllers/author.controller.php';

$action = "";
$id = 0;

if (isset($_GET['action'])) $action = $_GET['action'];
if (isset($_GET['id'])) $id = $_GET['id'];

// Query evidence
$evidence = new Evidence("", "", "", "", 0, 0, []);

// Query authors
$controlAuthor = new ControlAuthor();
$authors = $controlAuthor->getList();

if ($action == 'edit') {
	$controlEvidence = new ControlEvidence();
	$evidence = $controlEvidence->getOne($id);
}

// Get Loged User
$userId = 1; // For now is generic

// Handle Submit
$evidenceController = new ControlEvidence();

if (isset($_POST['action'])) {
	$newAuthors = $_POST['authors'];
	$authorsIds =  array();

	for ($i = 0; $i < count($newAuthors); $i++) {
		array_push($authorsIds, $newAuthors[$i]["id"]);
	}

	$evidence = new Evidence($_POST['title'], $_POST['description'], $_POST['dir'], $_POST['tipe'], $_POST['lat'], $_POST['lon'], $authorsIds);

	$state = "unverified";
	if (isset($_POST['state'])) {
		$state = $_POST['state'];
	}

	switch ($_POST['action']) {
		case 'create':
			$evidenceController->create($evidence, $userId, "unverified");
			break;
		case 'edit':
			$evidenceController->update($_POST['id'], $evidence, $userId, $state);
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
				<label for="dir" class="form-label">Image Url</label>
				<input class="form-control" type="text" placeholder="Image Url" name="dir" id="dir" value="<?php echo $evidence->getDir() ?>" />
				<div class="invalid-feedback" id="dir-error"></div>
			</div>

			<div class="col-12 mb-2">
				<label for="tipe" class="form-label">Tipe</label>
				<input class="form-control" type="text" placeholder="Tipe" name="tipe" id="tipe" value="<?php echo $evidence->getTipe() ?>" />
				<div class="invalid-feedback" id="tipe-error"></div>
			</div>

			<div class="col-12 mb-2">
				<label for="lat" class="form-label">Latitude</label>
				<input class="form-control" type="number" name="lat" id="lat" value="<?php echo $evidence->getLat() ?>" required />
				<div class="invalid-feedback" id="lat-error"></div>
			</div>

			<div class="col-12 mb-2">
				<label for="lon" class="form-label">Longitude</label>
				<input class="form-control" type="number" name="lon" id="lon" value="<?php echo $evidence->getLon() ?>" required />
				<div class="invalid-feedback" id="lon-error"></div>
			</div>

			<?php
			if ($action == "edit" && $isValidator) {
			?>
				<div class="col-12 mb-2">
					<label for="state" class="form-label">Estado</label>
					<select class="form-select" name="state" id="state">
						<option value="unverified">No verificado</option>
						<option value="verified">Verificado</option>
						<option value="validated">Validado</option>
					</select>
				</div>
			<?php // End if
			}
			?>

			<div class="col-12 mb-2">
				<img src="<?php echo $evidence->getDir() ?>" alt="">
			</div>

			<div class="col-12 mb-2">
				<div class="card">
					<div class="card-header">
						Authors
					</div>
					<div id="author-container" class="card-body">
						<div class="mb-2">
							<button type="button" class="btn btn-primary" onclick="addAuthor()">Add Author</button>
							<button type="button" class="btn btn-danger" onclick="deleteAuthor()">Delete</button>
						</div>

						<div id="author-select" class="row mb-2">
							<div class="col-8">
								<select class="form-select" name="authors[0][id]" id="author">
									<option value="">Select One</option>

									<?php while ($res = mysqli_fetch_array($authors)) { ?>
										<option value="<?php echo $res['id'] ?>"><?php echo $res['name'] ?></option>
									<?php // End while
									}
									?>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 mb-2 d-flex justify-content-end">
				<input type="hidden" name="id" value=<?= $id ?>>
				<input type="hidden" name="action" value=<?= $action ?>>
				<input class="btn btn-primary text-capitalize" type="submit" name="btn" value="<?= $action ?>" />
			</div>
		</form>
	</div>
</div>

<!-- JS Authors Handlers -->
<script>
	var container = document.getElementById('author-container');
	var row = document.getElementById('author-select');

	var authors = [];
	authors.push(row);

	function addAuthor(e) {
		const copy = row.cloneNode(true);

		copy.getElementsByTagName('select')[0].setAttribute('name', `authors[${authors.length}][id]`);

		authors.push(copy);
		container.appendChild(copy);
	}

	function deleteAuthor() {
		let last = authors.pop();
		last.remove();
	}
</script>


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