<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeSan</title>
    <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <div class="space">
        <!-- NAVBAR -->
        <?php
            include("navbar.php")
        ?>
        <!-- CAROUSEL -->
        <?php
        include_once("./index-carousel.php");
        ?>
        <div class=" carousel swiper mySwiper-C">
            <div class="swiper-wrapper">
                <div class="slide swiper-slide">
                    <a href="./anipage.php?anime=<?= "$valor1"?>">
                        <img src="./img/bd img/anime/carousel/<?=$valor1?>.png">;
                        <div class="texto">
                            <h1><?=$result1['nomeAnime'];?></h1>
                            <p><?=$result1['sinopseAnime'];?></p>
                        </div>
                    </a>
                </div>
                <div class="slide swiper-slide">
                <a href="./anipage.php?anime=<?= "$valor2"?>">
                        <img src="./img/bd img/anime/carousel/<?=$valor2?>.png">;
                        <div class="texto">
                            <h1><?=$result2['nomeAnime'];?></h1>
                            <p><?=$result2['sinopseAnime'];?></p>
                        </div>
                    </a>
                </div>
                <div class="slide swiper-slide">
                <a href="./anipage.php?anime=<?= "$valor3"?>">
                        <img src="./img/bd img/anime/carousel/<?=$valor3?>.png">;
                        <div class="texto">
                            <h1><?=$result3['nomeAnime'];?></h1>
                            <p><?=$result3['sinopseAnime'];?></p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
        <p><b>
        <?php
        //include("./index-populares.php");
        // if($total != 0){
            
        
        ?>
        </b></p>
        <?php
        include_once("./index-anime.php");
        if($total != 0){
            
        
        ?>

        <div class="categoria"><a href="./searchpage.php?busca=recent">Adicionados Recentemente <i class="fa-solid fa-arrow-right"></i></a> </div>
        <div class="align">
            <div class="container">
                <div class="content">
                    <div class="swiper mySwiper-S">
                        <div class="slider swiper-wrapper">
                            <?php
                            foreach($result as $linha){
                                $urlAni = $linha['idAnime'];
                            
                            ?>
                            <a href="./anipage.php?anime=<?= "$urlAni" ?>">
                                <div class="swiper-slide">
                                    <div class="card">
                                        <img src="<?= $linha["pathImgAnime"];?>">
                                        <p><?= $linha["nomeAnime"];?></p>
                                        <div class="hover"></div>
                                        <div class="a-info">
                                            <div class="a-nome"><?= $linha["nomeAnime"];?></div>
                                            <b>Gêneros:</b>
                                            <p>
                                            <!-- SELECIONANDO GENERO - INICIO -->
                                            <?php
                                            include_once("./conexao.php");
                                            $sqlGen = "SELECT *
                    
                                                    FROM `genero`
                                                    WHERE `idGenero`=:genero";
                                            //puxando nomes do generos
                                            //genero 1
                                            $gen1 = $conexao->prepare($sqlGen);
                                            $gen1->bindParam('genero', $linha["gen1_FK"], PDO::PARAM_INT);
                                            $gen1->execute();
                                            $gen1Res = $gen1->fetch(PDO::FETCH_ASSOC);

                                            echo $gen1Res["nomeGenero"];
                                            //genero 2
                                            if($linha["gen2_FK"] != 1){
                                            $gen2 = $conexao->prepare($sqlGen);
                                            $gen2->bindParam('genero', $linha["gen2_FK"], PDO::PARAM_INT);
                                            $gen2->execute();
                                            $gen2Res = $gen2->fetch(PDO::FETCH_ASSOC);
                                            echo ", ";
                                            echo $gen2Res["nomeGenero"];

                                            //+x
                                            $genSobrando = 0;
                                            if($linha["gen3_FK"] != 1){
                                                $genSobrando = $genSobrando + 1;
                                            }
                                            if($linha["gen4_FK"] != 1){
                                                $genSobrando = $genSobrando + 1;
                                            }
                                            if($linha["gen5_FK"] != 1){
                                                $genSobrando = $genSobrando + 1;
                                            }
                                            if($genSobrando != 0){
                                            echo ", +"; echo $genSobrando;
                                            }
                                            }else{
                                                //genero 3
                                                if($linha["gen3_FK"] != 1){

                                                $gen3 = $conexao->prepare($sqlGen);
                                                $gen3->bindParam('genero', $linha["gen3_FK"], PDO::PARAM_INT);
                                                $gen3->execute();
                                                $gen3Res = $gen3->fetch(PDO::FETCH_ASSOC);
                                                echo ", ";
                                                echo $gen3Res["nomeGenero"];

                                                $genSobrando = 0;
                                                if($linha["gen4_FK"] != 1){
                                                    $genSobrando = $genSobrando + 1;
                                                }
                                                if($linha["gen5_FK"] != 1){
                                                    $genSobrando = $genSobrando + 1;
                                                }
                                                if($genSobrando != 0){
                                            echo ", +"; echo $genSobrando;
                                            }
                                                }else{
                                                //genero 4
                                                    if($linha["gen4_FK"] != 1){
                                                    
                                                    $gen4 = $conexao->prepare($sqlGen);
                                                    $gen4->bindParam('genero', $linha["gen4_FK"], PDO::PARAM_INT);
                                                    $gen4->execute();
                                                    $gen4Res = $gen4->fetch(PDO::FETCH_ASSOC);
                                                    echo ", ";
                                                    echo $gen4Res["nomeGenero"];

                                                    $genSobrando = 0;
                                                if($linha["gen5_FK"] != 1){
                                                    $genSobrando = $genSobrando + 1;
                                                }
                                                    }else{
                                                        if($linha["gen5_FK"] != 1){
                                                            //genero 5
                                                            $gen5 = $conexao->prepare($sqlGen);
                                                            $gen5->bindParam('genero', $linha["gen5_FK"], PDO::PARAM_INT);
                                                            $gen5->execute();
                                                            $gen5Res = $gen5->fetch(PDO::FETCH_ASSOC);
                                                            echo ", ";
                                                            echo $gen5Res["nomeGenero"];
                                                            }
                                                    }
                                                }
                                            }
                                            
                                            ?>
                                            </p>

                                            <!-- SELECIONANDO GENERO - FINAL -->
                                            <b>Avaliação:</b>
                                                <p><?= $linha['avaliacaoAnime'];?></p>
                                                

                                            <!-- SCRIPT VERIFICAR VALOR DE AVALIAÇÃO  - FINAL    -->
                                            <!-- SCRIPT VERIFICAR NUMERO DE FAVORITOS -->
                                            <b>Favoritados:</b><p><?=$linha['favoritosAnime'];?></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next swiper-navBtn"></div>
                <div class="swiper-button-prev swiper-navBtn"></div>
            </div>
        </div>
        <?php
        }
        ?>

        <?php
        include_once("./index-cat-rows.php");
        // echo $totalRGen;
        if($totalRGen != 0){
            foreach($resultRGen as $rows_gen){
                $sqlGAni = "SELECT *
                                        FROM `animes`
                                        WHERE gen1_FK =:genId
                                        OR gen2_FK =:genId
                                        OR gen3_FK =:genId
                                        OR gen4_FK =:genId
                                        OR gen5_FK =:genId";
                            $selectGAni = $conexao->prepare($sqlGAni);
                            $selectGAni->bindParam('genId', $rows_gen['idGenero'], PDO::PARAM_INT);
                            $selectGAni->execute();
                            $resultGAni= $selectGAni->fetchAll();
                            $totalGAni = $selectGAni->rowCount();
                    
                            //Impedindo de criar rows vazias
                            if($totalGAni == 0){}
                            else{

                            
                
        ?>

        <div class="categoria"><a href="./searchpage.php?genero=<?=$rows_gen['idGenero']?>"><?=$rows_gen['nomeGenero']?><i class="fa-solid fa-arrow-right"></i></a></div>
        <div class="align">
            <div class="container">
                <div class="content">
                    <div class="swiper mySwiper-S<?=$rows_gen['idGenero']?>">
                        <div class="slider swiper-wrapper">
                            <?php
                            

                            foreach($resultGAni as $linha){
                                $urlAniG = $linha['idAnime'];
                            ?>

                                <div class="swiper-slide">
                                <a href="./anipage.php?anime=<?= "$urlAniG" ?>">
                                    <div class="card">
                                        <img src="<?= $linha["pathImgAnime"];?>">
                                        <p><?= $linha["nomeAnime"];?></p>
                                        <div class="hover"></div>
                                        <div class="a-info">
                                            <div class="a-nome"><?= $linha["nomeAnime"];?></div>
                                            <b>Gêneros:</b>
                                            <p>
                                            <!-- SELECIONANDO GENERO - INICIO -->
                                            <?php
                                            include_once("./conexao.php");
                                            $sqlGen = "SELECT *
                    
                                                    FROM `genero`
                                                    WHERE `idGenero`=:genero";
                                            //puxando nomes do generos
                                            //genero 1
                                            $gen1 = $conexao->prepare($sqlGen);
                                            $gen1->bindParam('genero', $linha["gen1_FK"], PDO::PARAM_INT);
                                            $gen1->execute();
                                            $gen1Res = $gen1->fetch(PDO::FETCH_ASSOC);

                                            echo $gen1Res["nomeGenero"];
                                            //genero 2
                                            if($linha["gen2_FK"] != 1){
                                            $gen2 = $conexao->prepare($sqlGen);
                                            $gen2->bindParam('genero', $linha["gen2_FK"], PDO::PARAM_INT);
                                            $gen2->execute();
                                            $gen2Res = $gen2->fetch(PDO::FETCH_ASSOC);
                                            echo ", ";
                                            echo $gen2Res["nomeGenero"];

                                            //+x
                                            $genSobrando = 0;
                                            if($linha["gen3_FK"] != 1){
                                                $genSobrando = $genSobrando + 1;
                                            }
                                            if($linha["gen4_FK"] != 1){
                                                $genSobrando = $genSobrando + 1;
                                            }
                                            if($linha["gen5_FK"] != 1){
                                                $genSobrando = $genSobrando + 1;
                                            }
                                            if($genSobrando != 0){
                                            echo ", +"; echo $genSobrando;
                                            }
                                            }else{
                                                //genero 3
                                                if($linha["gen3_FK"] != 1){

                                                $gen3 = $conexao->prepare($sqlGen);
                                                $gen3->bindParam('genero', $linha["gen3_FK"], PDO::PARAM_INT);
                                                $gen3->execute();
                                                $gen3Res = $gen3->fetch(PDO::FETCH_ASSOC);
                                                echo ", ";
                                                echo $gen3Res["nomeGenero"];

                                                $genSobrando = 0;
                                                if($linha["gen4_FK"] != 1){
                                                    $genSobrando = $genSobrando + 1;
                                                }
                                                if($linha["gen5_FK"] != 1){
                                                    $genSobrando = $genSobrando + 1;
                                                }
                                                if($genSobrando != 0){
                                            echo ", +"; echo $genSobrando;
                                            }
                                                }else{
                                                //genero 4
                                                    if($linha["gen4_FK"] != 1){
                                                    
                                                    $gen4 = $conexao->prepare($sqlGen);
                                                    $gen4->bindParam('genero', $linha["gen4_FK"], PDO::PARAM_INT);
                                                    $gen4->execute();
                                                    $gen4Res = $gen4->fetch(PDO::FETCH_ASSOC);
                                                    echo ", ";
                                                    echo $gen4Res["nomeGenero"];

                                                    $genSobrando = 0;
                                                if($linha["gen5_FK"] != 1){
                                                    $genSobrando = $genSobrando + 1;
                                                }
                                                    }else{
                                                        if($linha["gen5_FK"] != 1){
                                                            //genero 5
                                                            $gen5 = $conexao->prepare($sqlGen);
                                                            $gen5->bindParam('genero', $linha["gen5_FK"], PDO::PARAM_INT);
                                                            $gen5->execute();
                                                            $gen5Res = $gen5->fetch(PDO::FETCH_ASSOC);
                                                            echo ", ";
                                                            echo $gen5Res["nomeGenero"];
                                                            }
                                                    }
                                                }
                                            }
                                            
                                            ?>
                                            </p>

                                            <!-- SELECIONANDO GENERO - FINAL -->
                                            <b>Avaliação:</b>
                                            <!-- SCRIPT VERIFICAR VALOR DE AVALIAÇÃO  - INICIO    -->
                                                <p><?= $linha['avaliacaoAnime'];?></p>
                                                

                                            <!-- SCRIPT VERIFICAR VALOR DE AVALIAÇÃO  - FINAL    -->
                                            <!-- SCRIPT VERIFICAR NUMERO DE FAVORITOS  INICIO-->
                                            <b>Favoritados:</b><p><?=$linha['favoritosAnime'];?></p>
                                            <!-- SCRIPT VERIFICAR NUMERO DE FAVORITOS  FINAL-->
                                        </div>
                                    </div>
                                    </a>
                                </div>
                            <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next-<?=$rows_gen['idGenero']?> swiper-navBtn"></div>
                <div class="swiper-button-prev-<?=$rows_gen['idGenero']?> swiper-navBtn"></div>
            </div>
        </div>
        <?php
                }
            }
        }
        ?>
    </div>
    <!-- SCRIPTS -->
    <script src="https://kit.fontawesome.com/afb85cfa29.js" crossorigin="anonymous"></script>
    <script src="swiper/swiper-bundle.min.js"></script>
    <script src="js/index.js"></script>
    <script src="./js/global.js"></script>
</body>
</html>
<!-- 
    <img src="img/code-geass.jpeg">
    <img src="img/digimon-frontier.jpg">
    <img src="testes/img/jojo-golden-wind.jpg">
    <img src="img/arifureta.jpg">
    <img src="img/hataraku-maou.jpg">
    <img src="img/isekai-maou.jpg">
    <img src="img/kumo-desu.jpg">
    <img src="img/tensei-shitarra.jpg">
    <img src="img/inazuma-eleven.jpg">
-->