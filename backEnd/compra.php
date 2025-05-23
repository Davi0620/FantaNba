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
        $posizione=$parametri["posizione"];
        try{
            $result= $conn->query("select crediti,(SELECT Valutazione from giocatore WHERE id=$idGiocatore) as prezzoGiocatore from utente WHERE apiKey = '$apiKey'");
            $row=$result->fetch_assoc();
            if($row["crediti"]<$row["prezzoGiocatore"])
            {
                echo json_encode(["stato"=>false,"messaggio"=>"non hai abbastanza crediti"]);
                die();
            }
            if($conn->query("INSERT INTO `squadrautente` (`idUtente`, `idGiocatore`,`posizione`, `prezzo`) VALUES 
                            ((select id from utente WHERE apiKey='$apiKey'), $idGiocatore, $posizione, (SELECT Valutazione from giocatore WHERE id=$idGiocatore));"))
                if($conn->query("UPDATE utente SET crediti = crediti-(SELECT Valutazione from giocatore WHERE id=$idGiocatore) WHERE apiKey = '$apiKey'"))
                    echo json_encode(["stato"=>true,"messaggio"=>"squadra creata"]);
                else
                    echo json_encode(["stato"=>false,"messaggio"=>"errore nella creazione"]);
            else
                echo json_encode(["stato"=>false,"messaggio"=>"errore nella creazione"]);
        }
        catch(Exception){
            echo json_encode(["stato"=>false,"messaggio"=>"errore nella creazione"]);
        }
    }
    else
        echo json_encode(["stato"=>false,"messaggio"=>"solo in put"]);
?>