<?php
// start.php vars
$doc_title = "Company Name | Dashboard";

if (isset($_POST['action']) && $_POST['action'] == 'close') {
	session_destroy();
	header("Location:login.php");
}

?>

<?php require("./layout/start.php") ?>
<?php require("./components/dashboard/header.php") ?>

<!-- Content -->
<div class="container flex-grow-1 marketing">
	<div class="row">
		<div class="col-12">
			<h1 class="mt-5">Bienvenido <span class="text-danger"><?php echo $user ?></span> Al Sistema de Verificacion Y Validacion De Evidencias</h1>
		</div>
		<div class="col-12">
			<form id="form" action="dashboard.php" method="POST">
				<button type="submit" class="btn btn-danger" name="action" value="close">Cerrar Seccion</button>
			</form>
		</div>
	</div>
</div>

<?php require("./components/dashboard/footer.php") ?>
<?php require("./layout/end.php") ?>