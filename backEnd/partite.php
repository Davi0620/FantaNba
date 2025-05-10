<?php
    include "db.php";
    header("Content-Type: application/json");
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method=="GET")
    {
        $partite=[];
        $sql="SELECT s1.Nome as nomeCasa,puntiCasa, s2.Nome as nomeOspite, puntiOspite FROM partite as p join squadra as s1 on p.idCasa=s1.idApi join squadra as s2 on p.idOspite=s2.idApi order by p.id desc";
        
        $result = $conn->query($sql);
        if($result->num_rows==0)
            {
                echo json_encode(["stato"=>false,"messaggio"=>"non ci sono partite"]);
                die();
            }
        while($row=$result->fetch_assoc()){
            $partite[]=$row;
        }
        echo json_encode(["stato"=>true,"partite"=>$partite]);
    }
?>