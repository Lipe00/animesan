<?php
include_once("./conexao.php");
$sqlAni = "SELECT * FROM `animes`";
$selectAni = $conexao->prepare($sqlAni);
$selectAni->execute();
$resultAni = $selectAni->fetchAll();
$totalAni = $selectAni->rowCount();

if($totalAni != 0){
    foreach($resultAni as $linhaAni){
        $sqlFav = "SELECT *
                    FROM `favoritos`
                    WHERE id_Anime_FK =:anime";
        $selectFav = $conexao->prepare($sqlFav);
        $selectFav->bindParam('anime', $linhaAni['idAnime']);
        $selectFav->execute();
        $resultFav = $selectFav->fetchAll();
        $totalFav = $selectFav->rowCount();

        $sqlAva = "SELECT *
                    FROM `avaliacao`
                    WHERE id_Anime_FK =:anime";
        $selectAva = $conexao->prepare($sqlAva);
        $selectAva->bindParam('anime', $linhaAni['idAnime']);
        $selectAva->execute();
        $resultAva = $selectAva->fetchAll();
        $totalAva = $selectAva->rowCount();

        if($totalAva != 0){
            $avaTemp = 0;
            foreach($resultAva as $linhaAva){
                $avaTemp = $avaTemp + $linhaAva["notaAvaliacao"];
            }
            $avaFinal = ($avaTemp/$totalAva);
        }else{
            $avaFinal = 0;
        }
        //VERIFICA SE EXISTE UMA TABLE EXISTENTE PARA O ANIME
        $sqlVRank = "SELECT * 
                    FROM `ranking`
                    WHERE id_Anime_FK =:idAnime
                    LIMIT 1";
        $selectVRank = $conexao->prepare($sqlVRank);
        $selectVRank->bindParam('idAnime', $linhaAni['idAnime']);
        $selectVRank->execute();
        $resultVRank = $selectVRank->fetchAll();
        $totalVRank = $selectVRank->rowCount();
        //CASO EXISTA UMA TABELA ELE APENAS A MODIFICA
        if($totalVRank != 0){
            $comandoAttRank = $conexao->prepare("UPDATE `ranking`
                            SET 
                                `avaMediaAnime`=:newAva, `favAnime`=:newFav
                            WHERE
                                id_Anime_FK=:animeAtual");
            // $comandoAttRank= $conexao->prepare($sqlAttRank);
            $comandoAttRank->execute(array(
                ':animeAtual' => $linhaAni['idAnime'],
                ':newAva' => $avaFinal,
                ':newFav' => $totalFav
            ));
            if($comandoAttRank->rowCount() != 0){
                echo "Atualizou<br>";
            }else{
                echo "Não atualizou<br>";
            }
        }else{
            $sqlRank =  "INSERT INTO `ranking`
                            (`idRanking`, `id_Anime_FK`, `avaMediaAnime`, `favAnime`)
                            VALUES
                            (NULL, :idAnime, :avaliacaoAnime, :favoritosAnime )";
            $comandoRank = $conexao->prepare($sqlRank);
            $comandoRank->execute(array(
                ':idAnime' => $linhaAni['idAnime'],
                ':avaliacaoAnime' => $avaFinal,
                ':favoritosAnime' => $totalFav
            ));
            if($comandoRank->rowCount() != 0){
                echo "Deu bom<br>";
            }else{
                echo "Vixi, algo errado<br>";
            }
        }
    }
}
?>