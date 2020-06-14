<?php 
require_once './script/pdocrud.php'; 
//include './includes/header.php';

$pdo_crud = new PDOCrud();
$pdo_crud->unsetUserSession("Admin");
$pdo_crud->formRedirection("http://localhost/Invoicing/index.php");
header("Location:http://localhost/Invoicing/index.php");
