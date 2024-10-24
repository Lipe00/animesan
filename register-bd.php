<?php
require_once("./conexao.php");
    /*

    echo "<pre>";
    // Imprime todos os dados que vieram do formulário
    print_r($_POST);
    // mostra qual foi o método usado para enviar os dados
    print_r($_SERVER['REQUEST_METHOD']);
    echo "</pre>";
    // força uma saída do código
    exit();
    */


    // verificando se o envio foi pelo método POST
    
    // A variável Flag é usada para sinalizar que está tudo ok quando valer 1
    $flag = 1;

    // echo("<pre>");
    // print_r($_POST);
    // echo("</pre>");

    //Foto padrão
    $dir = "./img/bd img/user/foto/";
    $foto = "_semfoto.jpg"; 
    $nome_final = $dir.$foto;

    // Banner Padrão
    $dir = "./img/bd img/user/banner/";
    $foto = "_semfoto.jpg"; 
    $banner_final = $dir.$foto;

    if($_SERVER['REQUEST_METHOD']=="POST"){
        
            
            // FIM UPLOAD ************************************************************
            $nome       = filter_input(INPUT_POST, "username", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $email      = filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL);
            $senha      = filter_input(INPUT_POST, "password", FILTER_SANITIZE_FULL_SPECIAL_CHARS);           
            $csenha     = filter_input(INPUT_POST, "confirmpassword", FILTER_SANITIZE_FULL_SPECIAL_CHARS);  
            
            // Remover Espaços
            $nome = trim(strip_tags($nome));
            $email = trim(strip_tags($email));
            $senha = trim(strip_tags($senha));
            $csenha = trim(strip_tags($csenha));


            //validação php
            if (empty($nome) or empty($email) or empty($senha) or empty($csenha)){
                $erros[] = "Campo em Branco";

            }else{
                if(strlen($nome) < 3){
                    $erros[] = "Nome menor do que 3 caracteres";
                }
                if(!$email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL)){
                    $erros[] = "Email inválido";
                };

                // Receber email do Banco de dados
                $con = mysqli_connect('localhost', 'root', '', 'animesan_beta');
                $sql = mysqli_query($con, "SELECT * FROM `usuario` WHERE emailUser	 = '{$email}'") or print mysqli_error($e);
                if (mysqli_num_rows($sql) > 0) {
                $erros[] = "Email já cadastrado!!";
        }
                // -------------------------------------------------------------

                if(strlen($senha) <= 7){
                    $erros[] = "Senha menor que 8 dígitos";
                }
                if(strlen($csenha) <= 7){
                    $erros[] = "Senha menor que 8 dígitos";
                }

                if($senha != $csenha){
                    $erros[] = "Senhas diferentes";
                }
            }
            if(!empty($erros)){
                foreach($erros as $erro){
                    echo"<center style='color:#ff0000; font-size:20px;'>$erro</center>";
                }
            }else{
                //criptografar a senha
                $senha = password_hash($senha, PASSWORD_DEFAULT);

                // ---Enviando para o Banco de Dados---
                try{
                    // Comando SQL
                    $sql = "INSERT INTO `usuario` 
                                        (`idUser`, `nomeUser`, `emailUser`, `senhaUser`, `sobreUser`, `fotoUser`, `bannerUser`) 
                                        VALUES 
                                        (NULL, :nome, :email, :senha, \"\", :foto, :banner)";


                    $comandoSQL = $conexao->prepare($sql); 
                    
                    $comandoSQL->execute(array(
                        ':nome'         => $nome,
                        ':email'        => $email,
                        ':senha'        => $senha,
                        ':foto'         => $nome_final,
                        ':banner'         => $banner_final
                    ));


                    if($comandoSQL->rowCount() > 0)
                    {
                        //if($flag == 1){                 
                            //o move_uploaded_file pega o nome do arquivo temporário e grava na pasta do servidor
                            //move_uploaded_file($_FILES["foto"]["tmp_name"], $nome_final);
                        //}                    
                        echo'<center style="color:#00B74F; font-size:20px;">Cadastrado com Sucesso!!</center>';
                        header("Refresh: 1; url=./login.php");
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
    else {
        echo "NO POST";
    }
?>