<?php
require_once("./_conexao/conexao.php");

    try{
        $sql = "SELECT * FROM admin";

        $select = $conexao->query($sql);

        $result = $select->fetchAll();

        $total = $select->rowCount();


    


    }
    catch(PDOException $e) {
        echo "Erro: ".$e->getMessage();
    }