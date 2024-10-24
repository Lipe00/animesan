<?php
if(!isset($_SESSION)){
    session_start();
}
if(isset($_SESSION['id'])){
    require_once("./conexao.php");
    if($_SERVER['REQUEST_METHOD']=="POST"){
    $anime = filter_input(INPUT_POST, "animeINP", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $notaAva = filter_input(INPUT_POST, "rate", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $textoAva = filter_input(INPUT_POST, "textcom", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    
    //REMOVER ESPAÇOS
    $anime = trim(strip_tags($anime));
    $notaAva = trim(strip_tags($notaAva));
    $textoAva = trim(strip_tags($textoAva));
    
    if(empty($anime)){
        $erros[] = "<center style=\" color: #ff0000;\">Nenhum anime selecionado!</center>";
    }
    if(empty($notaAva)){
        $erros[] = "<center style=\" color: #ff0000;\">Nenhum valor em estrelas selecionado</center>";
    }
    if($notaAva != 1 and $notaAva != 2 and $notaAva != 3 and $notaAva !=4 and $notaAva != 5){
        $erros[] = "<center style=\" color: #ff0000;\">Selecione um valor válido em estrela</center>";
    }
    if(!empty($erros)){
        foreach($erros as $erro){
            echo $erro;
        }
    }else{
        $sqlCom = "INSERT INTO `avaliacao`
                        (`idAvaliacao`, `id_Anime_FK`, `id_User_FK`, `likesAvaliacao`, `notaAvaliacao`, `textoComentario`)
                    VALUES
                        (NULL, :anime, :usuario, :likes, :avaliacao, :texto)
                    ";
        $comandoSql = $conexao->prepare($sqlCom);
        $comandoSql->execute(array(
            ':anime'        => $anime,
            ':usuario'      => $_SESSION['id'],
            ':likes'        => 0,
            ':avaliacao'    => $notaAva,
            ':texto'        => $textoAva
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