<?php
    require_once("./_conexao/conexao.php");
	//Pega o id na URL
	$idPhp = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);

	try {
		$comandoSQL = $conexao->prepare("SELECT * FROM animes WHERE idAnime = :idAni");

        $comandoSQL->bindValue("idAni", $idPhp, PDO::PARAM_INT);

		$comandoSQL->execute();

		$linha = $comandoSQL->fetch(PDO::FETCH_ASSOC);			
	} catch (PDOException $e) {
		echo "Erro: ".$e->getMessage();
	}

	$conexao = null; //fechar a conexão