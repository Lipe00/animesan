<?php
require_once("./conexao.php");
require_once("./protect-user.php");

if($_SERVER['REQUEST_METHOD']=="POST"){
    if(!empty($_FILES['foto']['name'])){
        if($_FILES["foto"]["size"] > 2000000){
            echo "Arquivo muito grande, tamanho máximo 2MB!";
        }else{
        $dir_imagens = "./img/bd img/user/foto/";
        $fotoOld = $_SESSION['foto'];
        
        $nome_original = str_replace(" ", "_", basename($_FILES["foto"]["name"]));

        $nome_final = $dir_imagens."foto"."_".$_SESSION['id']."_".$_SESSION['nome']."_".$nome_original;
        
        $SQL = $conexao->prepare("UPDATE `usuario`
                SET `fotoUser`=:newFoto
                WHERE idUser=:atualUser");
        $SQL->execute(array(
            'atualUser' => $_SESSION['id'],
            'newFoto'   => $nome_final
        ));
        if($SQL->rowCount() != 0){
            $deu_certo = move_uploaded_file($_FILES["foto"]["tmp_name"],$nome_final);
            if($deu_certo){
                if($fotoOld != "./img/bd img/user/foto/_semfoto.jpg"){
                unlink($fotoOld);
                }
                echo '<center style="color:#00B74F; font-size:20px;">Foto Alterada com Sucesso!!</center>';
                // header("Refresh: 1; url=./myprofile.php");
                echo "<script>window.location.href = \"./myprofile.php\"</script>";

                $_SESSION['foto'] = $nome_final;
            }else{
                echo "erro imagem";
            }
        }
    }
    }else{
        echo "Erro, nenhuma imagem selecionada";
    }
}
