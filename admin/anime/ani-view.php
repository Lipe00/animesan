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
    include("../admnav.php")
    ?>
    <!-- CONTAINER: VIEW -->
    
    <?php
        require_once("./ani-view-bd.php");
        if($total > 0){
    ?>
    <div class="view">
        <h1>VISUALIZADOR</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Avaliação</th>
                    <th>Favoritos</th>
                    <th>Editar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
            <?php
                    foreach($result as $linha)
                    {
                ?>
                <tr>
                    <td><?= $linha["idAnime"]; ?></td>
                    <td><?= $linha["nomeAnime"]; ?></td>
                    <td><a href="<?= $linha["avaliacaoAnime"]; ?>" target="_blank"><?= $linha["avaliacaoAnime"]; ?></a></td>
                    <td><?= $linha["favoritosAnime"]; ?></td>
                    <td>
                        <a href="./ani-alt.php?id=<?= $linha['idAnime']; ?>">    
                            <i class="fa-solid fa-pen-to-square"></i>
                        </a>
                    </td>
                    <td>
                        <a href="./ani-exc.php?id=<?= $linha['idAnime']; ?>">    
                            <i class="fa-solid fa-trash-can"></i>
                        </a>
                    </td>
                </tr>
                
                <?php
                    }
                    ?>
            </tbody>
        </table>
    </div>
    <?php
    }
    ?>
</div>
<script src="https://kit.fontawesome.com/afb85cfa29.js" crossorigin="anonymous"></script>
</body>
</html>