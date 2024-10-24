<?php
require_once("./protect-user.php");
require_once("./conexao.php");

try{
    $sqlFav = "SELECT *
                FROM `favoritos`
                WHERE id_User_FK=:usuario";

    $selectFav = $conexao->prepare($sqlFav);
    $selectFav->bindParam('usuario', $_SESSION['id'], PDO::PARAM_INT);
    $selectFav->execute();
    $resultFav = $selectFav->fetchAll();
    
    $totalFav = $selectFav->rowCount();

}catch(PDOException $e) {
    echo "Erro: ".$e->getMessage();
}