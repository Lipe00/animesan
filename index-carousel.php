<?php
include("./conexao.php");
$array = array(
    1 => 4,
    2 => 9,
    3 => 22,
    4 => 25,
    5 => 33,
    6 => 46
);
$rand1 = rand(1,6);
$rand2 = rand(1,6);
if($rand2 == $rand1){
    while($rand2 == $rand1){
        $rand2 = rand(1,6);
    }
}
$rand3 = rand(1,6);
if($rand3 == $rand1 or $rand3 == $rand2){
    while($rand3 == $rand1 or $rand3 == $rand2){
        $rand3 = rand(1,6);
    }
}
$valor1 = $array[$rand1];
$valor2 = $array[$rand2];
$valor3 = $array[$rand3];
// echo $valor1;
// echo "<br>";
// echo $valor2;
// echo "<br>";
// echo $valor3;
$sqlCar = "SELECT * FROM `animes` WHERE idAnime=:id";

//SELECT 1
$selectCar1 = $conexao->prepare($sqlCar);
$selectCar1->bindParam('id', $valor1, PDO::PARAM_INT);
$selectCar1->execute();
$totalCar1 = $selectCar1->rowCount();
$result1 = $selectCar1->fetch(PDO::FETCH_ASSOC);

// SELECT 2
$selectCar2 = $conexao->prepare($sqlCar);
$selectCar2->bindParam('id', $valor2, PDO::PARAM_INT);
$selectCar2->execute();
$totalCar2 = $selectCar2->rowCount();
$result2 = $selectCar2->fetch(PDO::FETCH_ASSOC);

//SELECT 3
$selectCar3 = $conexao->prepare($sqlCar);
$selectCar3->bindParam('id', $valor3, PDO::PARAM_INT);
$selectCar3->execute();
$totalCar3 = $selectCar3->rowCount();
$result3 = $selectCar3->fetch(PDO::FETCH_ASSOC);