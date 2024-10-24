<?php
include("./conexao.php");

$sqlRGen = "SELECT *
        FROM `genero`
        WHERE `idGenero` != 1";

$selectRGen = $conexao->prepare($sqlRGen);
$selectRGen->execute();

$resultRGen = $selectRGen->fetchAll();
$totalRGen = $selectRGen->rowCount();