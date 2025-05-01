<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    $mapRuolo=["F","C", "F","G", "G","G","G","F","FC","C","A"];
    if ($method=="GET")
    {
        if(isset($_GET["idGiocatore"]))
            $id=$_GET["idGiocatore"];
        else
            $id=null;
        if(isset($_GET["ruolo"]))
            $ruolo=intval($_GET["ruolo"]);
        else
            $ruolo=null;
        $giocatori=[];
        $sql="SELECT g.Id,g.Nome,Cognome,Valutazione, Posizione,s.Nome as NomeSquadra
                                FROM giocatore as g join squadra as s on g.idSquadra=s.id";
        if($id!=null)
            if($ruolo!=null)
                $sql=$sql." where g.Id=$id and g.Posizione='".$mapRuolo[$ruolo-1]."'";
            else
                $sql=$sql." where g.Id=$id";
        else if($ruolo!=null)
            $sql=$sql." where g.Posizione='".$mapRuolo[$ruolo -1]."'";
        $sql=$sql." order by Valutazione desc";
        $result = $conn->query($sql);
        if($result->num_rows==0)
            echo json_encode(["stato"=>false,"messaggio"=>"non ci sono giocatori"]);
        while($row=$result->fetch_assoc()){
            $giocatori[]=$row;
        }
        echo json_encode(["stato"=>true,"giocatori"=>$giocatori]);
    }
?>