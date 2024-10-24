<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeSan</title>
    <link rel="stylesheet" href="./css/global.css">
    <link rel="stylesheet" href="./css/searchpage.css">
    <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
</head>
<body id="body">
    <div class="space">
        <!-- NAVBAR -->
        <?php
            include("navbar.php");
            include("./conexao.php");

            $pesquisa = filter_input(INPUT_GET, "busca", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $pesquisa = trim(strip_tags($pesquisa));
            $genero = filter_input(INPUT_GET, "genero", FILTER_SANITIZE_NUMBER_INT);
            $genero = trim(strip_tags($genero));
            $order = filter_input(INPUT_GET, "opm", FILTER_SANITIZE_NUMBER_INT);
            $order = trim(strip_tags($order));
            
        ?>
    
        <!-- SEARCH -->
        <div class="search scroll">
            <h1>Exibindo resultados para "<?=$pesquisa?>"</h1>
            <div class="tags">
                <div class="rtags">
                    <!-- PESQUISA -->
                    <div class="tag" id="se">
                        <div class="se ttag">
                            <div class="teste2">Pesquisa: <b id="gs">"<?=$pesquisa?>"</b></div>
                            <div class="x" id="sx">
                                <form action="./searchpage.php" method="GET" enctype="multipart/form-data">
                                    <?php
                                    if(!empty($pesquisa)){
                                    ?>
                                    <input type="hidden" name="busca" value="">
                                    <?php
                                    }
                                    ?>
                                    <?php
                                    if(!empty($genero)){
                                    ?>
                                    <input type="hidden" name="genero" value="<?=$genero?>">
                                    <?php
                                    }
                                    ?>
                                    <?php
                                    if(!empty($order)){
                                    ?>
                                    <input type="hidden" name="opm" value="<?=$order?>">
                                    <?php
                                    }
                                    ?>
                                    <button type="submit" id="submit-clear" class="ltl"></button>
                                    <label for="submit-clear" class="lab">
                                        <i class="fa-solid fa-xmark" id="sxi"></i>
                                    </label>
                                </form>
                            </div>
                        </div>
                    </div>
                    <?php


                        $sqlGen = "SELECT * FROM `genero` WHERE idGenero != 1";
                        $comandoGen = $conexao->prepare($sqlGen);
                        $comandoGen->execute();
                        $resultGen = $comandoGen->fetchAll();
                        $totalGen = $comandoGen->rowCount();
                        if($totalGen != 0){
                            
                    ?>
                    <!-- GENEROS -->
                    <div class="tag gen" id="sgen">
                        <div class="geno ttag">
                            <?php
                            if(!empty($genero)){
                                $sqlSGen = "SELECT * FROM `genero` WHERE idGenero=:genAtual LIMIT 1";
                                $selectSGen = $conexao->prepare($sqlSGen);
                                $selectSGen->bindParam('genAtual', $genero, PDO::PARAM_INT);
                                $selectSGen->execute();
                                $totalSGen= $selectSGen->rowCount();
                                $resultSGen = $selectSGen->fetch(PDO::FETCH_ASSOC);
                                if($totalSGen == 0){
                                    echo "<p><b>Gênero inválido</b></p>";
                                }else{
                            ?>
                            <div class="teste2">Gênero: <b id="gb"><?=$resultSGen['nomeGenero']?></b></div>
                            <div class="x" id="gx">
                                <i class="fa-solid fa-xmark" id="gxi"></i>
                            </div>
                            
                            <?php
                                }
                            }else{
                            ?>
                            <div class="teste2">Gênero: <b id="gb"><div class="des">Nenhum selecionado</div></b></div>
                            <?php
                            }
                            ?>
                            <!-- Gênero: <b id="gb">"Nenhum selecionado"</b> -->
                        </div>

                        <div class="gens none" id="gens">
                            
                                <?php
                                    foreach($resultGen as $gen_row){
                                ?>
                                <form action="./searchpage.php" id="formGen" method="GET" enctype="multipart/form-data">
                                    <div class="geni">
                                        <?php
                                        if(!empty($pesquisa)){
                                        ?>
                                        <input type="hidden" name="busca" value ="<?=$pesquisa?>">
                                        <?php
                                        }
                                        ?>
                                        <?php
                                        if(!empty($order)){
                                        ?>
                                        <input type="hidden" name="opm" value ="<?=$order?>">
                                        <?php
                                        }
                                        ?>
                                        <input type="hidden" name="genero" value ="<?=$gen_row['idGenero']?>">
                                        <button class="btngen" type="submit" name="" name="gen<?=$gen_row['idGenero']?>"><?=$gen_row['nomeGenero']?></button>
                                    </div>
                                </form>
                                <?php
                                    }
                                ?>
                        </div>
                    </div>
                    <?php
                        }   
                    ?>
                </div>
                <form action="./searchpage.php" id="formOrder"method="GET" enctype="multipart/form-data">
                    <div class="op"> Ordenar por: 
                        <div class="ops">
                            <div class="opa" id="opa">
                                <?php
                                if(!empty($order)){
                                    if($order == 1){
                                        echo "<b id=\"bo\">Ordem alfabética (A-Z)</b>";
                                    }elseif($order == 2){
                                        echo "<b id=\"bo\">Ordem alfabética (Z-A)</b>";
                                    }elseif($order == 3){
                                        echo "<b id=\"bo\">Data de lançamento (Crescente)</b>";
                                    }elseif($order == 4){
                                        echo "<b id=\"bo\">Data de lançamento (Decrescente)</b>";
                                    }elseif($order == 5){
                                        echo "<b id=\"bo\"Avaliação (Crescente)</b>";
                                    }elseif($order == 6){
                                        echo "<b id=\"bo\">Avaliação (Decrescente)</b>";
                                    }elseif($order == 7){
                                        echo "<b id=\"bo\">Ranking (Crescente)</b>";
                                    }elseif($order == 8){
                                        echo "<b id=\"bo\">Ranking (Decrescente)</b>";
                                    }
                                }else{
                                ?>
                                <b id="bo">Ordem alfabética (A-Z)</b>
                                <?php
                                }
                                ?>
                                <i class="fa-solid fa-chevron-down" id="arrow"></i>
                            </div>
                            <?php
                                if(!empty($pesquisa)){
                                ?>
                                <input type="hidden" name="busca" value="<?=$pesquisa?>">
                                <?php
                                }
                                ?>
                                <?php
                                if(!empty($genero)){
                                ?>
                                <input type="hidden" name="genero" value="<?=$genero?>">
                                <?php
                                }
                                ?>
                                <div class="opm none" id="opm">
                                    <div class="opmo">
                                        <input type="radio" name="opm" id="opm1" value="1" onchange="this.form.submit()">
                                        <label for="opm1">Ordem alfabética (A-Z)</label>
                                    </div>
                                    <div class="opmo">
                                        <input type="radio" name="opm" id="opm2" value="2" onchange="this.form.submit()">
                                        <label for="opm2">Ordem alfabética (Z-A)</label>
                                    </div>
                                    <div class="opmo">
                                        <input type="radio" name="opm" id="opm3" value="3" onchange="this.form.submit()" >
                                        <label for="opm3">Data de lançamento (Crescente)</label>
                                    </div>
                                    <div class="opmo">
                                        <input type="radio" name="opm" id="opm4" value="4" onchange="this.form.submit()">
                                        <label for="opm4">Data de lançamento (Decrescente)</label>
                                    </div>
                                    <div class="opmo">
                                        <input type="radio" name="opm" id="opm5" value="5" onchange="this.form.submit()">
                                        <label for="opm5">Avaliação (Crescente)</label>
                                    </div>
                                    <div class="opmo">
                                        <input type="radio" name="opm" id="opm6" value="6" onchange="this.form.submit()">
                                        <label for="opm6">Avaliação (Decrescente)</label>
                                    </div>
                                    <div class="opmo">
                                        <input type="radio" name="opm" id="opm7" value="7" onchange="this.form.submit()">
                                        <label for="opm7">Ranking (Crescente)</label>
                                    </div>
                                    <div class="opmo">
                                        <input type="radio" name="opm" id="opm8" value="8" onchange="this.form.submit()">
                                        <label for="opm8">Ranking (Decrescente)</label>
                                    </div>
                                </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- CONTAINER -->
        <div class="container">
                <?php
                //verificando como deve ser feita a busca
                //a variável flagtemp será usada para a construção do switch
                $flagTemp = 0;
                if(!empty($pesquisa) and $pesquisa == "recent"){
                    $flagTemp = 9;
                }elseif(!empty($pesquisa) and !empty($genero) and empty($order)){
                    $flagTemp = 1;
                }elseif(!empty($pesquisa) and empty($genero) and empty($order)){
                    $flagTemp = 2;
                }elseif(empty($pesquisa) and !empty($genero) and empty($order)){
                    $flagTemp = 3;
                }elseif(empty($pesquisa) and empty($genero) and empty($order)){
                    $flagTemp = 4;
                }elseif(!empty($pesquisa) and !empty($genero) and !empty($order)){
                    $flagTemp = 5;
                }elseif(!empty($pesquisa) and empty($genero) and !empty($order)){
                    $flagTemp = 6;
                }elseif(empty($pesquisa) and !empty($genero) and !empty($order)){
                    $flagTemp = 7;
                }elseif(empty($pesquisa) and empty($genero) and !empty($order)){
                    $flagTemp = 8;
                }else{
                    $flagTemp = 0;
                }
                // echo $flagTemp;
                $varOrder = "";
                if(!empty($order)){
                    if($order == 1){
                        $varOrder = "nomeAnime";
                    }elseif($order == 2){
                        $varOrder = "nomeAnime DESC";
                    }elseif($order == 3){
                        $varOrder = "anoAnime";
                    }elseif($order == 4){
                        $varOrder = "anoAnime DESC";
                    }elseif($order == 5){
                        $varOrder = "avaliacaoAnime";
                    }elseif($order == 6){
                        $varOrder = "avaliacaoAnime DESC";
                    }elseif($order == 7){
                        $varOrder = "rankingAnime DESC";
                    }elseif($order == 8){
                        $varOrder = "rankingAnime";
                    }
                }
                if($flagTemp == 1){
                        $sqlPesquisa = "SELECT * FROM `animes` 
                                        WHERE nomeAnime LIKE '%$pesquisa%'
                                        AND (gen1_FK='$genero'
                                        OR  gen2_FK='$genero'
                                        OR  gen3_FK='$genero'
                                        OR  gen4_FK='$genero'
                                        OR  gen5_FK='$genero')
                                        ORDER BY nomeAnime";
                        $selectPesquisa = $conexao->prepare($sqlPesquisa);
                        $selectPesquisa->execute();
                        $totalPesquisa = $selectPesquisa->rowCount();
                        $resultPesquisa = $selectPesquisa->fetchAll();
                }elseif($flagTemp == 2){
                    $sqlPesquisa = "SELECT * FROM `animes` 
                                    WHERE nomeAnime LIKE '%$pesquisa%'
                                    ORDER BY nomeAnime";
                    $selectPesquisa = $conexao->prepare($sqlPesquisa);
                    $selectPesquisa->execute();
                    $totalPesquisa = $selectPesquisa->rowCount();
                    $resultPesquisa = $selectPesquisa->fetchAll();
                }elseif($flagTemp == 3){
                    $sqlPesquisa = "SELECT * FROM `animes` 
                                        WHERE (gen1_FK='$genero'
                                        OR  gen2_FK='$genero'
                                        OR  gen3_FK='$genero'
                                        OR  gen4_FK='$genero'
                                        OR  gen5_FK='$genero')
                                        ORDER BY nomeAnime";
                        $selectPesquisa = $conexao->prepare($sqlPesquisa);
                        $selectPesquisa->execute();
                        $totalPesquisa = $selectPesquisa->rowCount();
                        $resultPesquisa = $selectPesquisa->fetchAll();
                }elseif($flagTemp == 4 or $flagTemp == 0){
                    $sqlPesquisa = "SELECT * FROM `animes` ORDER BY nomeAnime";
                        $selectPesquisa = $conexao->prepare($sqlPesquisa);
                        $selectPesquisa->execute();
                        $totalPesquisa = $selectPesquisa->rowCount();
                        $resultPesquisa = $selectPesquisa->fetchAll();
                }elseif($flagTemp == 5){
                    
                    $sqlPesquisa = "SELECT * FROM `animes` 
                                    WHERE nomeAnime LIKE '%$pesquisa%'
                                    AND (gen1_FK='$genero'
                                    OR  gen2_FK='$genero'
                                    OR  gen3_FK='$genero'
                                    OR  gen4_FK='$genero'
                                    OR  gen5_FK='$genero')
                                    ORDER BY $varOrder";
                    $selectPesquisa = $conexao->prepare($sqlPesquisa);
                    $selectPesquisa->execute();
                    $totalPesquisa = $selectPesquisa->rowCount();
                    $resultPesquisa = $selectPesquisa->fetchAll();
            }elseif($flagTemp == 6){
                $sqlPesquisa = "SELECT * FROM `animes` 
                                WHERE nomeAnime LIKE '%$pesquisa%'
                                ORDER BY $varOrder";
                $selectPesquisa = $conexao->prepare($sqlPesquisa);
                $selectPesquisa->execute();
                $totalPesquisa = $selectPesquisa->rowCount();
                $resultPesquisa = $selectPesquisa->fetchAll();
            }elseif($flagTemp == 7){
                $sqlPesquisa = "SELECT * FROM `animes` 
                                    WHERE (gen1_FK='$genero'
                                    OR  gen2_FK='$genero'
                                    OR  gen3_FK='$genero'
                                    OR  gen4_FK='$genero'
                                    OR  gen5_FK='$genero')
                                    ORDER BY $varOrder";
                    $selectPesquisa = $conexao->prepare($sqlPesquisa);
                    $selectPesquisa->execute();
                    $totalPesquisa = $selectPesquisa->rowCount();
                    $resultPesquisa = $selectPesquisa->fetchAll();
            }elseif($flagTemp == 8){
                $sqlPesquisa = "SELECT * FROM `animes` ORDER BY $varOrder";
                    $selectPesquisa = $conexao->prepare($sqlPesquisa);
                    $selectPesquisa->execute();
                    $totalPesquisa = $selectPesquisa->rowCount();
                    $resultPesquisa = $selectPesquisa->fetchAll();
            }elseif($flagTemp == 9){
                $sqlPesquisa = "SELECT * FROM `animes` ORDER BY idAnime DESC";
                    $selectPesquisa = $conexao->prepare($sqlPesquisa);
                    $selectPesquisa->execute();
                    $totalPesquisa = $selectPesquisa->rowCount();
                    $resultPesquisa = $selectPesquisa->fetchAll();
            }
                ?>
                

                <?php
                if($totalPesquisa != 0){
                    foreach($resultPesquisa as $resultado){
                        $urlAni = $resultado['idAnime'];
                ?>
                        <a href="./anipage.php?anime=<?= "$urlAni" ?>">
                                    <div class="swiper-slide">
                                        <div class="card">
                                            <img src="<?= $resultado["pathImgAnime"];?>">
                                            <p><?= $resultado["nomeAnime"];?></p>
                                            <div class="hover"></div>
                                            <div class="a-info">
                                                <div class="a-nome"><?= $resultado["nomeAnime"];?></div>
                                                <b>Ranking:</b><p>#<?=$resultado['rankingAnime'];?></p>
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
                                                $gen1->bindParam('genero', $resultado["gen1_FK"], PDO::PARAM_INT);
                                                $gen1->execute();
                                                $gen1Res = $gen1->fetch(PDO::FETCH_ASSOC);

                                                echo $gen1Res["nomeGenero"];
                                                //genero 2
                                                if($resultado["gen2_FK"] != 1){
                                                $gen2 = $conexao->prepare($sqlGen);
                                                $gen2->bindParam('genero', $resultado["gen2_FK"], PDO::PARAM_INT);
                                                $gen2->execute();
                                                $gen2Res = $gen2->fetch(PDO::FETCH_ASSOC);
                                                echo ", ";
                                                echo $gen2Res["nomeGenero"];
                                                $genSobrando = 0;
                                                if($resultado["gen3_FK"] != 1){
                                                    $genSobrando = $genSobrando + 1;
                                                }
                                                if($resultado["gen4_FK"] != 1){
                                                    $genSobrando = $genSobrando + 1;
                                                }
                                                if($resultado["gen5_FK"] != 1){
                                                    $genSobrando = $genSobrando + 1;
                                                }
                                                if($genSobrando != 0){
                                                echo ", +"; echo $genSobrando;
                                                }
                                                }else{
                                                    //genero 3
                                                    if($resultado["gen3_FK"] != 1){

                                                    $gen3 = $conexao->prepare($sqlGen);
                                                    $gen3->bindParam('genero', $resultado["gen3_FK"], PDO::PARAM_INT);
                                                    $gen3->execute();
                                                    $gen3Res = $gen3->fetch(PDO::FETCH_ASSOC);
                                                    echo ", ";
                                                    echo $gen3Res["nomeGenero"];

                                                    $genSobrando = 0;
                                                    if($resultado["gen4_FK"] != 1){
                                                        $genSobrando = $genSobrando + 1;
                                                    }
                                                    if($resultado["gen5_FK"] != 1){
                                                        $genSobrando = $genSobrando + 1;
                                                    }
                                                    if($genSobrando != 0){
                                                echo ", +"; echo $genSobrando;
                                                }
                                                    }else{
                                                    //genero 4
                                                        if($resultado["gen4_FK"] != 1){
                                                        
                                                        $gen4 = $conexao->prepare($sqlGen);
                                                        $gen4->bindParam('genero', $resultado["gen4_FK"], PDO::PARAM_INT);
                                                        $gen4->execute();
                                                        $gen4Res = $gen4->fetch(PDO::FETCH_ASSOC);
                                                        echo ", ";
                                                        echo $gen4Res["nomeGenero"];

                                                        $genSobrando = 0;
                                                    if($resultado["gen5_FK"] != 1){
                                                        $genSobrando = $genSobrando + 1;
                                                    }
                                                        }else{
                                                            if($resultado["gen5_FK"] != 1){
                                                                //genero 5
                                                                $gen5 = $conexao->prepare($sqlGen);
                                                                $gen5->bindParam('genero', $resultado["gen5_FK"], PDO::PARAM_INT);
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
                                                <p><?= $resultado['avaliacaoAnime'];?></p>
                                                
                                            <!-- SCRIPT VERIFICAR VALOR DE AVALIAÇÃO  - FINAL    -->
                                            <!-- SCRIPT VERIFICAR NUMERO DE FAVORITOS -->
                                            <b>Favoritados:</b><p><?=$resultado['favoritosAnime'];?></p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                <?php
                    }    
                }else{
                ?>
                <p><b style="color: #fff; font-size: 26px;">Nenhum resultado encontrado....</b></p>
                <?php
                }
                ?>
        </div>
    </div>
<!-- SCRIPTS -->
<script src="https://kit.fontawesome.com/83384bd667.js" crossorigin="anonymous"></script>
<script src="./js/searchpage.js"></script>
<script src="./js/global.js"></script>
<!-- FIM -->
</body>
</html>