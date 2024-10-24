<?php
include_once("./conexao.php");
if(!isset($_SESSION)){
    session_start();
}
if(!isset($_SESSION['id'])){
    die("<center style=\"color: #fff; \">Você não pode acessar esta página pq não está logado!<p><a href=\"login.php\">Faça Login</a></p><center>");
}else{
    $comment = filter_input(INPUT_POST, "comentario", FILTER_SANITIZE_NUMBER_INT);
    $anime = filter_input(INPUT_POST, "animeAtual", FILTER_SANITIZE_NUMBER_INT);
    $userAtual = $_SESSION['id'];
    var_dump($comment);
    
    $sqlVerify = "SELECT * FROM `likes1` WHERE id_User_FK=:usuario AND id_Comentario_FK=:comment";
    $selectVerify = $conexao->prepare($sqlVerify);
    $selectVerify->execute(array(
        ':usuario'      => $userAtual,
        ':comment'         => $comment
    ));
    $totalVerify = $selectVerify->rowCount();
    //CHAMANDO ROW DO COMENTARIO
    $sqlCom = "SELECT * FROM `avaliacao` WHERE idAvaliacao=:comment LIMIT 1";
    $comandoCom = $conexao->prepare($sqlCom);
    $comandoCom->bindParam("comment", $comment, PDO::PARAM_INT);
    $comandoCom->execute();
    $resultCom = $comandoCom->fetch(PDO::FETCH_ASSOC);

    if($totalVerify == 0){
        $sqlIns = "INSERT INTO `likes1`(`idLikes1`, `id_Comentario_FK`, `id_User_FK`)
                    VALUES (NULL,:comment, :usuario)";
        $comandoIns = $conexao->prepare($sqlIns);
        $comandoIns->bindParam("comment", $comment, PDO::PARAM_INT);
        $comandoIns->bindParam("usuario", $userAtual, PDO::PARAM_INT);
        $comandoIns->execute();

        if($comandoIns->rowCount() != 0){
            $newLikes = $resultCom['likesAvaliacao'] + 1;
            $sqlATL = "UPDATE `avaliacao`
                            SET likesAvaliacao=:novaQuantiaLikes WHERE idAvaliacao=:comment";
            $comandoATL = $conexao->prepare($sqlATL);
            $comandoATL->execute(array(
                ':novaQuantiaLikes'     =>$newLikes,
                ':comment'             => $comment
            ));
            
            if($comandoATL->rowCount() != 0){
                // echo "<script>alert(\"Sucesso!!\")</script>";
                echo "<script>window.location.href = \"./anipage.php?anime=$anime\"</script>";
            }else{
                echo "<script>alert(\"Erro atualizando quantia de likes!! - erro insert\")</script>";
            }
        }else{
            echo "<script>alert(\"Erro, por favor recarregue a página e tente novamente! - erro insert\")</script>";
        }
    }else{
        $sqlDel = "DELETE FROM `likes1`
                    WHERE id_Comentario_FK=:comment AND id_User_FK=:usuario";
        $comandoDel = $conexao->prepare($sqlDel);
        $comandoDel->execute(array(
            ':comment'     =>$comment,
            ':usuario'      =>$userAtual
        ));

        if($comandoDel->rowCount() != 0){
            $newLikes2 = $resultCom['likesAvaliacao'] - 1;
            $sqlATL2 = "UPDATE `avaliacao`
                        SET likesAvaliacao=:novaQuantiaLikes WHERE idAvaliacao=:comment";
            $comandoATL2 = $conexao->prepare($sqlATL2);
            $comandoATL2->execute(array(
                ':novaQuantiaLikes'     =>$newLikes2,
                ':comment'             => $comment
            ));
            
            if($comandoATL2->rowCount() != 0){
                // echo "<script>alert(\"Sucesso!!\")</script>";
                echo "<script>window.location.href = \"./anipage.php?anime=$anime\"</script>";
            }else{
                echo "<script>alert(\"Erro atualizando quantia de likes!!\")</script>";
            }
        }else{
            echo "<script>alert(\"Erro, por favor recarregue a página e tente novamente!\")</script>";
        }
    }
}