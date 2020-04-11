<?php

include 'Connection.php';
          
$PackageName = '';
$Detail= '';
$Price= '';
$image='';
$name='';
if (isset($_POST['_packagename'])) {
    $PackageName = $_POST['_packagename'];
}

if (isset($_POST['_detail'])) {
    $Detail =  $_POST['_detail'];
}

if (isset($_POST['_price'])) {
    $Price = $_POST['_price'];
}

if (isset($_POST['image'])) {
    $image = $_POST['image'];
}

if (isset($_POST['fileName'])) {
    $name = $_POST['fileName'];
}

$realImage = base64_decode($image);

file_put_contents($name,$realImage);
$sql=$Connect->query("INSERT INTO packagedetail 
    (PackageName, Detail, Price)
     VALUES
    ('".$PackageName."', '".$Detail."', '".$Price."', '".$name."')");

echo "OK";
?>