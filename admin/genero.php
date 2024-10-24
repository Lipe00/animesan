<?php
    require_once("./_conexao/conexao.php");

        $sqlG = "SELECT * FROM genero";
        $selectG = $conexao->query($sqlG);
        $resultG = $selectG->fetchAll();
        $totalG = $selectG->rowCount();
