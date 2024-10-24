<?php
require_once("./conexao.php");
require_once("./protect-user.php");

if($_SERVER['REQUEST_METHOD']=="POST"){
    if(!empty($_FILES['banner']['name'])){
        if($_FILES["banner"]["size"] > 4000000){
            echo "Arquivo muito grande, tamanho máximo 2MB!";
        }else{
        $dir_imagens = "./img/bd img/user/banner/";
        $bannerOld = $_SESSION['banner'];
        
        $nome_original = str_replace(" ", "_", basename($_FILES["banner"]["name"]));

        $nome_final = $dir_imagens.$_SESSION['nome']."_".$nome_original;
        
        $SQL = $conexao->prepare("UPDATE `usuario`
                SET `bannerUser`=:newBanner
                WHERE idUser=:atualUser");
        $SQL->execute(array(
            'atualUser' => $_SESSION['id'],
            'newBanner'   => $nome_final
        ));
        if($SQL->rowCount() != 0){
            $deu_certo = move_uploaded_file($_FILES["banner"]["tmp_name"],$nome_final);
            if($deu_certo){
                if($bannerOld != "./img/bd img/user/banner/_semfoto.jpg"){
                unlink($bannerOld);
                }
                echo '<center style="color:#00B74F; font-size:20px;">Banner Alterado com Sucesso!!</center>';
                // header("Refresh: 1; url=./myprofile.php");
                echo "<script>window.location.href = \"./myprofile.php\"</script>";

                $_SESSION['banner'] = $nome_final;
            }else{
                echo "erro imagem";
            }
        }
    }
    }else{
        echo "Erro, nenhuma imagem selecionada";
    }
}
