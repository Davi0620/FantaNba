<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method=="GET")
    {
        $utenti=[];
        $sql="SELECT username,crediti from utente ";
        //if($ruolo!=null)
           // $sql=$sql." where g.Posizione='".$mapRuolo[$ruolo -1]."'";
        $sql=$sql." order by crediti desc";
        $result = $conn->query($sql);
        if($result->num_rows==0)
            echo json_encode(["stato"=>false,"messaggio"=>"non ci sono utenti"]);
        while($row=$result->fetch_assoc()){
            $utenti[]=$row;
        }
        echo json_encode(["stato"=>true,"utenti"=>$utenti]);
    }
?>