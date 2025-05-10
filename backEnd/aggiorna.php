<?php
	include "db.php";
	header("Content-Type: application/json");
	$method = $_SERVER['REQUEST_METHOD'];
	$parametri = json_decode(file_get_contents('php://input'), true);
	$apikey="cd218c504bmsh3513d8d2dbce373p10410ejsnb578d68f4e0a";#DA CAMBIARE
	if ($method!="PUT")
	{
		echo json_encode(["stato"=>false,"messaggio"=>"solo in put"]);
		die();
	}
	$giocatori=[];
	$apiKey =$parametri["apiKey"];
	$result=$conn->query("select * from utente where apiKey='$apiKey' and gestore=1");
	if($result->num_rows==0){
		echo json_encode(["stato"=>false,"messaggio"=>"devi essere un admin"]);
		die();
	}


	$result=$conn->query("select * from partite where puntiCasa is null and puntiOspite is null");
	$currentid=$result->fetch_assoc()["idPartita"];
		

	$curl = curl_init();

	curl_setopt_array($curl, [
		CURLOPT_URL => "https://basketapi1.p.rapidapi.com/api/basketball/match/$currentid/lineups",
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 30,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => "GET",
		CURLOPT_HTTPHEADER => [
			"x-rapidapi-host: basketapi1.p.rapidapi.com",
			"x-rapidapi-key: $apikey"
		],
	]);

	$response = curl_exec($curl);
	$err = curl_error($curl);

	curl_close($curl);

	if ($err) {
		echo json_encode(["stato"=>false,"messaggio"=>"cURL Error #:" . $err]);
		die();
	}
	$response=json_decode($response);

	$homeP=$response->home->players;
	$puntiTotaliC=0;
	foreach($homeP as $player){
		$id=$player->player->id;
		$statistic=$player->statistics;
		$puntiTotaliC+=$statistic->points;
		$rating=5.5;
		if(isset($statistic->rating))
			$rating=$statistic->rating;
		$result=$conn->query("update giocatore set Valutazione=$rating*10 where idApi=$id");
		//if($conn->affected_rows==0)
		//	echo  json_encode(["stato"=>false,"messaggio"=>"errore con $id"]);
	}

	$awayP=$response->away->players;
	$puntiTotaliA=0;
	foreach($awayP as $player){
		$id=$player->player->id;
		$statistic=$player->statistics;
		$puntiTotaliA+=$statistic->points;
		$rating=5.5;
		if(isset($statistic->rating))
			$rating=$statistic->rating;
		$result=$conn->query("update giocatore set Valutazione=$rating*10 where idApi=$id");
		#if($conn->affected_rows==0)
		#	echo "errore con $id";
	}

	//allenatoreù	
	$idSquadraP=$homeP[0]->teamId;	
	$idSquadraO=$awayP[0]->teamId;	
	$delta=2;
	$nuovoValore="-$delta";
	if($puntiTotaliC>$puntiTotaliA) 
		$nuovoValore="+$delta";
	$result=$conn->query("UPDATE giocatore set Valutazione=Valutazione$nuovoValore where Posizione='A' and idSquadra=(SELECT id from squadra WHERE idApi=$idSquadraP)");
	if($conn->affected_rows==0)
		echo "errore con allenatore casa";

	$result=$conn->query("UPDATE giocatore set Valutazione=Valutazione-$nuovoValore where Posizione='A' and idSquadra=(SELECT id from squadra WHERE idApi=$idSquadraO)");
	if($conn->affected_rows==0)
		echo "errore con allenatore ospite";
	
	$result=$conn->query("update partite set puntiCasa=$puntiTotaliC, puntiOspite=$puntiTotaliA where idPartita=$currentid");
	if($conn->affected_rows==0)
	{
		echo  json_encode(["stato"=>false,"messaggio"=>"info partita non aggiornate"]);
		die();
	}

	$curl = curl_init();

	curl_setopt_array($curl, [
		CURLOPT_URL => "https://basketapi1.p.rapidapi.com/api/basketball/match/$currentid/series",
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 30,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => "GET",
		CURLOPT_HTTPHEADER => [
			"x-rapidapi-host: basketapi1.p.rapidapi.com",
			"x-rapidapi-key: $apikey"
		],
	]);

	$response = curl_exec($curl);
	$err = curl_error($curl);

	curl_close($curl);

	if ($err) {
		echo json_encode(["stato"=>false,"messaggio"=>"cURL Error #:" . $err]);
		die();
	} 

	$response=json_decode($response);
	$idPartite=$response->series;
	$i=0;
	for(;$i<count($idPartite);$i++)
	{
		$idpartita=$idPartite[$i];
		if($idpartita==$currentid)
		{
			break;
		}
	}
	if($i==count($idPartite)-1){
		echo json_encode(["stato"=>false,"messaggio"=>"sono finite"]);
		die();
	} 
	$idNextPartita=$idPartite[$i+1];

	$curl = curl_init();

	curl_setopt_array($curl, [
		CURLOPT_URL => "https://basketapi1.p.rapidapi.com/api/basketball/match/$idNextPartita",
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 30,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => "GET",
		CURLOPT_HTTPHEADER => [
			"x-rapidapi-host: basketapi1.p.rapidapi.com",
			"x-rapidapi-key: $apikey"
		],
	]);

	$response = curl_exec($curl);
	$err = curl_error($curl);

	curl_close($curl);

	if ($err)  {
		echo json_encode(["stato"=>false,"messaggio"=>"cURL Error #:" . $err]);
		die();
	} 

	$response=json_decode($response);

	$homeTeamId=$response->event->homeTeam->id;
	$awayTeamId=$response->event->awayTeam->id;

	$result=$conn->query("INSERT INTO `partite` (`idPartita`, `idCasa`, `idOspite`) VALUES ($idNextPartita, $homeTeamId, $awayTeamId)");
	if($conn->affected_rows==0)
		echo json_encode(["stato"=>false,"messaggio"=>"errore aggiunta nuova partita"]);
	else
		echo json_encode(["stato"=>true,"messaggio"=>"aggiornamento avvenuto con successo"]);
?>