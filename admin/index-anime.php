<?php
    require_once("./conexao.php");

    try{
        $sql = "SELECT * FROM animes ORDER BY idAnime DESC";

        $select = $conexao->query($sql);

        $result = $select->fetchAll();

        $total = $select->rowCount();
    }
    catch(PDOException $e) {
        echo "Erro: ".$e->getMessage();
    }