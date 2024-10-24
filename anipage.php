<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeSan</title>
    <link rel="stylesheet" href="./css/global.css">
    <link rel="stylesheet" href="./css/anipage.css">
    <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
</head>
<body id="body">
    <div class="space" id="space">
        <!-- NAVBAR -->
        <?php
            include("navbar.php");
            include_once("./conexao.php");
            $varT = 0;
            $anime = filter_input(INPUT_GET, "anime", FILTER_SANITIZE_NUMBER_INT);

            $sqlVerifyFav = "SELECT * FROM `favoritos` WHERE id_Anime_FK=:anime";
            $comandoVerifyFav= $conexao->prepare($sqlVerifyFav);
            $comandoVerifyFav->bindParam("anime", $anime, PDO::PARAM_INT);
            $comandoVerifyFav->execute();
            $totalVerifyFav = $comandoVerifyFav->rowCount();
            if($totalVerifyFav != 0){
                $sqlUFav = "UPDATE `animes` SET favoritosAnime=:newFav WHERE idAnime=:animeAtual";
                $comandoUFav = $conexao->prepare($sqlUFav);
                $comandoUFav->execute(array(
                    ':newFav'       => $totalVerifyFav,
                    ':animeAtual'   => $anime
                ));
                if($comandoUFav->rowCount() != 0){
                    // echo "<script>alert(\"Atualizado com sucesso\")</script>";
                }else{
                    // echo "<script>alert(\"Não foi possivel atualizar\")</script>";
                }
            }

            $sqlVerifyRank = "SELECT * FROM `avaliacao` WHERE id_Anime_FK=:anime";
            $comandoVerifyRank = $conexao->prepare($sqlVerifyRank);
            $comandoVerifyRank->bindParam("anime", $anime, PDO::PARAM_INT);
            $comandoVerifyRank->execute();
            $resultVerifyRank = $comandoVerifyRank->fetchAll();
            $totalVerifyRank = $comandoVerifyRank->rowCount();

            if($totalVerifyRank!= 0){
                $avaRawTemp = 0;
                $avaFinalTemp = 0;
                foreach($resultVerifyRank as $rank){
                    $avaRawTemp = $avaRawTemp + $rank['notaAvaliacao'];
                }
                if($avaRawTemp != 0){
                    $avaFinalTemp = ($avaRawTemp/$totalVerifyRank);
                }else{
                    $avaFinalTemp = 0;
                }
                $sqlUR = "UPDATE `animes` 
                            SET avaliacaoAnime=:notaNova
                            WHERE idAnime=:anime";
                $comandoUR = $conexao->prepare($sqlUR);
                $comandoUR->execute(array(
                    ':notaNova'     => $avaFinalTemp,
                    ':anime'        =>$anime
                ));
            }



            //TUDO AQUI PRA BAIXO, FUNCIONA
            
            if(!empty($anime) and $anime != 0){
                $sql = "SELECT *
                        FROM `animes`
                        WHERE idAnime=:anime
                        LIMIT 1";
                $select = $conexao->prepare($sql);
                $select->bindParam("anime", $anime, PDO::PARAM_INT);
                $select->execute();
                $total = $select->rowCount();
                $result = $select->fetch(PDO::FETCH_ASSOC);
        ?>
        <!-- POP-UP: AVALIAR -->
        <div class="pop-up desativado" id="pupa">
        <div class="pupdiv">
                <div class="pup-cont">
                    <!-- LIMITANDO O USUÁRIO CASO ELE NÃO ESTEJA LOGADO  -->
                    <?php
                    if(!isset($_SESSION['id'])){
                    ?>
                    <p>Você precisa estar logado para realizar esta ação! <a href="./login.php">Faça Login</a></p>
                    <?php
                    }else{
                    ?>
                    <p>Avaliar (<?= $result['nomeAnime'];?>)</p>
                    <form action="" method="POST" enctype="multipart/form-data">
                        <?php
                        if(isset($_POST['formCom-submit'])){
                            include("./anipage-comment-bd.php");
                        }
                        ?>
                        <input type="hidden" name="animeINP" value="<?=$result['idAnime'];?>">
                        <div class="ratinga">
                            <input type="radio" name="rate" value="5" required>
                            <input type="radio" name="rate" value="4" required>
                            <input type="radio" name="rate" value="3" required>
                            <input type="radio" name="rate" value="2" required>
                            <input type="radio" name="rate" value="1" required>
                        </div>
                        <textarea name="textcom" id="" placeholder="Faça um comentário" class="taa" autocomplete="off"></textarea>
                        <div class="buttons">
                            <button type="reset" class="pup-btn reset" id="cancelbtna">Cancelar</button>
                            <button type="submit"class="pup-btn submit" name="formCom-submit">Enviar</button>
                        </div>
                    </form>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </div>
        <!-- POP-UP: DENÚNCIAR -->
        <?php
        // SCRIPT DENUNCIA
                    
        $denunID = filter_input(INPUT_GET, "denun", FILTER_SANITIZE_NUMBER_INT);
        if(!empty($denunID)){
            // echo "<script>alert(\"$denunID\")</script>";
        ?>
        <div class="pop-up" id="pupd">
            <div class="pupdiv">
                <div class="pup-cont">
                    <?php
                    if(!isset($_SESSION['id'])){
                    ?>
                    <p>Para realizar esta ação você precisa estar logado! <a href="./login.php">Faça login aqui</a> </p>
                    <?php
                    }else{
                        $sqlDenunV = "SELECT * FROM `usuario` WHERE idUser =:usuarioD LIMIT 1";
                        $comandoDenunV = $conexao->prepare($sqlDenunV);
                        $comandoDenunV->bindParam("usuarioD", $denunID, PDO::PARAM_INT);
                        $comandoDenunV->execute();
                        $totalDenunV = $comandoDenunV->rowCount();
                        $resultDenunV = $comandoDenunV->fetch(PDO::FETCH_ASSOC);
                        if($totalDenunV == 0){
                    ?>
                        <p>Usuário inválido, por favor <a href="./anipage.php?anime=<?=$anime?>">retorne</a> e tente denunciar novamente</p>
                    <?php
                    }else{
                    ?>
                        <p>Denúncia à (<?= $resultDenunV['nomeUser']?>)</p>
                        <form action="" method="POST" enctype="multipart/form-data">
                            <?php
                            if(isset($_POST['submit-DenunF'])){
                                include_once("./anipage-denun-bd.php");
                            }
                            ?>
                            <input type="hidden" name="idDenun" value="<?= $resultDenunV['idUser']?>">
                            <input type="hidden" name="animeAtD" value="<?= $anime?>">
                            <div class="selected-box"  id="seleb">
                                <div class="selected" id="sele"><div class="t">Selecione uma categoria</div></div>
                                <i class="fa-solid fa-chevron-down" id="arrow"></i>
                            </div>
                            <div class="select none" id="options">
                                <div class="options">
                                    <div class="option">
                                        <input type="radio" id="o1" value="abuso verbal" name="cselect">
                                        <label for="o1">Abuso Verbal</label>
                                    </div>
                                    <div class="option">
                                        <input type="radio" id="o2" value="discurso de ódio" name="cselect">
                                        <label for="o2">Discurso de Ódio</label>
                                    </div>
                                    <div class="option">
                                        <input type="radio" id="o3" value="outro" name="cselect">
                                        <label for="o3">Outro(Informe na descrição)</label>
                                    </div>
                                    
                                </div>
                            </div>
                            <textarea name="textDenun" id="textDenun" class="tad" placeholder="Faça sua denúncia" autocomplete="off"></textarea>
                            <div class="buttons">
                                <button type="reset" class="pup-btn reset" id="cancelbtnd">Cancelar</button>
                                <button type="submit"class="pup-btn submit" name="submit-DenunF">Enviar</button>
                            </div>
                        </form>
                    <?php
                        }
                    }
                    ?>
                </div>
            </div>
        </div>
        <?php
        }else{
        ?>
        <div class="pop-up desativado" id="pupd">
            <div class="pupdiv">
                <div class="pup-cont">

                    <p>Denúncia à ()</p>
                    <form action="">
                        <div class="selected-box"  id="seleb">
                            <div class="selected" id="sele"><div class="t">Selecione uma categoria</div></div>
                            <i class="fa-solid fa-chevron-down" id="arrow"></i>
                        </div>
                        <div class="select none" id="options">
                            <div class="options">
                                <div class="option">
                                    <input type="radio" id="o1" name="cselect">
                                    <label for="o1">mt troll</label>
                                </div>
                                <div class="option">
                                    <input type="radio" id="o2" name="cselect">
                                    <label for="o2">rage quit</label>
                                </div>
                                <div class="option">
                                    <input type="radio" id="o3" name="cselect">
                                    <label for="o3">outros</label>
                                </div>
                                <div class="option">
                                    <input type="radio" id="o4" name="cselect">
                                    <label for="o4">outros2</label>
                                </div>
                                <div class="option">
                                    <input type="radio" id="o5" name="cselect">
                                    <label for="o5">outros3</label>
                                </div>
                                <div class="option">
                                    <input type="radio" id="o6" name="cselect">
                                    <label for="o6">outros4</label>
                                </div>
                            </div>
                        </div>
                        <textarea name="" id="" class="tad" placeholder="Faça sua denúncia" autocomplete="off"></textarea>
                        <div class="buttons">
                            <button type="reset" class="pup-btn reset" id="cancelbtnd">Cancelar</button>
                            <button type="submit"class="pup-btn submit">Enviar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <?php
            }
        ?>
        <!-- CONTAINER -->
        <div class="menu">
            <!-- LEFT MENU -->
            <div class="l-menu">
                <div class="rrl">
                    <div class="anime-img">
                        <img src="<?=$result['pathImgAnime']?>">
                        <!-- FAVORITOS -->
                        <form action="./anipage-fav-bd.php" method="POST" id="formf">
                            <?php
                            if(!isset($_SESSION['id'])){
                            ?>
                            <input type="checkbox" class="fa-regular fa-heart" name="check-heart" id="heart">
                            <?php
                            }else{
                                $sqlVFav = "SELECT * FROM
                                            `favoritos`
                                            WHERE id_Anime_FK=:anime AND  id_User_FK=:user
                                            ";
                                $selectVFav = $conexao->prepare($sqlVFav);
                                $selectVFav->bindParam("user", $_SESSION['id'] , PDO::PARAM_INT);
                                $selectVFav->bindParam("anime", $anime , PDO::PARAM_INT);
                                $selectVFav->execute();
                                // $totalVfav = $selectVFav->rowCount();
                                $a = $selectVFav->rowCount();
                                if($selectVFav->rowCount() != 0){

                                    ?>
                            <input type="checkbox" class="fa-regular fa-heart php-active" name="check-heart" id="heart" checked="true">
                            <?php
                                }else{
                            ?>
                            <input type="checkbox" class="fa-regular fa-heart " name="check-heart" id="heart">                     
                            <?php
                                }
                                
                            }
                            ?>
                            <input type="hidden" name="anime-fav" value="<?=$anime;?>">
                        </form>
                    </div>
                    <!-- AVALIAÇÃO -->
                    <div class="avaliacao inpc">
                            <?php
                            $avaliacao = $result['avaliacaoAnime'];
                                if($avaliacao == 0.00){
                                ?>
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                            <?php
                            }else{
                                if($avaliacao == 0.00){
                                ?>
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <input type="radio" name="rank">
                                <?php
                                }else{
                                ?>
                            <input type="radio" name="rank" <?php if($avaliacao <= 5){echo "checked=\"true\"";}?>>
                            <input type="radio" name="rank" <?php if($avaliacao <= 4.9 && $avaliacao >= 4.5){echo "checked=\"true\"";}?>>
                            <input type="radio" name="rank" <?php if($avaliacao <= 4.4 && $avaliacao >= 4){echo "checked=\"true\"";}?>>
                            <input type="radio" name="rank" <?php if($avaliacao <= 3.9 && $avaliacao >= 3.5){echo "checked=\"true\"";}?>>
                            <input type="radio" name="rank" <?php if($avaliacao <= 3.4 && $avaliacao >= 3){echo "checked=\"true\"";}?>>
                            <input type="radio" name="rank" <?php if($avaliacao <= 2.9 && $avaliacao>= 2.5){echo "checked=\"true\"";}?>>
                            <input type="radio" name="rank" <?php if($avaliacao <= 2.4 && $avaliacao >= 2){echo "checked=\"true\"";}?>>
                            <input type="radio" name="rank" <?php if($avaliacao <= 1.9 && $avaliacao>= 1.5){echo "checked=\"true\"";}?>>
                            <input type="radio" name="rank" <?php if($avaliacao <= 1.4 && $avaliacao>= 1){echo "checked=\"true\"";}?>>
                            <input type="radio" name="rank" <?php if($avaliacao == 0.5 && $avaliacao >= 0.9){echo "checked=\"true\"";}?>>
                            <?php
                                }
                            }
                            ?>
                        </div>
                    </div>
                <!-- AVALIAÇÃO -->
                <!-- INFO -->
                <div class="info">
                    <div class="rank rankl">
                        <div class="anome"><?= $result['nomeAnime']?></div>
                        <!-- RANK -->
                        <a href="./searchpage.php?opm=8" style="color:#fff;"><div class="ranked">Rank: #<?=$result['rankingAnime']?></div></a>
                    </div>
                    <div class="i-row">
                    <p><b>Gênero:</b>
                        <!-- SELECIONANDO GENERO - INICIO -->
                        <?php
                            $sql = "SELECT *
                                FROM `genero`
                                WHERE `idGenero`=:genero";
                        //puxando nomes do generos

                        //genero 1
                        $gen1 = $conexao->prepare($sql);
                        $gen1->bindParam('genero', $result["gen1_FK"], PDO::PARAM_INT);
                        $gen1->execute();
                        $gen1Res = $gen1->fetch(PDO::FETCH_ASSOC);
                        //genero 2
                        $gen2 = $conexao->prepare($sql);
                        $gen2->bindParam('genero', $result["gen2_FK"], PDO::PARAM_INT);
                        $gen2->execute();
                        $gen2Res = $gen2->fetch(PDO::FETCH_ASSOC);
                        //genero 3
                        $gen3 = $conexao->prepare($sql);
                        $gen3->bindParam('genero', $result["gen3_FK"], PDO::PARAM_INT);
                        $gen3->execute();
                        $gen3Res = $gen3->fetch(PDO::FETCH_ASSOC);
                        //genero 4
                        $gen4 = $conexao->prepare($sql);
                        $gen4->bindParam('genero', $result["gen4_FK"], PDO::PARAM_INT);
                        $gen4->execute();
                        $gen4Res = $gen4->fetch(PDO::FETCH_ASSOC);
                        //genero 5
                        $gen5 = $conexao->prepare($sql);
                        $gen5->bindParam('genero', $result["gen5_FK"], PDO::PARAM_INT);
                        $gen5->execute();
                        $gen5Res = $gen5->fetch(PDO::FETCH_ASSOC);

                        ?>
                        <a href="./searchpage.php?genero=<?=$gen1Res['idGenero'];?>">
                        <?php
                        echo $gen1Res["nomeGenero"];
                        ?>
                        </a>
                        <?php
                        //Gen 2
                        if($result["gen2_FK"] != 1){
                            echo ", ";

                        ?>
                        <a href="./searchpage.php?genero=<?=$gen2Res['idGenero'];?>">
                        <?php
                            echo $gen2Res["nomeGenero"];
                            ?>
                        </a>
                        <?php
                        }
                        ?>
                        <?php
                        //Gen 3
                        if($result["gen3_FK"] != 1){
                            echo ", ";

                        ?>
                        <a href="./searchpage.php?genero=<?=$gen3Res['idGenero'];?>">
                        <?php
                            echo $gen3Res["nomeGenero"];
                            ?>
                        </a>
                        <?php
                        }
                        ?>
                        <?php
                        //Gen 4
                        if($result["gen4_FK"] != 1){
                            echo ", ";

                        ?>
                        <a href="./searchpage.php?genero=<?=$gen4Res['idGenero'];?>">
                        <?php
                            echo $gen4Res["nomeGenero"];
                            ?>
                        </a>
                        <?php
                        }
                        ?>
                        <?php
                        //Gen 5
                        if($result["gen5_FK"] != 1){
                            echo ", ";

                        ?>
                        <a href="./searchpage.php?genero=<?=$gen5Res['idGenero'];?>">
                        <?php
                            echo $gen5Res["nomeGenero"];
                            ?>
                        </a>
                        <?php
                        }
                        ?>

                        </p>
                    </div>
                    <div class="i-row">
                        <p><b>Estúdio:</b><?= $result['estudioAnime']?></p>
                    </div>
                    <div class="i-row">
                        <p><b>Produtor(a):</b><?=$result['produtorAnime']?></p>
                    </div>
                    <div class="i-row">
                        <p><b>Ano de Lançamento:</b><?=$result['anoAnime']?></p>
                    </div>
                </div>
            </div>
            <!-- RIGHT MENU -->
            <div class="r-menu">
                <!-- NOME -->
                <div class="rank rank1">
                    <div class="anome"><?= $result['nomeAnime']?></div>
                    <!-- RANK -->
                    <a href="./searchpage.php?opm=8" style="color:#fff;"><div class="ranked">Rank: #<?=$result['rankingAnime']?></div></a>
                </div>
                <!-- SINOPSE -->
                <div class="sinopse">
                    <div class="anome">Sinopse</div>
                    <p><?= $result['sinopseAnime']?></p>
                </div>
                <!-- COMENTÁRIOS -->
                <div class="comments">
                    <!-- MEU COMENTÁRIO -->
                    <div class="mycomment">
                    <div class="u0">
                            <img src="
                            <?php
                            if(!isset($_SESSION['id'])){
                                $foto = "./img/bd img/user/foto/_semfoto.jpg";
                            }else{
                                $foto = $_SESSION['foto'];
                            }
                            echo "$foto";
                            ?>
                            ">
                            <div class="minpt">
                                <div class="inpc" id="inpc">Escreva uma mensagem</div>
                                <button class="midiv" type="submit">
                                    <i class="fa-solid fa-arrow-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- COMENTÁRIO -->
                    <?php
                    $sqlComent = "SELECT * FROM `avaliacao` WHERE id_Anime_FK=:anime";
                    $selectComent = $conexao->prepare($sqlComent);
                    $selectComent->bindParam("anime", $anime, PDO::PARAM_INT);
                    $selectComent->execute();
                    $totalComent = $selectComent->rowCount();
                    $resultComent = $selectComent->fetchAll();

                    if($totalComent != 0){
                        foreach($resultComent as $coment){
                            $sqlComUser = "SELECT *
                                            FROM `usuario`
                                            WHERE idUser=:usuario";
                            $selectComUser = $conexao->prepare($sqlComUser);
                            $selectComUser->bindParam("usuario", $coment['id_User_FK'] , PDO::PARAM_INT);
                            $selectComUser->execute();
                            $totalComUser = $selectComUser->rowCount();
                            $resultComUser = $selectComUser->fetch(PDO::FETCH_ASSOC);
                            if($totalComUser == 0){
                                die("Erro inesperado, recarregue a página para tentarmos corrigir!");
                            }else{

                    ?>
                    <div class="comment">
                        <div class="c1 c2">
                            <div class="u1">
                                <a href="./profile.php?user=<?=$resultComUser['idUser']?>"><img src="<?=$resultComUser['fotoUser']?>"></a>
                                <a href="./profile.php?user=<?=$resultComUser['idUser']?>"><p><?=$resultComUser['nomeUser']?></p></a>
                                <div class="rating">
                                    <input type="radio" <?php if($coment['notaAvaliacao'] == 5){echo "checked=\"true\"";}?>>
                                    <input type="radio" <?php if($coment['notaAvaliacao'] == 4){echo "checked=\"true\"";}?>>
                                    <input type="radio" <?php if($coment['notaAvaliacao'] == 3){echo "checked=\"true\"";}?>>
                                    <input type="radio" <?php if($coment['notaAvaliacao'] == 2){echo "checked=\"true\"";}?>>
                                    <input type="radio" <?php if($coment['notaAvaliacao'] == 1){echo "checked=\"true\"";}?>>
                                </div>
                            </div>
                            <div class="msg">
                                <?= $coment['textoComentario']?>
                            </div>
                            <div class="dl">
                                <form action="anipage-likeC-bd.php" name="likeC<?=$coment['idAvaliacao']?>" method="POST" value="<?=$coment['idAvaliacao']?>">
                                <input type="hidden" name="comentario" value="<?=$coment['idAvaliacao']?>">
                                    <input type="hidden" name="animeAtual" value="<?=$anime?>">
                                    <button type="submit" name="likeC-submit<?=$coment['idAvaliacao']?>" id="likeC-submit<?=$coment['idAvaliacao']?>"></button>
                                    <?php
                                    if(isset($_SESSION['id'])){
                                        $sqlLikeComV = "SELECT * FROM `likes1` WHERE id_User_FK =:user AND id_Comentario_FK=:coment";
                                        $comandoLikesComV = $conexao->prepare($sqlLikeComV);
                                        $comandoLikesComV->execute(array(
                                            ':user'     => $_SESSION['id'],
                                            ':coment'   => $coment['idAvaliacao']
                                        ));
                                        if($comandoLikesComV->rowCount() != 0){
                                    ?>
                                    <label for="likeC-submit<?=$coment['idAvaliacao']?>" class="php-liked fa-solid fa-thumbs-up like php-like-pointer"></label>
                                    <?php
                                        }else{
                                    ?>
                                    <label for="likeC-submit<?=$coment['idAvaliacao']?>" class="fa-solid fa-thumbs-up like php-like-pointer"></label>
                                    <?php
                                        }
                                    }else{
                                    ?>
                                    <label for="likeC-submit<?=$coment['idAvaliacao']?>" class="fa-solid fa-thumbs-up like php-like-pointer"></label>
                                    <?php
                                    }
                                    ?>
                                    <span><?= $coment['likesAvaliacao']?></span>
                                </form>
                                <form action="" method="GET" enctype="multipart/form-data">
                                    <input type="hidden" name="anime" value="<?=$anime?>">
                                    <input type="hidden" name="denun" value="<?=$coment['id_User_FK']?>" >
                                    <label for="denunS-<?=$coment['idAvaliacao']?>"><i class="fa-solid fa-flag denun" name="denunIcon"></i></label>
                                    <button type="submit" name="denunSubmit" id="denunS-<?=$coment['idAvaliacao']?>"></button>
                                </form>
                            </div>
                            <form action="" method="POST" enctype="multipart/form-data" class="inpt">
                                <?php
                                if(isset($_POST['arrow-resp'])){
                                    if(!isset($_SESSION['id'])){
                                        echo "<script>alert(\"Você precisa estar logado para fazer isso\")</script>";
                                        echo "<script>window.location.href = \"./login.php\"</script>";
                                    }else{
                                        include_once("./anipage-resposta-bd.php");
                                    }
                                }
                                ?>
                                <input type="text" name="txt-resp"placeholder="Escreva uma mensagem" autocomplete="off">
                                <input type="hidden" name="comentResp" value="<?=$coment['idAvaliacao']?>">
                                <button class="idiv" type="submit" name="arrow-resp">
                                    <i class="fa-solid fa-arrow-right"></i>
                                </button>
                            </form>
                            
                                <?php
                                $sqlResp = "SELECT * FROM `resposta` WHERE id_Comentario_FK=:comentario";
                                $selectResp = $conexao->prepare($sqlResp);
                                $selectResp->bindParam("comentario", $coment['idAvaliacao'], PDO::PARAM_INT);
                                $selectResp->execute();
                                $totalResp = $selectResp->rowCount();
                                $resultResp = $selectResp->fetchAll();
                                if($totalResp != 0){ ?>
                                <div class="espaco"></div>
                                <div class="respostas">
                                        <?php foreach($resultResp as $resposta){
                                            $sqlRespUser = "SELECT * FROM `usuario` WHERE idUser =:usuarioResp";
                                            $selectRespUser = $conexao->prepare($sqlRespUser);
                                            $selectRespUser->bindParam("usuarioResp", $resposta['id_User_FK'], PDO::PARAM_INT);
                                            $selectRespUser->execute();
                                            $totalRespUser = $selectRespUser->rowCount();
                                            $resultRespUser = $selectRespUser->fetch(PDO::FETCH_ASSOC);
                                            if($totalRespUser == 0){
                                                die("Erro inesperado, recarregue a página para tentarmos corrigir!");
                                            }else{
                                                $respAtual = $resposta['idResp'];
                                    ?>
                                        <div class="resposta">
                                            <div class="c1">
                                                <div class="u1">
                                                <a href="./profile.php?user=<?=$resultRespUser['idUser']?>"><img src="<?=$resultRespUser['fotoUser']?>"></a>
                                                    <a href="./profile.php?user=<?=$resultRespUser['idUser']?>"><p><?=$resultRespUser['nomeUser']?></p></a>
                                                </div>
                                                <div class="msg">
                                                    <?= $resposta['textoResp']?>
                                                </div>
                                                <div class="dl">
                                                    <form action="./anipage-likeR-bd.php?resposta=<?=$resposta['idResp']?>" name="likeR<?=$resposta['idResp']?>" method="POST" id="">
                                                    <input type="hidden" name="animeAtual" value="<?=$anime?>">
                                                        <button type="submit" name="likeR-submit<?=$respAtual?>" id="likeR-submit<?=$resposta['idResp']?>"" class=""></button>
                                                        <?php
                                                        //VERIFICANDO SE O USUARIO DEU LIKE NESSA RESPOSTA
                                                        if(isset($_SESSION['id'])){
                                                            $sqlLikeRespV = "SELECT * FROM `likes2` 
                                                                            WHERE id_Resposta_FK=:resposta AND id_User_FK=:user";
                                                            $comandoLikeRespV = $conexao->prepare($sqlLikeRespV);
                                                            $comandoLikeRespV->execute(array(
                                                                ':resposta'     => $resposta['idResp'],
                                                                ':user'         => $_SESSION['id']
                                                            ));
                                                            if($comandoLikeRespV->rowCount() != 0){
                                                        ?>
                                                        <label for="likeR-submit<?=$resposta['idResp']?>"" class="php-liked fa-solid fa-thumbs-up like php-like-pointer"></label>
                                                        <?php
                                                            }else{
                                                        ?>
                                                        <label for="likeR-submit<?=$resposta['idResp']?>"" class="fa-solid fa-thumbs-up like  php-like-pointer"></label>
                                                        <?php
                                                            }
                                                        }else{
                                                            ?>
                                                        <label for="likeR-submit<?=$resposta['idResp']?>"" class="fa-solid fa-thumbs-up like  php-like-pointer"></label>
                                                        <?php
                                                        }
                                                        ?>
                                                        <span><?= $resposta['likesResp']?></span>
                                                    </form>
                                                    <!-- ESTRUTURA ORIGINAL  
                                                        <form action="" id="forml">
                                                        <input type="checkbox" class="fa-solid fa-thumbs-up like">
                                                        <span> AQUI VAI O $resposta['likesResp']</span>
                                                    </form> -->
                                                    <i class="fa-solid fa-flag denun"></i>
                                                </div>
                                            </div>
                                        </div>
                                    <?php
                                            } 
                                        }    
                                            ?>
                                    </div>
                                <?php
                                }
                                ?>
                        </div>
                    </div> <!-- FIM COMENTARIO -->
                    <?php
                        }
                    }
                }
                    ?>
                </div>
            </div> <!-- FIM R-MENU -->
        </div>
        <?php
            }else{
                die("<center style=\"color: #fff; \">Ocorreu um erro, por favor <a class=\"php-class\" href=\"index.php\">volte a página principal</a> e tente novamente!<center>");
            }
        ?>
    </div>
<!-- SCRIPTS -->
<script src="https://kit.fontawesome.com/83384bd667.js" crossorigin="anonymous"></script>
<script src="./swiper/swiper-bundle.min.js"></script>
<script src="./js/anipage.js"></script>
<script src="./js/global.js"></script>
<!-- FIM -->
</body>
</html>