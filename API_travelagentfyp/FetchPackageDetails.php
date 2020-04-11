

<?php

class Constants
{
    
    static $DB_SERVER="localhost";
    static $DB_NAME="travelagentfyp";
    static $USERNAME="root";
    static $PASSWORD="";


}

class UploadImage
{

    public function connect()
    {
        $con=new mysqli(Constants::$DB_SERVER,Constants::$USERNAME,Constants::$PASSWORD,Constants::$DB_NAME);
        if ($con->connect_error)
        {
            echo "Unable to connect";
            return null;
        }
        else
        {
            echo "connection successful";
            return $con;
        }
    }

    public function upload()
    {


        $con=$this->connect();
        if($con != null) {
                   
            $PackageName = '';
            $Detail= '';
            $Price= '';
            $image='';
            $imagePath='';
            $PackageImage='';
            $FILES=[];
        
        if (isset($_POST['_packagename'])) {
            $PackageName = $_POST['_packagename'];
        }
        
        if (isset($_POST['_detail'])) {
            $Detail =  $_POST['_detail'];
        }
        
        if (isset($_POST['_price'])) {
            $Price = $_POST['_price'];
        }
        
        if (isset($_FILES['image']['name'])) {
            $PackageImage=$_FILES['image']['name'];
        }
                    $imagePath = "..uploads/".$image;
                    move_uploaded_file($_FILES['image']['tmp_name'],$imagePath);
            
                    $sql=$con->query("INSERT INTO packagedetail 
                        (PackageName, Detail, Price, PackageImage)
                         VALUES
                        ('".$PackageName."', '".$Detail."', '".$Price."','".$PackageImage."')");
            
                    echo "OK";
                }
else {
    echo "not okay";
}
        }
    
}

$UploadImage = new UploadImage();
$UploadImage->upload();

?>