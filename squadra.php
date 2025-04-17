<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method=="POST")
    {
        $apiKey =$_POST["apiKey"];
        $logo=$_POST["logo"];
        $nome=$_POST["nome"];
        if($conn->query(
                        "UPDATE `utente` SET `nomeSquadra` = '$nome', `logoSquadra` = '$logo' WHERE `api-key` = '$apiKey'"))
                        
            echo json_encode(["stato"=>true,"messaggio"=>"squadra creata"]);
        else
            echo json_encode(["stato"=>false,"messaggio"=>"errore nella creazione"]);
    }
    else
        echo json_encode(["stato"=>false,"messaggio"=>"solo in post"]);
?>