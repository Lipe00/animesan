<?php
include_once("./conexao.php");
if(!isset($_SESSION)){
    session_start();
}
    if(!isset($_SESSION['id'])){
        echo "<center style=\" color: #ff0000;\">Você precisa estar logado para fazer isso!</center>";
    }else{
        if($_SERVER['REQUEST_METHOD']=="POST"){
        $user = $_SESSION['id'];

        $check = filter_input(INPUT_POST, "check-heart", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $anime = filter_input(INPUT_POST, "anime-fav", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        $sqlVerify = "SELECT * FROM `favoritos` WHERE id_Anime_FK=:anime AND id_User_FK=:usuario LIMIT 1";
        $selectVerify = $conexao->prepare($sqlVerify);
        $selectVerify->bindParam("anime", $anime, PDO::PARAM_INT);
        $selectVerify->bindParam("usuario", $_SESSION['id'], PDO::PARAM_INT);
        $selectVerify->execute();
        $totalVerify = $selectVerify->rowCount();
        $resultVerify = $selectVerify->fetch(PDO::FETCH_ASSOC);

        if($totalVerify == 0){
            $sqlInsert = "INSERT INTO
                            `favoritos`
                                (`idFav`, `id_Anime_FK`, `id_User_FK`)
                            VALUES
                            (NULL, :anime, :user)";
            $comandoInsert= $conexao->prepare($sqlInsert);
            $comandoInsert->execute(array(
                ':anime'    => $anime,
                ':user'  => $user
            ));
            if($comandoInsert->rowCount() != 0){
                echo "<center style=\" color: #229A00;\">Sucesso!</center>";
                echo "<script>window.location.href = \"./anipage.php?anime=$anime\"</script>";
            }else{
                echo "<script>alert(\"Erro, recarregue a página e tente novamente - Insert\")</script>";
            }
        }elseif($totalVerify == 1){
            $sqlDelete = "DELETE FROM `favoritos`
                            WHERE id_Anime_FK=:anime AND id_User_FK=:user";
            $comandoDelete= $conexao->prepare($sqlDelete);
            $comandoDelete->execute(array(
            ':anime'    => $anime,
            ':user'  => $user
            ));
            if($comandoDelete->rowCount() != 0){
            echo "<center style=\" color: #229A00;\">Sucesso!</center>";
            echo "<script>window.location.href = \"./anipage.php?anime=$anime\"</script>";
            }else{
            echo "<script>alert(\"Erro, recarregue a página e tente novamente - Delete\")</script>";
}
        }else{
            echo "<script>alert(\"Erro inesperado, recarregue a página para tentarmos corrigir\")</script>";
        }

        }else{
            echo "<center style=\" color: #ff0000;\">O envio não foi feito pelo método POST!</center>";
        }
}
?>