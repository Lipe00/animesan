<?php
if(!isset($_SESSION)){
    session_start();
}
if(!isset($_SESSION['admin'])){
    header("Refresh: 3; url=../index.php");
    die("Você não tem permissão para acessar essa página");
}else{
?>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/global.css">
<div class="admnav">
    <ul class="primary">
        <!-- <a href="./index.php">
            <li>Home</li>
        </a> -->
        <!-- <li>Anime
            <ul class="secondary">
                <a href="./ani-cad.php">
                    <li>Cadastrar</li>
                </a>
                <a href="./ani-view.php">
                    <li>Visualizar</li>
                </a>
            </ul>
        </li> -->
        <a href="./ani-view.php">
            <li>Animes</li>
        </a>
        <a href="./ani-cad.php">
            <li>Cadastrar</li>
        </a>
        <a href="user-view.php">
            <li>Usúarios</li>
        </a> 
            <!-- <ul class="secondary">
                <a href="./user-cad.php">
                    <li>Cadastrar</li>
                </a>
                <a href="./user-view.php">
                    <li>Visualizar</li>
                </a>
            </ul> -->
        </li>
    </ul>
        <a href="../index.php">
            <div class="logout">Sair</div>
        </a>
</div>
<?php
}
?>