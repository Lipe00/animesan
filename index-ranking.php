<?php
    require_once("./conexao.php");
    $sql = "SELECT * FROM animes ORDER BY favoritosAnime DESC, avaliacaoAnime DESC";
    $select = $conexao->query($sql);
    $result = $select->fetchAll();
    $total = $select->rowCount();

    if($total != 0){
        $rankTemp = 0;
        foreach($result as $ani){
            $rankTemp = $rankTemp+1;

            $sqlFav = "SELECT * FROM `favoritos` WHERE id_Anime_FK=:anime";
            $selectFav = $conexao->prepare($sqlFav);
            $selectFav->bindParam("anime", $ani['idAnime'], PDO::PARAM_INT);
            $selectFav->execute();
            $totalFav = $selectFav->rowCount();
            
            $sqlAva = "SELECT * FROM `avaliacao` WHERE id_Anime_FK=:anime";
            $selectAva = $conexao->prepare($sqlAva);
            $selectAva->bindParam("anime", $ani['idAnime'], PDO::PARAM_INT);
            $selectAva->execute();
            $resultAva = $selectAva->fetchAll();
            $totalAva = $selectAva->rowCount();
            if($totalAva != 0){
                $avaTemp = 0;
                foreach($resultAva as $ava){
                    $avaTemp = $avaTemp + $ava['notaAvaliacao'];
                }
                $avaFinal = ($avaTemp/$totalAva);
            }else{
                $avaFinal = 0;
            }

            $sqlAtt = "UPDATE `animes` SET
                            `favoritosAnime`=:newFav, `avaliacaoAnime`=:newAva, `rankingAnime`=:newRank
                            WHERE idAnime=:anime";
            $comandoAtt = $conexao->prepare($sqlAtt);
            $comandoAtt->execute(array(
                ':newFav'       => $totalFav,
                ':newAva'       =>$avaFinal,
                ':newRank'      =>$rankTemp,
                ':anime'        =>$ani['idAnime']
            ));
        }
    }