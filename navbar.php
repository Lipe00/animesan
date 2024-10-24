<?php
include_once("./conexao.php");
?>

<div class="navbar">
    <a href="./index.php" class="logo">
        <img src="img/logo/animesan.png">
    </a>
    <div class="divisa">
        <div class="search-box">
            <form action="./searchpage.php" method="GET">
                <?php
                $pesquisa = filter_input(INPUT_GET, "busca", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                if(!empty($pesquisa)){
                ?>
                <input type="text" name="busca" value="<?=$pesquisa;?>"autocomplete="off" placeholder="Digite para pesquisar" class="sinput">
                <?php
                }else{
                ?>
                <input type="text" name="busca" autocomplete="off" placeholder="Digite para pesquisar" class="sinput">
                <?php
                }
                ?>
            </form>
            <div class="search-btn">
                <i class="fas fa-search"></i>
            </div>
            <div class="cancel-btn deactivated">
                <i class="fas fa-times"></i>
            </div>
        </div>
        <div class="random">
            <?php
            $sqlANav = "SELECT * FROM `animes`";
            $selectANav = $conexao->prepare($sqlANav);
            $selectANav->execute();
            $totalANav = $selectANav->rowCount();

            $randomURL = rand(1, $totalANav);
            ?>
            <a href="./anipage.php?anime=<?=$randomURL?>">
            <i class="fa-solid fa-dice"></i>
            </a>
        </div>
        <!-- SISTEMA PARA MUDAR CASO O USUARIO ESTEJA LOGADO/DESLOGADO  -->
        <?php
        if(!isset($_SESSION)){
            session_start();
        }
        if(!isset($_SESSION['id'])){
            
        
        ?>
        <div class="deslogado">
            <div class="login">
                <a href="./login.php">    
                    Entrar
                </a>
            </div>
            <div class="register">
                <a href="./register.php">
                    Cadastrar
                </a>
            </div>
        </div>
        <?php
        }
        else{

        ?>
        <div class="logado">
            <div class="p-icon">
                <img src="<?= $_SESSION['foto']?>">
                <span>
                    <div class="dropd">
                        <a href="./myprofile.php">
                            <div class="dp-row">Perfil</div>
                        </a>
                        <?php
                        if(!isset($_SESSION['admin'])){

                        }else{
                        ?>
                        <a href="./admin/ani-view.php">
                            <div class="dp-row">Admin</div> 
                        </a>
                        <?php
                        }
                        ?>
                        <a href="./logout.php">
                            <div class="dp-row dp-logout">Sair<i class="fa-solid fa-arrow-right-from-bracket"></i></div>
                        </a>
                    </span>
                </div>
            </div>
        </div>
        <?php
        }
        ?>
    </div>
</div>

<!-- CELL NAVBAR -->
<div class="c-navbar">
    <i class="fa-solid fa-bars" id="rbt"></i>
    </div>
    <div class="rmn desativado no-scroll" id="rmn">
        <div class="rll">
            <div class="logo">
                <img src="img/logo/animesan.png">
            </div>
            <div class="oqe">
                <a href="./index.php">
                    <i class="fa-solid fa-house"></i>
                    <div class="crw">Início</div>
                </a>
                <div class="searchc">
                    <i class="fas fa-search"></i>
                    <form action="./searchpage.php" method="GET">
                        <?php
                        $pesquisa = filter_input(INPUT_GET, "busca", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                        if(!empty($pesquisa)){
                        ?>
                        <input type="text" name="busca" value="<?=$pesquisa;?>"autocomplete="off" placeholder="Pesquisa">
                        <?php
                        }else{
                        ?>
                        <input type="text" name="busca" autocomplete="off" placeholder="Pesquisar">
                        <?php
                        }
                        ?>
                    </form>
                </div>
                <a href="./anipage.php?anime=<?=$randomURL?>">
                    <i class="fa-solid fa-dice"></i>
                    <div class="crw">Aleatório</div>
                </a>

                <?php
                if(!isset($_SESSION)){
                session_start();
                }
                if(!isset($_SESSION['id'])){
                
            
                ?>

                <div class="deslogado-c">
                    <a href="./login.php">
                        <i class="fa-solid fa-user"></i>
                        <div class="crw">Entrar</div>
                    </a>
                    <a href="./register.php">
                        <i class="fa-solid fa-pen-to-square icad"></i>
                        <div class="crw">Cadastrar</div>
                    </a>
                </div>

                <?php
                }
                else{

                ?>

                <div class="logado-c">
                    <a href="./myprofile.php">
                        <i class="fa-solid fa-user"></i>
                        <div class="crw">Perfil</div>
                    </a>

                    <?php
                    if(!isset($_SESSION['admin'])){

                    }else{
                    ?>

                    <a href="./admin/ani-view.php">
                        <i class="fa-solid fa-lock"></i>
                        <div class="crw">Admin</div> 
                    </a>

                    <?php
                    }
                    ?>

                    <a href="./logout.php" class="cdesl">
                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                        <div class="crw">Sair</div>
                    </a>
                </div>

                <?php
                }
                ?>

            </div>
        </div>
        <div class="rrr" id="rrr"></div>
    </div>
</div>