<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeSan</title>
    <link rel="stylesheet" href="./css/global.css">
    <link rel="stylesheet" href="./css/profile.css">
    <link rel="stylesheet" href="./swiper/swiper-bundle.min.css">
    <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
</head>
<body>
        <!-- NAVBAR -->
        <?php
            include("./conexao.php");
            include("navbar.php");
            $viewKey = filter_input(INPUT_GET, "user", FILTER_SANITIZE_NUMBER_INT);
            $sqlView = "SELECT * FROM `usuario` WHERE idUser=:user LIMIT 1";
            $selectView = $conexao->prepare($sqlView);
            $selectView->bindParam("user", $viewKey, PDO::PARAM_INT);
            $selectView->execute();
            $totalView = $selectView->rowCount();
            $resultView = $selectView->fetch(PDO::FETCH_ASSOC);

            if($totalView != 0){
        ?>
        <!-- CONTAINER -->
        <div class="menu scroll">
            <!-- LEFT MENU -->
            <div class="l-menu">
                <div class="ch">
                    <div class="btn atual" id="dados-option">Perfil da Conta</div>
                </div>
                <div class="ch">
                    <div class="btn" id="favoritos-option">Animes Favoritos</div>
                </div>
                <!-- <div class="ch">
                    <div class="btn" id="extra-option">Comentários</div>
                </div> -->
                <!-- <div class="logout">
                    <div class="btn btn-logout">Deslogar</div>
                </div> -->
            </div>
            <!-- RIGHT MENU -->
            <div class="r-menu">
                <!-- DADOS -->
                <div id="display_dados" class="ddados">
                    <!-- BANNER -->
                    <div class="banner">
                        <label id="bannerDiv">
                            <img src="<?= $resultView['bannerUser'] ?>" >
                        </label>
                        <!-- PROFILE -->
                        <div class="profile">
                            <label id="profileDiv">
                                <img src="<?= $resultView['fotoUser'] ?>">
                            </label>
                        </div>
                    </div> <!-- FIM BANNER-->
                    <!-- DADOS PESSOAIS -->
                    <div class="teste">
                        <div class="d-row">
                            <div class="pnome"><h2>Conta de<!-- -->&nbsp<h1><?= $resultView['nomeUser'] ?></h1></h2></div>
                            <br>
                            <p>
                            
                        </div>
                        <!-- SOBRE MIM -->
                        <div class="d-row ld">Sobre mim:</div>
                        <div class="inp dsm">
                            <p id="sbmta"><?php
                            if(!empty($resultView['sobreUser'])){
                                echo $resultView['sobreUser'];
                            }else{
                                echo "Cri cri cri, nada aqui...";
                            }
                            ?></p>
                        </div>
                        <!-- DADOS: BOTÕES -->
                        <div id="row-buttons-1" class="row-button-form edit-button-off d-row">
                            <button id="reset-1" type="reset" class="reset">Cancelar</button>
                            <button id="submit-1" name="btn-alt-dados" type="submit" class="submit">Alterar</button>
                        </div>
                    </div>
                </div>
                <!-- FAVORITOS -->
                <div id="display_favoritos" class="desliga-display resto">
                    <div class="d-row">
                        <h1>Favoritos</h1>
                    </div>
                    <?php
                        $sqlFav = "SELECT *
                        FROM `favoritos`
                        WHERE id_User_FK=:usuario";
        
                    $selectFav = $conexao->prepare($sqlFav);
                    $selectFav->bindParam('usuario', $resultView['idUser'], PDO::PARAM_INT);
                    $selectFav->execute();
                    $resultFav = $selectFav->fetchAll();
                    
                    $totalFav = $selectFav->rowCount();
                    if($totalFav != 0){
                    ?>
                    <div class="favoritos">
                        <?php
                        foreach($resultFav as $resultSFFav){
                            // Comando para selecionar qual é o anime
                            include_once('./conexao.php');
                            $sqlSF = "SELECT *
                                        FROM `animes`
                                        WHERE idAnime=:anime";
                            $selectSF = $conexao->prepare($sqlSF);
                            $selectSF->bindParam('anime',$resultSFFav['id_Anime_FK']);
                            $selectSF->execute();

                            $resultSF = $selectSF->fetch(PDO::FETCH_ASSOC);

                        ?>
                        <!-- CARD -->
                        <a href="./anipage.php?anime=<?=$resultSF['idAnime']?>">
                        <div class="card">
                            <img src="<?= $resultSF['pathImgAnime']; ?>">
                            <p><?=$resultSF['nomeAnime']; ?></p>
                            <div class="hover"></div>
                            <div class="a-info">
                                <div class="a-nome"><?=$resultSF['nomeAnime'];?></div>
                                <b>Ranking:</b><p>#<?=$resultSF['rankingAnime'];?></p>
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
                                        $gen1->bindParam('genero', $resultSF["gen1_FK"], PDO::PARAM_INT);
                                        $gen1->execute();
                                        $gen1Res = $gen1->fetch(PDO::FETCH_ASSOC);

                                        echo $gen1Res["nomeGenero"];
                                        //genero 2
                                        if($resultSF["gen2_FK"] != 1){
                                        $gen2 = $conexao->prepare($sqlGen);
                                        $gen2->bindParam('genero', $resultSF["gen2_FK"], PDO::PARAM_INT);
                                        $gen2->execute();
                                        $gen2Res = $gen2->fetch(PDO::FETCH_ASSOC);
                                        echo ", ";
                                        echo $gen2Res["nomeGenero"];

                                        //+x
                                        $genSobrando = 0;
                                        if($resultSF["gen3_FK"] != 1){
                                            $genSobrando = $genSobrando + 1;
                                        }
                                        if($resultSF["gen4_FK"] != 1){
                                            $genSobrando = $genSobrando + 1;
                                        }
                                        if($resultSF["gen5_FK"] != 1){
                                            $genSobrando = $genSobrando + 1;
                                        }
                                        if($genSobrando != 0){
                                        echo ", +"; echo $genSobrando;
                                        }
                                        }else{
                                            //genero 3
                                            if($resultSF["gen3_FK"] != 1){

                                            $gen3 = $conexao->prepare($sqlGen);
                                            $gen3->bindParam('genero', $resultSF["gen3_FK"], PDO::PARAM_INT);
                                            $gen3->execute();
                                            $gen3Res = $gen3->fetch(PDO::FETCH_ASSOC);
                                            echo ", ";
                                            echo $gen3Res["nomeGenero"];

                                            $genSobrando = 0;
                                            if($resultSF["gen4_FK"] != 1){
                                                $genSobrando = $genSobrando + 1;
                                            }
                                            if($resultSF["gen5_FK"] != 1){
                                                $genSobrando = $genSobrando + 1;
                                            }
                                            if($genSobrando != 0){
                                        echo ", +"; echo $genSobrando;
                                        }
                                            }else{
                                            //genero 4
                                                if($resultSF["gen4_FK"] != 1){
                                                
                                                $gen4 = $conexao->prepare($sqlGen);
                                                $gen4->bindParam('genero', $resultSF["gen4_FK"], PDO::PARAM_INT);
                                                $gen4->execute();
                                                $gen4Res = $gen4->fetch(PDO::FETCH_ASSOC);
                                                echo ", ";
                                                echo $gen4Res["nomeGenero"];

                                                $genSobrando = 0;
                                            if($resultSF["gen5_FK"] != 1){
                                                $genSobrando = $genSobrando + 1;
                                            }
                                                }else{
                                                    if($resultSF["gen5_FK"] != 1){
                                                        //genero 5
                                                        $gen5 = $conexao->prepare($sqlGen);
                                                        $gen5->bindParam('genero', $resultSF["gen5_FK"], PDO::PARAM_INT);
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
                                <b>Avaliação:</b>
                                <!-- SCRIPT VERIFICAR VALOR DE AVALIAÇÃO  - INICIO    -->
                                            <p><?= $resultSF['avaliacaoAnime'];?></p>
                                        <!-- SCRIPT VERIFICAR VALOR DE AVALIAÇÃO  - FINAL    -->
                                        <!-- SCRIPT VERIFICAR NUMERO DE FAVORITOS -->
                                        <b>Favoritados:</b><p><?=$resultSF['favoritosAnime'];?></p>
                            </div>
                        </div>
                        </a>
                        <?php
                        }
                        ?>
                    </div>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </div>
        <?php
        }else{
        ?>
        <center><h1 style="color:#fff;">Não foi possível encontrar nenhum usuário</h1></center>
        <?php
        }
        ?>
<!-- SCRIPTS -->
<script src="https://kit.fontawesome.com/83384bd667.js" crossorigin="anonymous"></script>
<script src="./js/profile.js"></script>
<script src="./js/global.js"></script>
<!-- FIM -->
</body>
</html>