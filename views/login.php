<?php
include '../models/User.php';
include '../controllers/connectionDB.controller.php';
include '../controllers/user.controller.php';

$user = new User("", "");
$error = false;

// Submit Login Handle

if (isset($_POST['action'])) {
	$user = new User($_POST['user'], $_POST['password']);
	$userController = new ControlUser();
	$user = $userController->login($user);

	if (is_null($user)) {
		$error = true;
		$user = new User("", "");
	} else {
		header("Location:user-list.php");
	}
}

// start.php vars
$doc_title = "Company Name | Login";
?>

<?php require("./layout/start.php") ?>

<section class="h-100">
	<div class="container h-100">
		<div class="row justify-content-sm-center h-100">
			<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
				<div class="text-center my-5">
					<img src="https://upload.wikimedia.org/wikipedia/commons/a/ab/Logo_TV_2015.png" alt="logo" width="100">
				</div>
				<div class="card shadow-lg">
					<div class="card-body p-5">
						<h1 class="fs-4 card-title fw-bold mb-4">Login</h1>

						<?php if ($error) { ?>
							<div class="alert alert-danger" role="alert">
								The User And Password Are Wrong!
							</div>
						<?php } ?>

						<form id="form" action="login.php" method="POST">
							<div class="mb-3">
								<label for="user" class="form-label">User</label>
								<input class="form-control" type="text" placeholder="Juan" name="user" id="user" value="<?php echo $user->getUser() ?>" />
								<div class="invalid-feedback" id="user-error"></div>
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Password</label>
								<input class="form-control" type="password" placeholder="*****" name="password" id="password" value="<?php echo $user->getPassword() ?>" />
								<div class="invalid-feedback" id="password-error"></div>
							</div>

							<div class="d-flex align-items-center">
								<input type="hidden" name="action" value="login">
								<button type="submit" class="btn btn-primary ms-auto" name="btn" value="login">
									Login
								</button>
							</div>
						</form>
					</div>
				</div>
				<div class="text-center mt-5 text-muted">
					Copyright &copy; 2017-2021 &mdash; Your Company
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		document.getElementById("form").addEventListener('submit', validateForm);
	});

	function validateForm(event) {
		event.preventDefault();

		let errors = false;
		let user = document.getElementById('user');
		let userError = document.getElementById("user-error");

		if (user.value.trim().length == 0) {
			user.classList.add("is-invalid");
			errors = true;

			userError.innerHTML = 'Please provide a user.';
		} else {
			user.classList.remove("is-invalid");
			userError.innerHTML = '';
		}

		let password = document.getElementById('password');
		let passwordError = document.getElementById("password-error");

		if (password.value.trim().length == 0) {
			password.classList.add("is-invalid");
			errors = true;

			passwordError.innerHTML = 'Please provide a password.';
		} else {
			password.classList.remove("is-invalid");
			passwordError.innerHTML = '';
		}

		if (errors)
			return;
		else
			this.submit();
	}
</script>

<?php require("./layout/end.php") ?>