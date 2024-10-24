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
    <!-- CONTAINER: REGISTER -->
    <div class="register">
        <h1>CADASTRO DE ANIME</h1>
        <?php
            if (isset($_POST['btn-cad'])) {

                include_once('./ani-cad-bd.php');
            }
            ?>
        <form action="" method="POST" enctype='multipart/form-data'>
            <div class="row">
                <label for="nomeAni">Nome</label>
                <input type="text" placeholder="Nome do Anime" id="nomeAni" name="nomeAni" autocomplete="off">
            </div>
            <div class="row">
                <label for="anoAni">Ano Lançamento</label>
                <input type="text" placeholder="Ano de Lançamento do Anime" id="anoAni" name="anoAni" autocomplete="off">
            </div>
            <?php
            require_once("./genero.php");
                if($totalG > 0){
                ?>
            <div class="row">
                <label for="gen1Ani">Genero 1</label>
                <select name="gen1Ani" id="genAni">
                    <?php
                            foreach($resultG as $linha){
                    ?>
                    <option value="<?= $linha["idGenero"]; ?>"><?php echo $linha["nomeGenero"]; ?></option>
                        <?php
                        }
                        ?>
                </select>
            </div>
            <div class="row">
                <label for="gen2Ani">Genero 2</label>
                <select name="gen2Ani" id="genAni2">
                    <?php
                            foreach($resultG as $linha){
                    ?>
                    <option value="<?= $linha["idGenero"]; ?>"><?php echo $linha["nomeGenero"]; ?></option>
                        <?php
                        }
                        ?>
                </select>
            </div>
            <div class="row">
                <label for="gen3Ani">Genero 3</label>
                <select name="gen3Ani" id="gen3Ani">
                    <?php
                            foreach($resultG as $linha){
                    ?>
                    <option value="<?= $linha["idGenero"]; ?>"><?php echo $linha["nomeGenero"]; ?></option>
                        <?php
                        }
                        ?>
                </select>
            </div>
            <div class="row">
                <label for="gen4Ani">Genero 4</label>
                <select name="gen4Ani" id="gen4Ani">
                    <?php
                            foreach($resultG as $linha){
                    ?>
                    <option value="<?= $linha["idGenero"]; ?>"><?php echo $linha["nomeGenero"]; ?></option>
                        <?php
                        }
                        ?>
                </select>
            </div>
            <div class="row">
                <label for="gen5Ani">Genero 5</label>
                <select name="gen5Ani" id="gen5Ani">
                    <?php
                            foreach($resultG as $linha){
                    ?>
                    <option value="<?= $linha["idGenero"]; ?>"><?php echo $linha["nomeGenero"]; ?></option>
                        <?php
                        }
                        ?>
                </select>
            </div>
            <?php
                    }
                    ?>
            <div class="row">
                <label for="estuAni">Estudio</label>
                <input type="text" placeholder="Estudio do anime" id="estuAni" name="estuAni" autocomplete="off">
            </div>
            <div class="row">
                <label for="prodAni">Produtor</label>
                <input type="text" placeholder="Produtor(a) do Anime" id="prodAni" name="prodAni" autocomplete="off">
            </div>
            <div class="row">
                <label for="foto">Selecione uma imagem </label>
                    <div class="input-fake">
                        <label for="foto" class="label-fake">Selecione a Imagem</label>
                    </div>
                <input type="file" id="foto" name="foto" autocomplete="off">
            </div>

            <div class="row">
                <label for="sinopAni">Sinopse</label>
            <input type="text" placeholder="Sinopse do Anime" id="sinopAni" name="sinopAni" autocomplete="off">
            </div>

            <div class="buttons">
                <button class="clear" type="reset">Limpar</button>
                <button name="btn-cad" class="submit" type="submit">Enviar</button>
            </div>
        </form>
    </div>
</div>
<script src="https://kit.fontawesome.com/afb85cfa29.js" crossorigin="anonymous"></script>
</body>
</html>