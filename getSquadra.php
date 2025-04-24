<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method=="GET")
    {
        $apiKey=$_GET["apikey"];
        $giocatori=[];
        $result = $conn->query(
                        "SELECT idGiocatore, prezzo, data 
                                FROM `squadrautente` 
                                WHERE idUtente=(SELECT idUtente from utente WHERE apiKey='$apiKey')");
        if($result->num_rows==0)
        {
            echo json_encode(["errore"=>"non ci sono giocatori"]);
            die();
        }
        while($row=$result->fetch_assoc()){
            $giocatori[]=$row;
        }
        $result = $conn->query(
            "SELECT nomeSquadra, logoSquadra 
                    FROM  utente WHERE apiKey='$apiKey'");
        $row=$result->fetch_assoc();
        $nome=$row["nomeSquadra"];
        $logo=$row["logoSquadra"];
        echo json_encode(["nome"=>$nome,"logo"=>$logo,"giocatori"=>$giocatori]);
    }
?>