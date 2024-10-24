<?php
include("./conexao.php");

//SELECIONANDO TODOS OS ANIMES
$sqlAll = "SELECT *
            FROM `animes`";
$selectAll = $conexao->prepare($sqlAll);
$selectAll->execute();
$resultAll = $selectAll->fetchAll();
$totalAll = $selectAll->rowCount();

$array = [];
//SE FOR MAIOR Q 0 ELE VAI FUNCIONAR NORMALMENTE
if($totalAll != 0){
    //PARA CADA RESULTADO ELE VAI RODAR ESSE CÓDIGO UMA VEZ
    foreach($resultAll as $AniSelect){

        $sqlSFav = "SELECT *
                    FROM `favoritos`
                    WHERE id_Anime_FK=:anime";
        $selectSFav = $conexao->prepare($sqlSFav);
        $selectSFav->bindParam('anime', $AniSelect['idAnime'], PDO::PARAM_INT);
        $selectSFav->execute();
        $totalSFav = $selectSFav->rowCount();
        echo "ID:";
        echo $AniSelect['idAnime'];"<br>";
        echo "Rows Fav SFAV:$totalSFav";

        //SELECIONANDO A AVALIAÇÃO DE FAVORITOS DAQUELE ANIME
        $sqlSAva = "SELECT *
                    FROM `avaliacao`
                    WHERE id_Anime_FK = :anime";
        $selectSAva = $conexao->prepare($sqlSAva);
        $selectSAva->bindParam('anime', $AniSelect['idAnime']);
        $selectSAva->execute();
        $resultSAva = $selectSAva->fetchAll();
        $totalSAva = $selectSAva->rowCount();
        echo "<br>Rows Ava: $totalSAva";
        //CALCULANDO O VALOR DA AVALIAÇÃO
        if($totalSAva == 0){}else{
        $avaliacaoAnime = 0.00;
        foreach($resultSAva as $animeAva){
            $avaliacaoAnime = $avaliacaoAnime + $animeAva['notaAvaliacao'];
        }
        $avaliacaoFinalAnime = 0.00;
        $avaliacaoFinalAnime = ($avaliacaoAnime/$totalSAva);
        echo "<br>Avaliação final: $avaliacaoFinalAnime";
    }
                    //CALCULO FINAL
                    $finalCalc = (($avaliacaoFinalAnime+$totalSFav)/2);
                    

            $array[$AniSelect['idAnime']] = number_format($finalCalc, 3);;
            $idTemp = $AniSelect['idAnime'];
            echo "<br>TESTE FINAL: $array[$idTemp]";
            echo "<br>----------<br>";  
    }
    asort($array);
    foreach($array as $arrayE){
        echo "$arrayE<br>";
    }
}