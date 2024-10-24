<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeSan</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="space">
    <!-- NAVBAR -->
    <?php
        include("admnav.php");
    ?>
    <!-- CONTAINER: VIEW -->
    <?php
    require_once("./adm-view-bd.php");
    if($total > 0 ){
    
    ?>
    <div class="view2">
        <h1>VISUALIZADOR</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>usuario</th>
                    
                </tr>
            </thead>
            <tbody>
                <?php
                    foreach($result as $linha){
                ?>
                <tr>
                    <td><?= $linha["idAdmin"]; ?></td>
                    <td><?= $linha["id_user_FK"]; ?></td>
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
<style>
.view th:nth-child(1), .view td:nth-child(1){ /* ID */
    text-align: center;
    width: 50px;
}
.view th:nth-child(2), .view td:nth-child(2){ /* NOME */
    width: 301px;
}
.view th:nth-child(3), .view td:nth-child(3){ /* URL */
    width: 301px;
}
.view th:nth-child(4), .view td:nth-child(4){ /* DESC */
    width: 700px;
    text-align: center;
}
.view th:nth-child(5), .view td:nth-child(5){ /* EDITAR */
    text-align: center;
    width: 100px;
}
.view td:nth-child(5):hover{
    cursor: pointer;
}
.view th:nth-child(6), .view td:nth-child(6){ /* EXCLUIR */
    text-align: center;
    width: 100px;
}
.view tbody tr:hover td:nth-child(6) i{
    color: #ff4455;
}
/* CORES */
.green{
    color: #33ff99;
}
.orange{
    color: #FFA500;
}
.red{
    color: #ff4455;
}
</style>
