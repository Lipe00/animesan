<?php
    $_dns = "mysql:host=localhost;dbname=animesan_beta";
    $_user= "root";
    $_pass= "";

    try{
        //Criar uma conexão com o mysql
        $conexao = new PDO($_dns, $_user, $_pass);
        
    }catch(PDOException $erro){
        //mostra uma mensagem na tela do usuário
        echo $erro->getMessage();
        //echo "Entre em contado com o Administrador do banco";

    }
?>