<?php
if(!isset($_SESSION)){
    session_start();
}
if(isset($_SESSION['id'])){
    require_once("./conexao.php");
    if($_SERVER['REQUEST_METHOD']=="POST"){
    $comentario = filter_input(INPUT_POST, "comentResp", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $texto = filter_input(INPUT_POST, "txt-resp", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    
    //REMOVER ESPAÇOS
    $comentario = trim(strip_tags($comentario));
    $texto = trim(strip_tags($texto));
    
    if(empty($comentario)){
        $erros[] = "<center style=\" color: #ff0000;\">Nenhum comentário selecionado!</center>";
    }
    if(empty($texto)){
        $erros[] = "<center style=\" color: #ff0000;\">Escreva um comentário válido!</center>";
    }
    if(strlen($texto) < 3){
        $erros[] = "<center style=\" color: #ff0000;\">Comentário muito curto!</center>";
    }
    if(!empty($erros)){
        foreach($erros as $erro){
            echo $erro;
        }
    }else{
        $sqlCom = "INSERT INTO `resposta`   
                                (`idResp`, `id_Comentario_FK`, `id_User_FK`, `likesResp`, `textoResp`) 
                            VALUES 
                                (NULL,:comentario,:usuario, :likes, :texto)"
                    ;
        $comandoSql = $conexao->prepare($sqlCom);
        $comandoSql->execute(array(
            ':usuario'      => $_SESSION['id'],
            ':likes'        => 0,
            ':comentario'    => $comentario,
            ':texto'        => $texto
        ));
        if($comandoSql->rowCount() != 0){
            echo "<center style=\" color: #229A00;\">Sucesso!</center>";
            echo "<script>window.location.href = \"./anipage.php?anime=$anime\"</script>";

        }else{
            echo "<center style=\" color: #ff0000;\">Erro!</center>";
        }
    }
    }else{
        echo "O envio não foi feito pelo método post";
    }
}else{
    die("<center style=\"color: #fff; \">Você não pode acessar esta página pq não está logado!<p><a href=\"login.php\">Faça Login</a></p><center>");
}
?>