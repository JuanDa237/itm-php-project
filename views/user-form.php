<?php
include '../models/User.php';
include '../controllers/connectionDB.controller.php';
include '../controllers/user.controller.php';
include '../controllers/role.controller.php';

$action = "";
$id = 0;
if (isset($_GET['action'])) $action = $_GET['action'];
if (isset($_GET['id'])) $id = $_GET['id'];

// Query user
$actualUser = new User("", "", []);

// Query roles
$controlRole = new ControlRole();
$roles = $controlRole->getList();

if ($action == 'edit') {
	$controlUser = new ControlUser();
	$actualUser = $controlUser->getOne($id);
}

// Handle Submit
$userController = new ControlUser();

if (isset($_POST['action'])) {
	$newRoles = $_POST['roles'];
	$rolesIds =  array();

	for ($i = 0; $i < count($newRoles); $i++) {
		array_push($rolesIds, $newRoles[$i]["id"]);
	}

	$actualUser = new User($_POST['user'], $_POST['password'], $rolesIds);

	switch ($_POST['action']) {
		case 'create':
			$userController->create($actualUser);
			break;
		case 'edit':
			$userController->update($_POST['id'], $actualUser);
			break;
		case 'default':
			echo "This actions doesn't exist";
			break;
	}

	header("Location:user-list.php");
} else if ($action == 'delete') {

	$userController->delete($id);
	header("Location:user-list.php");
}

// start.php vars
$doc_title = "Company Name | User Form";
?>

<?php require("./layout/start.php") ?>
<?php require("./components/dashboard/header.php") ?>

<!-- Content -->
<div class="container flex-grow-1 marketing">
	<div class="row my-3">
		<div class="col-12 col-md-6 mb-3 mb-md-0">
			<h1 class="m-0">User Form</h1>
		</div>
		<div class="col-12 col-md-6">
			<a class="btn btn-primary float-md-end" href="user-list.php">Go Back</a>
		</div>
	</div>
	<div class="row mb-2">
		<form id="form" class="col-12 col-xl-6" action="user-form.php" method="POST">
			<div class="col-12 mb-2">
				<label for="user" class="form-label">User</label>
				<input class="form-control" type="text" placeholder="Juan" name="user" id="user" value="<?php echo $actualUser->getUser() ?>" />
				<div class="invalid-feedback" id="user-error"></div>
			</div>
			<div class="col-12 mb-2">
				<label for="password" class="form-label">Password</label>
				<input class="form-control" type="text" placeholder="Secure123" name="password" id="password" value="<?php echo $actualUser->getPassword() ?>" />
				<div class="invalid-feedback" id="password-error"></div>
			</div>

			<div class="col-12 mb-2">
				<div class="card">
					<div class="card-header">
						Roles
					</div>
					<div id="role-container" class="card-body">
						<div class="mb-2">
							<button type="button" class="btn btn-primary" onclick="addRole()">Add Role</button>
							<button type="button" class="btn btn-danger" onclick="deleteRole()">Delete</button>
						</div>

						<div id="role-select" class="row mb-2">
							<div class="col-8">
								<select class="form-select" name="roles[0][id]" id="role">
									<option value="">Select One</option>

									<?php while ($res = mysqli_fetch_array($roles)) { ?>
										<option value="<?php echo $res['id'] ?>"><?php echo $res['role'] ?></option>
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
	var container = document.getElementById('role-container');
	var row = document.getElementById('role-select');

	var roles = [];
	roles.push(row);

	function addRole(e) {
		const copy = row.cloneNode(true);

		copy.getElementsByTagName('select')[0].setAttribute('name', `roles[${roles.length}][id]`);

		roles.push(copy);
		container.appendChild(copy);
	}

	function deleteRole() {
		let last = roles.pop();
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
		let user = document.getElementById('user');

		if (user.value.trim().length == 0) {
			user.classList.add("is-invalid");
			errors = true;

			let userError = document.getElementById("user-error");
			userError.innerHTML = 'Please provide a user.';
		}

		let password = document.getElementById('password');

		if (password.value.trim().length == 0) {
			password.classList.add("is-invalid");
			errors = true;

			let userError = document.getElementById("password-error");
			userError.innerHTML = 'Please provide a password.';
		}

		if (errors)
			return;
		else
			this.submit();
	}
</script>

<?php require("./components/dashboard/footer.php") ?>
<?php require("./layout/end.php") ?>