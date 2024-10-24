<?php
if($_SERVER['REQUEST_METHOD']=="POST"){
    //foto que está no cadastro atual do usuário
    $foto = filter_input(INPUT_POST, "fotoAnterior", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

    //diretório que será armazenado todas as imagens enviadas pelos usuários
    $dir_imagens = "../imagens/";

    //pegando o nome do arquivo e se houver espaço em branco substituir por underline
    $nome_original = str_replace(" ", "_", basename($_FILES["foto"]["name"]));
        if($nome_original != "_semfoto.jpg"){

            //criar eum token/chave exclusivo e para fnalizar faz criptografia usando o MD% que gera uma sequência de 32 caracteres.
            $token = md5(uniqid(rand(), true));

            //nome_final é a junção das variáveis de diretório+token+nome_original
            $nome_final = $dir_imagens.$token.$nome_original;

            //A variável Flag é usada para sinalizar que está tudo ok quando valer 1
            $flag = 1;
            
            //verifica se o arquivo foi enviado pelo submit
            if(isset($_POST["submit"])){
                //verifica o tamanho do arquivo temporário e se for maior que 0 está ok
                $flag = 1;
            }else{
                $flag = 0;
            }
        
        if($_FILES["foto"]["size"] > 2000000){
            $flag = 0;
        }

        //strtolower converte todos os caracteres de um texto/variável minúsculo pathinfo retorna a extensão do arquivo
        $extensao = strtolower(pathinfo($nome_final, PATHINFO_EXTENSION));

        //teste para validar a extensão do arquivo.
        if(($extensao != "jpg") && ($extensao != "png") && ($extensao != "jpeg") && ($extensao != "gif") && ($extensao != "webp")){
            $flag = 0;
        }
        if ($flag == 1){
            //apaga a foto antiga

            if($foto != "_semfoto.gif"){
                $arq = "$dir_imagens"."$foto";
                //exclui o arquivo do diretório padrão (imagens)
                unlink($arq);
            }
        }
            //a variável foto terpa seu conteúdo gravado no BD com o token+nome_original
            $foto = $token.$nome_original;
        }

//após processar o dado da foto agora será processado os dados do formulário
            $idPhp = filter_input(INPUT_POST, "idAni", FILTER_SANITIZE_NUMBER_INT);
            $nomePhp    = filter_input(INPUT_POST, "nomeAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $sinopPhp    = filter_input(INPUT_POST, "sinopAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $genPhp    = filter_input(INPUT_POST, "genAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $avaPhp    = filter_input(INPUT_POST, "avaAni", FILTER_SANITIZE_NUMBER_INT);
            $favPhp    = filter_input(INPUT_POST, "favAni", FILTER_SANITIZE_NUMBER_INT);
            $estuPhp    = filter_input(INPUT_POST, "estuAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $prodPhp    = filter_input(INPUT_POST, "prodAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);


require_once("../_conexao/conexao.php");

try{
    $comandoSQL = $conexao->prepare("
        UPDATE
            `animes`

        SET
            `nomeAnime`=:nomeAni, `sinopseAnime`=:sinopAni, `generoAnime`=:genAni, `avaliacaoAnime`=:avaAni, `favoritosAnime`=:favAni, `estudioAnime`=:estuAni, `produtorAnime`=:prodAni, `imagemAnime`=:foto

        WHERE `idAnime`=:idAni"
    );
    $comandoSQL->execute(array(

                    ':idAni'  => $idPhp,
                    ':nomeAni'  => $nomePhp,
                    ':sinopAni'   => $sinopPhp,
                    ':genAni'  => $genPhp,
                    ':avaAni'  => $avaPhp,
                    ':favAni'  => $favPhp,
                    ':estuAni'  => $estuPhp,
                    ':prodAni'  => $prodPhp,                   
                    ':foto'      => $foto
    ));

    if($comandoSQL-> rowCount() > 0){
        //o move_uploaded_file pega o nome do arquivo temporário e grava na pasta do servidor com o nome_final
        move_uploaded_file($_FILES["foto"]["tmp_name"], $nome_final);

        header("location: ./ani-view.php");
    }else{
        echo "Erro na atualização";
    }

}catch(PDOException $e){
    echo $e->getMessage();
}
}

else{
    echo("O envio não foi pelo método POST!");

}