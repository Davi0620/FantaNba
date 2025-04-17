<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method=="GET")
    {
        $giocatori=[];
        $result = $conn->query(
                        "SELECT g.Id,g.Nome,Cognome,Valutazione*10,s.Nome 
                                FROM giocatore as g join squadra as s on g.idSquadra=s.id
                                order by Valutazione desc");
        if($result->num_rows==0)
            echo json_encode(["errore"=>"non ci sono giocatori"]);
        while($row=$result->fetch_assoc()){
            $giocatori[]=$row;
        }
        echo json_encode($giocatori);
    }
?>