<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeSan</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="space">
    <!-- NAVBAR -->
    <<?php
    include("./admnav.php")
    ?>
    <!-- CONTAINER: REGISTER -->
    <?php
            $idPhp = filter_input(INPUT_GET, "idAni", FILTER_SANITIZE_NUMBER_INT);
        include("./ani-alt-view.php");
    ?>

    <div class="register">
        <h1>Editar</h1>
        <form action="ani-alt-bd.php" method="POST" enctype='multipart/form-data'>
        <input type="hidden" name="idAni" value="<?=$linha['idAnime'];?>">
        <input type="hidden" name="fotoAnterior" value="<?=$linha['imagemAnime'];?>">

            <div class="row">
                <label for="nomeFav">Nome</label>
                <input type="text" placeholder="Nome do site" id="nomeAni" name="nomeAni" value="<?= $linha["nomeAnime"]?>" autocomplete="off" >
            </div>
            <div class="row">
                <label for="genAni">Genero</label>
                <input type="text" placeholder="Genero do Anime" id="genAni" name="genAni" value="<?= $linha["generoAnime"]?>"  autocomplete="off">
            </div>
            <div class="row">
                <label for="avaAni">Avaliação</label>
                <input type="text" placeholder="Avaliação do Anime" id="avaAni" name="avaAni" value="<?= $linha["avaliacaoAnime"]?>" autocomplete="off">
            </div>
            <div class="row">
                <label for="favAni">Favoritos</label>
                <input type="text" placeholder="Número de vezes q o anime foi favoritado" id="favAni" name="favAni" value="<?= $linha["favoritosAnime"]?>"  autocomplete="off">
            </div>
            <div class="row">
                <label for="estuAni">Estudio</label>
                <input type="text" placeholder="Genero do site" id="estuAni" name="estuAni" value="<?= $linha["estudioAnime"]?>"  autocomplete="off">
            </div>
            <div class="row">
                <label for="prodAni">Produtor</label>
                <input type="text" placeholder="Produtor(a) do Anime" id="prodAni" name="prodAni" value="<?= $linha["produtorAnime"]?>"  autocomplete="off">
            </div>
            <div class="row">
                <label for="imgAni">Selecione uma imagem </label>
                    <div class="input-fake">
                        <label for="imgAni" class="label-fake">Selecione a Imagem</label>
                    </div>
                <input type="file" id="foto" name="foto" autocomplete="off">
            </div>

            <div class="row">
                <label for="sinopAni">Sinopse</label>
            <input type="text" placeholder="Sinopse do Anime" id="sinopAni" name="sinopAni" value="<?= $linha["sinopseAnime"]?>"  autocomplete="off">
            </div>
            <div class="buttons">
                <button class="submit" type="reset" onclick="javascript:history.go(-1);">Cancelar</button>
                <button class="submit" type="submit">Editar</button>
            </div>
        </form>
    </div>
</div>
<script src="https://kit.fontawesome.com/afb85cfa29.js" crossorigin="anonymous"></script>
</body>
</html>