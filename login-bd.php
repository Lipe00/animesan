<?php


    // verificando se o envio foi pelo método POST
    
    // A variável Flag é usada para sinalizar que está tudo ok quando valer 1
    $flag = 1;

    if($_SERVER['REQUEST_METHOD']=="POST"){
            
            // FIM UPLOAD ************************************************************
            $emailPhp    = filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL);
            $senhaPhp     = filter_input(INPUT_POST, "password", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            // Remover Espaços 
            $emailPhp = trim(strip_tags($emailPhp));
            $senhaPhp = trim(strip_tags($senhaPhp));
            //Validação PHP
            if (empty($emailPhp) or empty($senhaPhp)){
                $erros[] = "Campo em Branco";
            }else{
                if(!$emailPhp = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL)){
                    $erros[] = "E-mail inválido";
                };
                if (strlen($senhaPhp) <= 7){
                    $erros[] = "Senha menor de 8 dígitos";
                }
            }
            if(!empty($erros)){
                foreach($erros as $erro){
                    echo"<center style='color:#ff0000; font-size:20px;'>$erro</center>";
                }
            }else{

            
            
            
            require_once("./conexao.php");

            // Variável para descriptografar senha 
            $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
            //require faz o select no banco
            $sql = "SELECT *
                    FROM `usuario`
                    WHERE `emailUser`=:email
                    LIMIT 1";

            $result_usuario = $conexao->prepare($sql);
            $result_usuario-> bindParam(':email', $emailPhp, PDO::PARAM_STR);
            $result_usuario->execute();

            
            if(($result_usuario) and ($result_usuario->rowCount() != 0)) {
                $row_usuario = $result_usuario->fetch(PDO::FETCH_ASSOC);


                if(password_verify($dados['password'], $row_usuario['senhaUser'])){

                    require_once("./conexao.php");
                    $sql = "SELECT *
                            FROM `denuncias`
                            WHERE `id_denunciado_FK`=:idUser";

                    $select = $conexao->prepare($sql);
                    $select-> bindParam(':idUser', $row_usuario['idUser'], PDO::PARAM_INT);
                    $select->execute();
                    $result = $select->fetchAll();
                    $total = $select->rowCount();

                    if($total >= 1){
                        echo'<center style="color:#ffa500; font-size:20px;">Conta Suspensa!!</center>';
                    }else{
                        echo'<center style="color:#00B74F; font-size:20px;">Logado com Sucesso!!</center>';

                        if(!isset($_SESSION)){
                            session_start();
                        }
                        $_SESSION['id'] = $row_usuario['idUser'];
                        $_SESSION['nome'] = $row_usuario['nomeUser'];
                        $_SESSION['email'] = $row_usuario['emailUser'];
                        $_SESSION['senha'] = $row_usuario['senhaUser'];
                        $_SESSION['foto'] = $row_usuario['fotoUser'];
                        $_SESSION['banner'] = $row_usuario['bannerUser'];
                        $_SESSION['sobre'] = $row_usuario['sobreUser'];

                        require_once("./conexao.php");
                        $sqlAdm = $conexao->prepare("SELECT * FROM `admin` WHERE id_user_FK = :idUser LIMIT 1 ");
                        $sqlAdm-> bindValue("idUser", $row_usuario['idUser'], PDO::PARAM_INT);
                        $sqlAdm->execute();
                        // $select = $conexao->query($sql);
                        // $resultAdm = $sqlAdm->fetchAll();
                        $totalAdm = $sqlAdm->rowCount();
                        $row_adm = $sqlAdm->fetch(PDO::FETCH_ASSOC);

                        // $teste = $row_adm['idAdmin'];
                        // echo $teste;
                        if($totalAdm != 0){
                            $_SESSION['admin'] = $row_adm['idAdmin'];
                        }
                        // header("Refresh: 1; url=./myprofile.php");
                        echo "<script>window.location.href = \"./myprofile.php\"</script>";

                    }
                }else{
                    echo'<center style="color:#ff0000; font-size:20px;">Senha inválida!!</center>';
                }
            } else{
                echo'<center style="color:#ff0000; font-size:20px;">Email inválido!!</center>';
            }
        }
        }
            else{
                echo("O envio não foi pelo método POST!");
            
            }
?>