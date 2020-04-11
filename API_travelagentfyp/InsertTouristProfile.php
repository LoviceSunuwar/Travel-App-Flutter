<?php

include 'connection.php';

$FirstName = '';
$LastName = '';
$Age = '';
$T_Address = '';
$P_Address = '';
$Contactno = '';
$About = '';


if (isset($_POST['_FristName'])) {
	$FirstName = $_POST['_FirstName'];
}


if (isset($_POST['_LastName'])) {
	$LastName = $_POST['_LastName'];
}

if (isset($_POST['_Age'])) {
	$Age = $_POST['_Age'];
}

if (isset($_POST['_TAddress'])) {
	$T_Address = $_POST['_TAddress'];
}

if (isset($_POST['_PAddress'])) {
	$P_Address = $_POST['_PAddress'];
}

if (isset($_POST['_Contact'])) {
	$Contactno = $_POST['_Contact'];
}

if (isset($_POST['_About'])) {
	$About = $_POST['_About'];
}


$sql=$Connect->query("INSERT INTO touristprofile 
	(FirstName, LastName, Age, T_Address, P_Address, Contactno, About )
	 VALUES
	  ('".$FirstName."', '".$LastName."', '".$Age."','".$T_address."', '".$P_address."','".$Contact."','".$About."')");


?>
