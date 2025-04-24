<?php
    include "db.php";
    header("Content-Type: application/json");
    $parametri = json_decode(file_get_contents('php://input'), true);
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method=="POST")
    {
        $username =$parametri["username"];
        $password=md5($parametri["password"]);
        $mail=$parametri["mail"];
        $key = implode('-', str_split(substr(strtolower(md5(microtime().rand(1000, 9999))), 0, 30), 6));
        try{
            if($conn->query(
                            "INSERT INTO `utente` (`username`, `password`, `email`, `apiKey`) VALUES ('$username', '$password', '$mail', '$key')"))
                            
                echo json_encode(["stato"=>true,"messaggio"=>"utente creato"]);
            else
                echo json_encode(["stato"=>false,"messaggio"=>"errore nella creazione"]);
        }catch(Exception)
        {
            echo json_encode(["stato"=>false,"messaggio"=>"username o mail già usato"]);
        }
    }
    else
        echo json_encode(["stato"=>false,"messaggio"=>"solo in post"]);
?>