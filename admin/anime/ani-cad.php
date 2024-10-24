<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <<title>AnimeSan</title>
    <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="space">
    <!-- NAVBAR -->
    <<?php
    include("../admnav.php")
    ?>
    <!-- CONTAINER: REGISTER -->
    <div class="register">
        <h1>CADASTRO DE ANIME</h1>
        <form action="ani-cad-bd.php" method="POST" enctype='multipart/form-data'>
            <div class="row">
                <label for="nomeAni">Nome</label>
                <input type="text" placeholder="Nome do Anime" id="nomeAni" name="nomeAni" autocomplete="off">
            </div>
            <div class="row">
                <label for="genAni">Genero</label>
                <input type="text" placeholder="Genero do Anime" id="genAni" name="genAni" autocomplete="off">
            </div>
            <div class="row">
                <label for="avaAni">Avaliação</label>
                <input type="text" placeholder="Avaliação do Anime" id="avaAni" name="avaAni" autocomplete="off">
            </div>
            <div class="row">
                <label for="favAni">Favoritos</label>
                <input type="text" placeholder="Número de vezes q o anime foi favoritado" id="favAni" name="favAni" autocomplete="off">
            </div>
            <div class="row">
                <label for="estuAni">Estudio</label>
                <input type="text" placeholder="Genero do site" id="estuAni" name="estuAni" autocomplete="off">
            </div>
            <div class="row">
                <label for="prodAni">Produtor</label>
                <input type="text" placeholder="Produtor(a) do Anime" id="prodAni" name="prodAni" autocomplete="off">
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
            <input type="text" placeholder="Sinopse do Anime" id="sinopAni" name="sinopAni" autocomplete="off">
            </div>

            <div class="buttons">
                <button class="clear" type="reset">Limpar</button>
                <button class="submit" type="submit">Enviar</button>
            </div>
        </form>
    </div>
</div>
<script src="https://kit.fontawesome.com/afb85cfa29.js" crossorigin="anonymous"></script>
</body>
</html>