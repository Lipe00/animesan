<?php

if(!isset($_SESSION)){
    session_start();
}
if(!isset($_SESSION['id'])){
    die("Você não pode acessar esta página pq não está logado!<p><a href=\"login.php\">Faça Login</a></p>");
}else{

    if($_SERVER['REQUEST_METHOD']=="POST"){
        
            
        // FIM UPLOAD ************************************************************
        $id = $_SESSION['id'];
        $senha = $_SESSION['senha'];
        $foto = $_SESSION['foto'];
        $banner = $_SESSION['banner'];
        $sobreIsso = filter_input(INPUT_POST, "sobreMim", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $nome       = filter_input(INPUT_POST, "nomeInp", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $email      = filter_input(INPUT_POST, "emailInp", FILTER_SANITIZE_EMAIL);

        
        // Remover Espaços
        $nome = trim(strip_tags($nome));
        $email = trim(strip_tags($email));
        $sobreIsso = trim(strip_tags($sobreIsso));



        //validação php
        if (empty($nome) or empty($email)){
            $erros[] = "Campo em Branco";

        }else{
            if(strlen($nome) < 3){
                $erros[] = "Nome menor do que 3 caracteres";
            }
            if(!$email = filter_input(INPUT_POST, 'emailInp', FILTER_VALIDATE_EMAIL)){
                $erros[] = "Email inválido";
            };

        }
        
        if(!empty($erros)){
            foreach($erros as $erro){
                echo"<center style='color:#ff0000; font-size:20px;'>$erro</center>";
            }
        }else{
            if($nome == $_SESSION['nome'] and $email == $_SESSION['email'] and $sobreIsso == $_SESSION['sobre']){
                echo"<center style='color:#ff0000; font-size:20px;'>Dados Iguais</center>";
                echo "<script>window.location.href = \"./myprofile.php\"</script>";
                
            }else{
            // ---Enviando para o Banco de Dados---
            require_once("./conexao.php");
            try{
                // Comando SQL
                $comandoSQL = $conexao->prepare("
                                                UPDATE
                                                    `usuario`
                                                SET
                                                    `nomeUser`=:nome, `emailUser`=:email, `sobreUser`=:sobre

                                                WHERE
                                                    `idUser`=:id
                ");


                $comandoSQL->execute(array(
                    ':id'        => $id,
                    ':nome'         => $nome,
                    ':email'        => $email,
                    ':sobre'        => $sobreIsso 
                ));

                $total = $comandoSQL->rowCount();
                if($total > 0)
                {          
                    echo'<center style="color:#00B74F; font-size:20px;">Alterado com Sucesso!!</center>';
                    
                    $_SESSION['id'] = $id;
                    $_SESSION['nome'] = $nome;
                    $_SESSION['email'] = $email;
                    $_SESSION['sobre'] = $sobreIsso;

                    // header("Refresh: 1; url=./myprofile.php");
                    echo "<script>window.location.href = \"./myprofile.php\"</script>";
                }
                else
                {
                    echo "Erro ao inserir dados no banco";
                }
        }
        catch(PDOException $erro)
        {
            echo "ERRO: ".$erro->getCode()."<br>";
            echo "Mensagem: <br>".$erro->getMessage();
        }
        
        //fechar a conexão com o banco
        $conexao = null;  
        }  
    }
}     
else {
    echo "NO POST";
}
}

