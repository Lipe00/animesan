<?php
    require_once("./_conexao/conexao.php");
    $flag = 1;

    //echo("<pre>");
    //print_r($_POST);
    //echo("</pre>");
    if($_SERVER['REQUEST_METHOD']=="POST"){
        if (!empty($_FILES['foto']['name'])) {
            // UPLOAD ************************************************************
            // diretório que será armazenado todas as imagens enviadas pelos usuários
            $dir_imagens = "../img/bd img/anime/"; 
            
            // pegando o nome do arquivo e se houver espaço em branco substituir por underline
            $nome_original = str_replace(" ", "_", basename($_FILES["foto"]["name"]));
            
            // criar um token/chave exclusivo e para finalizar faz a criptografia usando o MD5
            // que gera uma sequência de 32 caracteres.
            $token = md5(uniqid(rand(), true));
            // nome_final é a junção das váriáveis de diretório+token+nome_original
            $nome_final = $dir_imagens.$nome_original;                    

            // nome final para puxar no php
            $dir2 = "./img/bd img/anime/";
            $nomefinal2 = $dir2.$nome_original; 
            // $nome_final =$token.$nome_original;                    
            //verifica o tamanho do arquivo temporário e se for maior que 0 está ok
            if(!getimagesize($_FILES["foto"]["tmp_name"])){
                $flag = 0;
            }
            if($_FILES["foto"]["size"] > 2000000){
                // $flag = 0;
                echo "<center style='color:#ff0000; font-size:20px;' >Arquivo Muito Grande, máximo 2MB</center>";

            }
            // strtolower converte todos os caracteres de um texto/variável para minúsculo
            // pathinfo retorna a extensão do arquivo
            $extensao = strtolower(pathinfo($nome_final, PATHINFO_EXTENSION)); 
            // teste para validar a extensão do arquivo.
            if(($extensao != "jpg") && ($extensao != "png") && 
            ($extensao != "jpeg") && ($extensao != "gif")){
                $flag = 0;
            }
            if($flag == 1){            
                // a variável foto terá seu conteúdo gravado no BD com o token+nome_original
                $foto = $nome_original;        
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
            $anoPhp    = filter_input(INPUT_POST, "anoAni", FILTER_SANITIZE_NUMBER_INT);
            $gen1Php    = filter_input(INPUT_POST, "gen1Ani", FILTER_SANITIZE_NUMBER_INT);
            $gen2Php    = filter_input(INPUT_POST, "gen2Ani", FILTER_SANITIZE_NUMBER_INT);
            $gen3Php    = filter_input(INPUT_POST, "gen3Ani", FILTER_SANITIZE_NUMBER_INT);
            $gen4Php    = filter_input(INPUT_POST, "gen4Ani", FILTER_SANITIZE_NUMBER_INT);
            $gen5Php    = filter_input(INPUT_POST, "gen5Ani", FILTER_SANITIZE_NUMBER_INT);
            $estuPhp    = filter_input(INPUT_POST, "estuAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $prodPhp    = filter_input(INPUT_POST, "prodAni", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            $nomePhp = trim(strip_tags($nomePhp));
            $sinopPhp = trim(strip_tags($sinopPhp));
            $anoPhp = trim(strip_tags($anoPhp));
            $gen1Php = trim(strip_tags($gen1Php));
            $gen2Php = trim(strip_tags($gen2Php));
            $gen3Php = trim(strip_tags($gen3Php));
            $gen4Php = trim(strip_tags($gen4Php));
            $gen5Php = trim(strip_tags($gen5Php));
            $estuPhp = trim(strip_tags($estuPhp));
            $prodPhp = trim(strip_tags($prodPhp));
            // $path = $dir_imagens.$nome_original;
            //crime - inicio
            $dir_banner = "../img/bd img/anime/banner/";
            $nome_banner = $nomePhp;
            $nome_banner = str_replace(" ", "_", basename($nome_banner));
            $nome_banner = strtolower($nome_banner);
            $banner_final = $dir_banner.$nome_banner.".png";
            //crime - final



            if (empty($nomePhp) or empty($sinopPhp) or empty($anoPhp) or empty($gen1Php) or empty($estuPhp) or empty($prodPhp)) {
                $erros[] = "Campo em Branco";
            } else {
                if($gen1Php == "1"){
                    $erros[] = "Nenhum Gênero Selecionado";
                }
                if (strlen($sinopPhp) < 60) {
                    $erros[] = "Sinopse muito curta";
                }
                /* Verificando se já existe do Banco de dados */
                $con = mysqli_connect('localhost', 'root', '', 'animesan_beta');
                $sql = mysqli_query($con, "SELECT * FROM `animes` WHERE nomeAnime	 = '{$nomePhp}'") or print mysqli_error($e);
                if (mysqli_num_rows($sql) > 0) {
                $erros[] = "Anime já cadastrado!!";
                }
            }if (!empty($erros)) {
                foreach ($erros as $erro) {
                    echo "<center style='color:#ff0000; font-size:20px;' >$erro</center>";
                }
            } else {

                echo("<pre>");
                print_r($_POST);
                print_r($foto);
                echo("</pre>");
            try{
                $sql = "INSERT INTO `animes` 
                                    (`idAnime`, `nomeAnime`, `sinopseAnime`, `anoAnime`, `gen1_FK`, `gen2_FK`, `gen3_FK`, `gen4_FK`, `gen5_FK`, `avaliacaoAnime`, `favoritosAnime`, `estudioAnime`, `produtorAnime`, `imagemAnime`, `pathImgAnime`, bannerAnime) 
                                    VALUES 
                                    (NULL, :nomeAni, :sinopAni, :anoAni, :gen1Ani, :gen2Ani, :gen3Ani, :gen4Ani, :gen5Ani, 0, 0, :estuAni, :prodAni, :foto, :path2Img, :banner)";


                $comandoSQL = $conexao->prepare($sql); 
                
                $comandoSQL->execute(array(
                    ':nomeAni'  => $nomePhp,
                    ':sinopAni'   => $sinopPhp,
                    ':anoAni'   => $anoPhp,
                    ':gen1Ani'  => $gen1Php,
                    ':gen2Ani'  => $gen2Php,
                    ':gen3Ani'  => $gen3Php,
                    ':gen4Ani'  => $gen4Php,
                    ':gen5Ani'  => $gen5Php,
                    ':estuAni'  => $estuPhp,
                    ':prodAni'  => $prodPhp,                   
                    ':foto'      => $foto,
                    ':path2Img'     =>$nomefinal2,
                    ':banner'       =>$banner_final
                ));


                if($comandoSQL->rowCount() > 0)
                {
                    if($flag == 1){                 
                        //o move_uploaded_file pega o nome do arquivo temporário e grava na pasta do servidor
                        $deu_certo = move_uploaded_file($_FILES["foto"]["tmp_name"],$nome_final);
                        if($deu_certo){
                            echo "<p>Arquivo enviado com sucesso, <a href='./teste-imagem.php'>Clique Aqui para ir para a página de teste</a></p>";
                            header("Refresh: 1; url=./ani-cad.php");
                        }else{
                            echo "erro imagem";
                        }
                        
                    }                    
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
        }     
    else {
        echo "NO POST";
    }
?>
