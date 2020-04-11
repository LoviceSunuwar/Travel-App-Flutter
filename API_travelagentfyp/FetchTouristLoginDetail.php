<?php

include 'connection.php';

$Username = '';
$Email = '';
$Password = '';

if (isset($_POST['_Username'])) {
	$Username = $_POST['_Username'];
}

if (isset($_POST['_Email'])) {
	$Email = $_POST['_Email'];
}

if (isset($_POST['_Password'])) {
	$Password = $_POST['_Password'];
}


$sql=$Connect->query("INSERT INTO login (Username, Email, Password, loginlevel ) VALUES ('".$Username."', '".$Email."', '".$Password."', 'Tourist')");

?>