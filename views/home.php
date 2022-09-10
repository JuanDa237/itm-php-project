<?php
// start.php vars
$doc_title = "Company Name | Home";
?>

<?php require("./views/layout/start.php") ?>
<?php require("./views/components/home/header.php") ?>

<!-- Styles -->
<?php require("./views/styles/index-css.php") ?>

<!-- Content -->
<div class="container flex-grow-1 marketing">
	<?php require("./views/components/home/members.php") ?>
	<?php require("./views/components/home/company.php") ?>
</div>

<?php require("./views/components/home/footer.php") ?>
<?php require("./views/layout/end.php") ?>