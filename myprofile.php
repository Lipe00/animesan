<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeSan</title>
    <link rel="stylesheet" href="./css/global.css">
    <link rel="stylesheet" href="./css/myprofile.css">
    <link rel="stylesheet" href="./swiper/swiper-bundle.min.css">
    <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
</head>
<body id="body">
    <div class="space">
        <?php
            include_once("./protect-user.php");
        ?>
        <!-- NAVBAR -->
        <?php
            include("navbar.php")
        ?>
        <!-- POP-UP: BANNER -->
        <div class="pop-up desativado" id="pupb">
            <div class="pupdiv">
                <div class="pup-cont">
                    <form action="" method="POST" enctype="multipart/form-data">
                    <?php
                    if (isset($_POST['btn-banner-submit'])) {
                        $extensaoB = strtolower(pathinfo($_FILES["banner"]["name"], PATHINFO_EXTENSION)); 
                        if($_FILES["banner"]["size"] > 2000000){
                            echo'<center style="color:#ff0000; font-size:20px;">Arquivo muito grande, tamanho máximo 2MB!!</center>';
                        }else{
                            if(($extensaoB != "jpg") && ($extensaoB != "png") && 
                            ($extensaoB != "jpeg") && ($extensaoB != "gif")){
                                echo'<center style="color:#ff0000; font-size:20px;">Tipo de arquivo não aceito!!</center>';
                            }else{
                                if($_POST['nomeInp'] != $_SESSION['nome'] or $_POST['emailInp'] != $_SESSION['email'] or $_POST['sobreMim'] != $_SESSION['sobre']){
                                    include_once('./profile-banner-bd.php');    
                                }else{
                                    
                                }
                            }
                        }
                    }
                    ?>
                        <div class="inp-f">
                            <label for="banner">Escolher Imagem</label>
                            <input type="file" id="banner" name="banner">
                        </div>
                        <div class="buttons">
                            <button type="reset" class="pup-btn reset" id="cancelbtnb">Cancelar</button>
                            <button type="submit"class="pup-btn submit" name="btn-banner-submit">Enviar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- POP-UP: PROFILE -->
        <div class="pop-up desativado" id="pupp">
            <div class="pupdiv">
                <div class="pup-cont">
                    <form action="" method="POST" enctype="multipart/form-data">
                    <?php
                    if (isset($_POST['btn-foto-submit'])) {
                        $extensao = strtolower(pathinfo($_FILES["foto"]["name"], PATHINFO_EXTENSION)); 
                        if($_FILES["foto"]["size"] > 2000000){
                            echo'<center style="color:#ff0000; font-size:20px;">Arquivo muito grande, tamanho máximo 2MB!!</center>';
                        }else{
                            if(($extensao != "jpg") && ($extensao != "png") && 
                            ($extensao != "jpeg") && ($extensao != "gif")){
                                echo'<center style="color:#ff0000; font-size:20px;">Tipo de arquivo não aceito!!</center>';
                            }else{
                                include_once('./profile-foto-bd.php');
                            }
                        }
                    }
                    ?>
                        <div class="inp-f">
                            <label for="foto">Escolher Imagem</label>
                            <input type="file" id="foto" name="foto">
                        </div>
                        <div class="buttons">
                            <button type="reset" class="pup-btn reset" id="cancelbtnp">Cancelar</button>
                            <button type="submit"class="pup-btn submit" name="btn-foto-submit">Enviar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- CONTAINER -->
        <div class="menu scroll">
            <!-- LEFT MENU -->
            <div class="l-menu">
                <div class="ch">
                    <div class="btn atual" id="dados-option">Minha Conta</div>
                </div>
                <div class="ch">
                    <div class="btn" id="favoritos-option">Animes Favoritos</div>
                </div>
                <?php
                    if(!isset($_SESSION['admin'])){
                    }else{

                    
                ?>
                <div class="ch">
                    <a href="./admin/ani-view.php">   
                        <div class="btn" id="admin-option">
                            Admin
                        </div>
                    </a>
                </div>
                <?php
                    }
                ?>
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
                            <img src="<?= $_SESSION['banner'] ?>" >
                            <div class="bhover">
                                <i class="fa-solid fa-image"></i>
                            </div>
                        </label>
                        <!-- PROFILE -->
                        <div class="profile">
                            <label id="profileDiv">
                                <img src="<?= $_SESSION['foto'] ?>">
                                <div class="phover" id="profile">
                                    <i class="fa-solid fa-camera"></i>
                                </div>
                            </label>
                        </div>
                    </div> <!-- FIM BANNER-->
                    <!-- DADOS PESSOAIS -->
                    <div class="teste">
                        <form method="POST" enctype="multipart/form-data">
                            <div class="d-row">
                                <h1>Dados Pessoais</h1>
                                <br>
                                <p>
                                <?php
                                if (isset($_POST['btn-alt-dados'])) {

                                    include_once('./profile-alt-dados.php');
                                }
                                ?>
                                
                                <div class="icon-title">
                                    <input type="checkbox" name="check_dados" id="check_dados" hidden>
                                    <label for="check_dados" class="check-dados">
                                        <i class='fas fa-pen-alt' id="icon-edit-dados"></i>
                                        <i class='fas fa-times x icon-off' id="icon-edit-dados-2"></i>
                                    </label>
                                </div>
                            </div>
                            <!-- DADOS: NOME -->
                            <div class="d-row">
                                <div class="label">
                                    <label for="nomeInp">Nome:</label>
                                </div>
                                <div class="inp">
                                    <input type="text" name="nomeInp" id="nomeInp" class="inputUser  input-disabled inputPassword" autocomplete="off" placeholder=" " value="<?= $_SESSION['nome'] ?>" spellcheck="false" readonly>
                                </div>
                            </div>
                            <!-- DADOS: E-MAIL -->
                            <div class="d-row">
                                <div class="label">
                                    <label for="emailInp">E-mail:</label>
                                </div>
                                <div class="inp">
                                    <input type="text" name="emailInp" id="emailInp" class="inputUser  input-disabled inputPassword" autocomplete="off" placeholder=" " value="<?= $_SESSION['email'] ?>" readonly>
                                </div>
                            </div>
                            <!-- SOBRE MIM -->
                            <div class="d-row ld">Sobre mim:</div>
                            <div class="inp dsm">
                            <textarea rows="3"  name="sobreMim" maxlength="240" class="input-disabled" id="sbmta" placeholder="Escreva alguma coisa sobre você" autocomplete="off" readonly><?=$_SESSION['sobre']?></textarea>
                            </div>
                            <!-- DADOS: BOTÕES -->
                            <div id="row-buttons-1" class="row-button-form edit-button-off d-row">
                                <button id="reset-1" type="reset" class="reset">Cancelar</button>
                                <button id="submit-1" name="btn-alt-dados" type="submit" class="submit">Alterar</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- FAVORITOS -->
                <div id="display_favoritos" class="desliga-display resto">
                    <div class="d-row">
                        <h1>Favoritos</h1>
                    </div>
                    <?php
                    require_once("./favoritos-script.php");
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
    </div>
<!-- SCRIPTS -->
<script src="https://kit.fontawesome.com/83384bd667.js" crossorigin="anonymous"></script>
<script src="./js/myprofile.js"></script>
<script src="./js/global.js"></script>
<!-- FIM -->
</body>
</html>