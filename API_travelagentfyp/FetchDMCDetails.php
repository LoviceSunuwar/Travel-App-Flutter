<?php

include 'Connection.php';



$MinimumPrice = '';
$Detail = '';
$MaximumPrice = '';

if (isset($_POST['_MinPrice'])) {
	$MinimumPrice = $_POST['_MinPrice'];
}

if (isset($_POST['_DMCDetail'])) {
	$Detail = $_POST['_DMCDetail'];
}

if (isset($_POST['_MaxPrice'])) {
	$MaximumPrice = $_POST['_MaxPrice'];
}


$sql=$Connect->query("INSERT INTO dmc 
	(Detail, MinimumPrice, MaximumPrice)
	 VALUES
	  ('".$Detail."','".$MinimumPrice."', '".$MaximumPrice."')");


?>