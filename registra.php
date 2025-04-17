<?php
    include "db.php";
    $key = implode('-', str_split(substr(strtolower(md5(microtime().rand(1000, 9999))), 0, 30), 6));
    print($key."\n");
    print(strlen($key));
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method=="POST")
    {
        $giocatori=[];
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