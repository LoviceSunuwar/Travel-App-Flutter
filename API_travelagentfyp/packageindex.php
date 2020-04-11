<?php

class Constants
{
    
    static $DB_SERVER="localhost";
    static $DB_NAME="travelagentfyp";
    static $USERNAME="root";
    static $PASSWORD="";

    static $SQL_SELECT_ALL="SELECT * FROM packagedetail";

}

class Package
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

    public function select()
    {
        $con=$this->connect();
        if($con != null)
        {
            $result=$con->query(Constants::$SQL_SELECT_ALL);
            if($result->num_rows>0)
            {
                $package=array();
                while ($row=$result->fetch_array())
                {
                    array_push($package, array("package_ID"=>$row['Package_ID'], "packageName"=>$row['PackageName'],
                    "detail"=>$row['Detail'],"price"=>$row['Price']
                ));
            }
            print(json_encode(array_reverse($package)));
            }
            else{
                 print(json_encode(array("PHP EXCEPTION: CAN'T RETRIEVE FROM MYSQL. ")));
             }
            
            $con->close();
        }
        else {
            print(json_encode(array("PHP EXCEPTION: CAN'T RETRIEVE FROM MYSQL. NULL CONNECTION ")));
        }
    }
}

$package= new Package();
$package->select();
?>