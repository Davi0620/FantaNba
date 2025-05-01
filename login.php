<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method=="GET")
    {
        $username=$_GET["username"];
        $password=md5($_GET["password"]);
        $result = $conn->query(
                        "SELECT apiKey 
                                FROM utente 
                                where username='$username' and password='$password'");
        if($result->num_rows==0)
        {
            echo json_encode(["stato"=>false,"messaggio"=>"username o password errati"]);
        }
        else
            echo json_encode(["stato"=>true,"apiKey"=>$result->fetch_assoc()["apiKey"]]);
    }
?>