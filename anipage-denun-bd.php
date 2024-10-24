<?php
include_once("./conexao.php");
if(!isset($_SESSION)){
    session_start();
}
$anime = filter_input(INPUT_GET, "anime", FILTER_SANITIZE_NUMBER_INT);
if(!isset($_SESSION['id'])){
    echo "Para realizar esta ação você precisa estar logado";
    echo "<script>window.location.href = \"./anipage.php?anime=$anime\"</script>";
}else{
    $userDenunciado = filter_input(INPUT_POST, "idDenun", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $typeDenun = filter_input(INPUT_POST, "cselect", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $descDenun = filter_input(INPUT_POST, "textDenun", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

    $userDenunciado = trim(strip_tags($userDenunciado));
    $typeDenun = trim(strip_tags($typeDenun));
    $descDenun = trim(strip_tags($descDenun));
    if(empty($userDenunciado) or empty($typeDenun)){
        echo "<center style=\"color: #ff0000;\">Campos em branco</center>";
        var_dump($_POST);
    }else{
        $sqlDenun = "INSERT INTO `denuncias`
                                (`idDenuncia`, `categoriaDenuncia`, `textoDenuncia`, `id_denunciante_FK`, `id_denunciado_FK`) 
                            VALUES 
                                (NULL,:tipoDenun,:textDenun,:usuarioAtual,:usuarioDenun)";
        $comandoDenun = $conexao->prepare($sqlDenun);
        $comandoDenun->execute(array(
            ':tipoDenun'        => $typeDenun,
            ':textDenun'        => $descDenun,
            ':usuarioAtual'     => $_SESSION['id'],
            ':usuarioDenun'     =>$userDenunciado,
        ));
        if($comandoDenun->rowCount() != 0){
            echo'<center style="color:#00B74F; font-size:20px;">Denunciado com Sucesso!!</center>';
            echo "<script>window.location.href = \"./anipage.php?anime=$anime\"</script>";
        }else{
            echo'<center style="color:#ff0000; font-size:20px;">Houve um erro ao denunciá-lo!!</center>';
            echo $userDenunciado;
            echo    "<br>";
            echo $typeDenun;
            echo    "<br>";
            echo $descDenun;
        }
    }
    

}