<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeSan</title>
    <link rel="shortcut icon" href="../img/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
<div class="space">
    <!-- NAVBAR -->
    <?php
    include("./admnav.php")
    ?>
    <!-- CONTAINER -->
    <?php
        require_once("./ani-view-bd.php");
        if($total > 0){
    ?>
    <div class="container">
        <h1>Visualizador de Imagens</h1>
        <?php
            foreach($result as $linha)
            {
        ?>
        <div class="crow">
            <div class="pre">Nome:</div>
            <div class="content"><?php echo $linha["nomeAnime"]; ?></div>
        </div>
        <div class="crow">
            <div class="pre">Path:</div>
            <div class="content"><?php echo $linha["pathImgAnime"]; ?></div>
        </div>
        <div class="crow">
            <img src=".<?php $linha["pathImgAnime"]?>">
        </div>
        <?php
            }
        ?>
    </div>
    <?php
    }
    ?>
</div>
<script src="https://kit.fontawesome.com/afb85cfa29.js" crossorigin="anonymous"></script>
</body>
</html>