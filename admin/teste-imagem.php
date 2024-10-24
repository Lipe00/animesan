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
    include("./admnav.php");
    require_once("./teste-imagem-view.php");
    if($total > 0){

    
    ?>
            <?php
            foreach($result as $linha){

                
            ?>
            <p>Nome: <?php echo $linha["imagemAnime"]; ?></p>
            <p>Path 1: <?php echo $linha["path1ImgAnime"]; ?></p>
            <p>Path 2: <?php echo $linha["path2ImgAnime"]; ?></p>
            <p>Nome Original: <?php echo $linha["oriImgAnime"]; ?></p>
            <p><img height="200" src="<?php echo $linha["path2ImgAnime"]?>" alt=""> </p>
            <?php
            }
            ?>
    <?php
    }
    ?>
</div>
<script src="https://kit.fontawesome.com/afb85cfa29.js" crossorigin="anonymous"></script>
</body>
</html>