<?php
include_once("./conexao.php");
if(!isset($_SESSION)){
    session_start();
}
if(!isset($_SESSION['id'])){
    die("<center style=\"color: #fff; \">Você não pode acessar esta página pq não está logado!<p><a href=\"login.php\">Faça Login</a></p><center>");
}else{
    $resp = filter_input(INPUT_GET, "resposta", FILTER_SANITIZE_NUMBER_INT);
    $anime = filter_input(INPUT_POST, "animeAtual", FILTER_SANITIZE_NUMBER_INT);
    $userAtual = $_SESSION['id'];
    
    $sqlVerify = "SELECT * FROM `likes2` WHERE id_User_FK=:usuario AND id_Resposta_FK=:resp";
    $selectVerify = $conexao->prepare($sqlVerify);
    $selectVerify->execute(array(
        ':usuario'      => $userAtual,
        ':resp'         => $resp
    ));
    $totalVerify = $selectVerify->rowCount();
    //CHAMANDO ROW DO COMENTARIO
    $sqlResp = "SELECT * FROM `resposta` WHERE idResp=:resposta LIMIT 1";
    $comandoResp = $conexao->prepare($sqlResp);
    $comandoResp->bindParam("resposta", $resp, PDO::PARAM_INT);
    $comandoResp->execute();
    $resultResp = $comandoResp->fetch(PDO::FETCH_ASSOC);

    if($totalVerify == 0){
        $sqlIns = "INSERT INTO `likes2`(`idLikes2`, `id_Resposta_FK`, `id_User_FK`) 
                    VALUES (NULL,:resposta, :usuario)";
        $comandoIns = $conexao->prepare($sqlIns);
        $comandoIns->execute(array(
            ':resposta'     =>$resp,
            ':usuario'      =>$userAtual
        ));

        if($comandoIns->rowCount() != 0){
            $newLikes = $resultResp['likesResp'] + 1;
            $sqlATL = "UPDATE `resposta`
                        SET likesResp=:novaQuantiaLikes WHERE idResp=:resp";
            $comandoATL = $conexao->prepare($sqlATL);
            $comandoATL->bindParam("novaQuantiaLikes", $newLikes, PDO::PARAM_INT);
            $comandoATL->bindParam("resp", $resp, PDO::PARAM_INT);
            $comandoATL->execute();
            
            if($comandoATL->rowCount() != 0){
                // echo "<script>alert(\"Sucesso!!\")</script>";
                echo "<script>window.location.href = \"./anipage.php?anime=$anime\"</script>";
            }else{
                echo "<script>alert(\"Erro atualizando quantia de likes!!\")</script>";
            }
        }else{
            echo "<script>alert(\"Erro, por favor recarregue a página e tente novamente!\")</script>";
        }
    }else{
        $sqlDel = "DELETE FROM `likes2`
                    WHERE id_Resposta_FK=:resposta AND id_User_FK=:usuario";
        $comandoDel = $conexao->prepare($sqlDel);
        $comandoDel->execute(array(
            ':resposta'     =>$resp,
            ':usuario'      =>$userAtual
        ));

        if($comandoDel->rowCount() != 0){
            $newLikes2 = $resultResp['likesResp'] - 1;
            $sqlATL2 = "UPDATE `resposta`
                        SET likesResp=:novaQuantiaLikes WHERE idResp=:resposta";
            $comandoATL2 = $conexao->prepare($sqlATL2);
            $comandoATL2->execute(array(
                ':novaQuantiaLikes'     =>$newLikes2,
                ':resposta'             => $resp
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