<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method=="GET")
    {
        $apiKey=$_GET["apikey"];
        $giocatori=[];
        $result = $conn->query(
            "SELECT *
                    FROM  utente WHERE apiKey='$apiKey'");
        if($result->num_rows==0)
            echo json_encode(["stato"=>false,"messaggio"=>"apiKey errata"]);
        else
            echo json_encode(["stato"=>true,"utente"=>$result->fetch_assoc()]);
    }
?>