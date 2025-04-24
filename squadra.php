<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    $parametri = json_decode(file_get_contents('php://input'), true);
    if ($method=="POST")
    {
        $apiKey =$parametri["apiKey"];
        $logo=$parametri["logo"];
        $nome=$parametri["nome"];
        if($conn->query(
                        "UPDATE `utente` SET `nomeSquadra` = '$nome', `logoSquadra` = '$logo' WHERE `apiKey` = '$apiKey'"))
                        
            echo json_encode(["stato"=>true,"messaggio"=>"squadra creata"]);
        else
            echo json_encode(["stato"=>false,"messaggio"=>"errore nella creazione"]);
    }
    else
        echo json_encode(["stato"=>false,"messaggio"=>"solo in post"]);
?>