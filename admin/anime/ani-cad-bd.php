<?php

    $flag = 1;

    echo("<pre>");
    print_r($_POST);
    echo("</pre>");

    if($_SERVER['REQUEST_METHOD']=="POST"){
        if (!empty($_FILES['foto']['name'])) {
            // UPLOAD ************************************************************
            // diretório que será armazenado todas as imagens enviadas pelos usuários
            $dir_imagens = "../imagens/"; 
            
            // pegando o nome do arquivo e se houver espaço em branco substituir por underline
            $nome_original = str_replace(" ", "_", basename($_FILES["foto"]["name"]));
            
            // criar um token/chave exclusivo e para finalizar faz a criptografia usando o MD5
            // que gera uma sequência de 32 caracteres.
            $token = md5(uniqid(rand(), true));
            
            // nome_final é a junção das váriáveis de diretório+token+nome_original
            $nome_final = $dir_imagens.$token.$nome_original;                    
            
            //verifica o tamanho do arquivo temporário e se for maior que 0 está ok
            if(!getimagesize($_FILES["foto"]["tmp_name"])){
                $flag = 0;
            }

            if($_FILES["foto"]["size"] > 2000000){
                $flag = 0;
            }

            // strtolower converte todos os caracteres de um texto/variável para minúsculo
            // pathinfo retorna a extensão do arquivo
            $extensao = strtolower(pathinfo($nome_final, PATHINFO_EXTENSION)); 
        
            // teste para validar a extensão do arquivo.
            if(($extensao != "jpg") && ($extensao != "png") && 
            ($extensao != "jpeg") && ($extensao != "gif")){
                $flag = 0;
            }

            if($flag == 0){            
                // a variável foto terá seu conteúdo gravado no BD com o token+nome_original
                $foto = $token.$nome_original;        
            } 

        }
        else{
                $flag = 0;
                // a variável foto terá o conteúdo com sem-foto.jpg como padrão
                $foto = "_semfoto.jpg";   
        }
            
            // FIM UPLOAD ************************************************************
            $nomePhp    = filter_input(INPUT_POST, "nomeAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $sinopPhp    = filter_input(INPUT_POST, "sinopAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $genPhp    = filter_input(INPUT_POST, "genAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $avaPhp    = filter_input(INPUT_POST, "avaAni", FILTER_SANITIZE_NUMBER_INT);
            $favPhp    = filter_input(INPUT_POST, "favAni", FILTER_SANITIZE_NUMBER_INT);
            $estuPhp    = filter_input(INPUT_POST, "estuAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $prodPhp    = filter_input(INPUT_POST, "prodAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            
            require_once("../_conexao/conexao.php");


            try{
                $sql = "INSERT INTO `animes` 
                                    (`idAnime`, `nomeAnime`, `sinopseAnime`, `generoAnime`, `avaliacaoAnime`, `favoritosAnime`, `estudioAnime`, `produtorAnime`, `imagemAnime`) 
                                    VALUES 
                                    (NULL, :nomeAni, :sinopAni, :genAni, :avaAni, :favAni, :estuAni, :prodAni, :foto)";


                $comandoSQL = $conexao->prepare($sql); 
                
                $comandoSQL->execute(array(
                    ':nomeAni'  => $nomePhp,
                    ':sinopAni'   => $sinopPhp,
                    ':genAni'  => $genPhp,
                    ':avaAni'  => $avaPhp,
                    ':favAni'  => $favPhp,
                    ':estuAni'  => $estuPhp,
                    ':prodAni'  => $prodPhp,                   
                    ':foto'      => $foto
                ));


                if($comandoSQL->rowCount() > 0)
                {
                    //if($flag == 1){                 
                        //o move_uploaded_file pega o nome do arquivo temporário e grava na pasta do servidor
                        //move_uploaded_file($_FILES["foto"]["tmp_name"], $nome_final);
                    //}                    
                    echo "<br><br>Sucesso!";
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
    else {
        echo "NO POST";
    }
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciador de Animes</title>
    <link rel="stylesheet" href="css/style.css">

    <meta http-equiv="refresh" content="1; URL='./ani-view.php'"/>
</head>
<body>
<div class="space"> 
        <!-- NAVBAR -->
        <div class="navbar">
        <a href="index.php">
            <button>Home</button>
        </a>
        <a href="cad.php">
            <button >Cadastrar</button>
        </a>
        <a href="view.php">
            <button>Visualizar</button>
        </a>
    </div> 
    <!-- BD -->
    <div class="bd">
        <h1>Sucesso</h1>
        <p>Redirecionando página</p>
    </div>
</div>
</body>
</html> 