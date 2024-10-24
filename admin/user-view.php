<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeSan</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="shortcut icon" href="../img/favicon/favicon.ico" type="image/x-icon">
</head>
<body>
<div class="space">
    <!-- NAVBAR -->
    <?php
        include("admnav.php");
    ?>
    <!-- CONTAINER: VIEW -->
    <div class="view2">
        <h1>VISUALIZADOR</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Path</th>
                    <th>Denúncias</th>
                </tr>
            </thead>
            <?php
            include("./_conexao/conexao.php");
            include_once("./user-view-bd.php");
            if($total != 0){
                
            ?>
            <tbody>
                <?php
                foreach($result as $user_row){
                    $sqlDenun = "SELECT * FROM `denuncias` WHERE id_denunciado_FK=:user";
                    $comandoDenun = $conexao->prepare($sqlDenun);
                    $comandoDenun->bindParam("user", $user_row['idUser'], PDO::PARAM_INT);
                    $comandoDenun->execute();
                    $resultDenun = $comandoDenun->fetch(PDO::FETCH_ASSOC);
                    $totalDenun = $comandoDenun->rowCount()
                ?>
                <tr>
                    <td><?=$user_row['idUser']?></td>
                    <td><?=$user_row['nomeUser']?></td>
                    <td><?=$user_row['emailUser']?></td>
                    <td><?=$user_row['fotoUser']?></td>
                    <td id="denun"><?=$totalDenun?></td></td>
                </tr>
                <?php
                }
                ?>
            </tbody>
            <?php
            }
            ?>
        </table>
    </div>
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
<script>
    const denun = document.querySelectorAll("#denun")
    
    denun.forEach((e)=>{

        let denunnum = parseInt(e.innerHTML) 

        if(denunnum <= 5){
        /*e.classList.add("green")
        e.classList.remove("orange")
        e.classList.remove("red")*/
        e.style.color="#33ff99"
        } else if(denunnum >= 6 && denunnum <= 25){
        /*e.classList.remove("green")
        e.classList.add("orange")
        e.classList.remove("red")*/
        e.style.color="#FFA500"
    } else if(denunnum >= 26){
        /*e.classList.remove("green")
        e.classList.remove("orange")
        e.classList.add("red")*/
        e.style.color="#ff4455"
}    
    })


</script>