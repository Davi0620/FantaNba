<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    $parametri = json_decode(file_get_contents('php://input'), true);
    if ($method=="PUT")
    {
        $giocatori=[];
        $apiKey =$parametri["apiKey"];
        $idGiocatore=$parametri["idGiocatore"];
        if($conn->query("DELETE FROM squadrautente WHERE idGiocatore=$idGiocatore and idUtente=(select id from utente where apiKey='$apiKey')"))
            
            if($conn->query("UPDATE utente SET crediti = crediti+(SELECT Valutazione from giocatore WHERE id=$idGiocatore) WHERE apiKey = '$apiKey'"))
                echo json_encode(["stato"=>true,"messaggio"=>"squadra creata"]);
            else
                echo json_encode(["stato"=>false,"messaggio"=>"errore nella creazione"]);
        else
            echo json_encode(["stato"=>false,"messaggio"=>"errore nella creazione"]);
    }
    else
        echo json_encode(["stato"=>false,"messaggio"=>"solo in post"]);
?>