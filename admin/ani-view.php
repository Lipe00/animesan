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
    <?php
    require_once("./_conexao/conexao.php");
    $id_exc = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);
    if(!empty($id_exc) and $id_exc != 0){
        
        $sqlSExc= "SELECT * FROM `animes` WHERE idAnime=:anime";
        $comandoSExc = $conexao->prepare($sqlSExc);
        $comandoSExc->bindParam("anime", $id_exc, PDO::PARAM_INT);
        $comandoSExc->execute();
        $resultSExc = $comandoSExc->fetch(PDO::FETCH_ASSOC);
        $totalSExc = $comandoSExc->rowCount();
        ?>
        <div class="pup">
            <div class="pupd">
        <div class="pupc">
                <form action="" method="POST" enctype="multipart/form-data">
                    <?php
                    if(isset($_POST['exc-btn'])){
                        $sqlEXCF = "DELETE FROM `animes` WHERE idAnime=:animeExc";
                        $selectEXCF = $conexao->prepare($sqlEXCF);
                        $selectEXCF->bindParam("animeExc", $id_exc, PDO::PARAM_INT);
                        $selectEXCF->execute();

                        if($selectEXCF->rowCount() != 0){
                            echo"<center style='color:#90ee90; font-size:20px;'>Excluído com sucesso!</center>";
                            header("Refresh: 1; url=./ani-view.php");
                        }else{
                            echo"<center style='color:#ff0000; font-size:20px;'>Erro ao excluir!</center>";
                        }
                    }
                    ?>
                Tem certeza que deseja excluir este anime? (<?= $resultSExc['nomeAnime']?>)
                <div class="pupbtns">
                    <a href="./ani-view.php">
                        <button type="button" class="submit ex" id="cancel">Cancelar</button>
                    </a>
                    <button type="submit" name="exc-btn"class="clear">Excluir</button>
                </div>
            </form>
        </div>
    </div>
</div>
    <?php   
    }else{
    ?>
    <div class="pup desativado">
        <div class="pupd">
            <div class="pupc">
                    <form action="" method="POST" enctype="multipart/form-data">
                    Tem certeza que deseja excluir este anime?
                    <div class="pupbtns">
                        <button type="button" class="submit ex" id="cancel">Cancelar</button>
                        <button type="submit" name="exc-btn"class="clear">Excluir</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <?php   
    }
    ?>

<div class="space">
    <!-- NAVBAR -->
    <?php
    include("./admnav.php")
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
                    <th>Gêneros</th>
                    <th>Path</th>
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
                    <td>
                    <?php 
                    include_once("./_conexao/conexao.php");
                        $sql = "SELECT *

                                FROM `genero`
                                WHERE `idGenero`=:genero";
                        //puxando nomes do generos

                        //genero 1
                        $gen1 = $conexao->prepare($sql);
                        $gen1->bindParam('genero', $linha["gen1_FK"], PDO::PARAM_INT);
                        $gen1->execute();
                        $gen1Res = $gen1->fetch(PDO::FETCH_ASSOC);
                        //genero 2
                        $gen2 = $conexao->prepare($sql);
                        $gen2->bindParam('genero', $linha["gen2_FK"], PDO::PARAM_INT);
                        $gen2->execute();
                        $gen2Res = $gen2->fetch(PDO::FETCH_ASSOC);
                        //genero 3
                        $gen3 = $conexao->prepare($sql);
                        $gen3->bindParam('genero', $linha["gen3_FK"], PDO::PARAM_INT);
                        $gen3->execute();
                        $gen3Res = $gen3->fetch(PDO::FETCH_ASSOC);
                        //genero 4
                        $gen4 = $conexao->prepare($sql);
                        $gen4->bindParam('genero', $linha["gen4_FK"], PDO::PARAM_INT);
                        $gen4->execute();
                        $gen4Res = $gen4->fetch(PDO::FETCH_ASSOC);
                        //genero 5
                        $gen5 = $conexao->prepare($sql);
                        $gen5->bindParam('genero', $linha["gen5_FK"], PDO::PARAM_INT);
                        $gen5->execute();
                        $gen5Res = $gen5->fetch(PDO::FETCH_ASSOC);

                        echo $gen1Res["nomeGenero"];
                        if($linha["gen2_FK"] != 1){
                            echo ", ";
                            echo $gen2Res["nomeGenero"];
                        }
                        if($linha["gen3_FK"] != 1){
                            echo ", ";
                            echo $gen3Res["nomeGenero"];
                        }
                        if($linha["gen4_FK"] != 1){
                            echo ", ";
                            echo $gen4Res["nomeGenero"];
                        }
                        if($linha["gen5_FK"] != 1){
                            echo ", ";
                            echo $gen5Res["nomeGenero"];
                        }

                    ?>
                    </td>
                    <td><?= $linha["pathImgAnime"]; ?></td>
                    <td><!-- SCRIPT VERIFICAR VALOR DE AVALIAÇÃO  - INICIO    -->
                                            <?php
                                            $sqlAva = "SELECT *
                                                        FROM `avaliacao`
                                                        WHERE id_Anime_FK =:anime";
                                            $selectAva = $conexao->prepare($sqlAva);
                                            $selectAva->bindParam('anime', $linha['idAnime']); 
                                            $selectAva->execute();
                                            $resultAva= $selectAva->fetchAll();
                                            $totalAva = $selectAva->rowCount();

                                            if($totalAva == 0){
                                                ?>
                                                <p>0</p>
                                                <?php
                                            }else{
                                                $valorAva = 0.00;
                                                foreach($resultAva as $ava){
                                                    $valorAva = $valorAva + $ava['notaAvaliacao'];
                                                }
                                                $valorAvaFinal = 0.00;
                                                $valorAvaFinal = ($valorAva/$totalAva);

                                                ?>
                                                <p><?= number_format($valorAvaFinal, 2);?></p>
                                                <?php
                                            }
                                            ?>
                                            

                                        <!-- SCRIPT VERIFICAR VALOR DE AVALIAÇÃO  - FINAL    --></td>
                    <td><?= $linha["favoritosAnime"]; ?></td>
                    <td>
                        <a href="./ani-alt.php?id=<?= $linha['idAnime']; ?>">    
                            <i class="fa-solid fa-pen-to-square"></i>
                        </a>
                    </td>
                    <td>
                        <a href="./ani-view.php?id=<?= $linha['idAnime']; ?>">
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
<script src="js/script.js" crossorigin="anonymous"></script>
</body>
</html>