<?php

	include 'connection.php';

$Email = '';
$Password = '';

if (isset($_POST['_Email'])) {
	$Email = $_POST['_Email'];
}

if (isset($_POST['_Password'])) {
	$Password = $_POST['_Password'];
}


	

	$sql=$Connect->query("SELECT * from login where Email ='".$Email."' and Password = '".$Password."'");
	//$querySt=$Connect->query("SELECT * FROM logindetail WHERE _EmailBody = '".$Email."' and _PasswordBody = '".$Password."'");

	$result=array () ;
	
	//$result = $Connect->query($sql) or die($Connect->error);
	
	while ($fetchData=$sql->fetch_assoc()) {
		$result [] =$fetchData;
	}

	echo json_encode($result);

?>
