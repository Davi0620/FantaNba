<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method=="GET")
    {
        if(isset($_GET["idGiocatore"]))
            $id=$_GET["idGiocatore"];
        else
            $id=null;
        $giocatori=[];
        $sql="SELECT g.Id,g.Nome,Cognome,Valutazione, Posizione,s.Nome as NomeSquadra
                                FROM giocatore as g join squadra as s on g.idSquadra=s.id
                                order by Valutazione desc";
        if($id!=null)
            $sql="SELECT g.Id,g.Nome,Cognome,Valutazione, Posizione,s.Nome as NomeSquadra
                                FROM giocatore as g join squadra as s on g.idSquadra=s.id
                                where g.Id=$id
                                order by Valutazione desc";
        $result = $conn->query($sql);
        if($result->num_rows==0)
            echo json_encode(["stato"=>false,"messaggio"=>"non ci sono giocatori"]);
        while($row=$result->fetch_assoc()){
            $giocatori[]=$row;
        }
        echo json_encode(["stato"=>true,"giocatori"=>$giocatori]);
    }
?>