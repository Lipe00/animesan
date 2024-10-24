<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnimeSan</title>
    <!-- CSS FONTES -->

    <!-- font-family: 'Taxicab Bold'; -->
    <link rel="stylesheet" href="./fonts/taxicab-cufonfonts-webfont/style.css">
    <!-- font-family: 'Invisible Extra Bold'; -->
    <link rel="stylesheet" href="./fonts/invisible-2-cufonfonts-webfont/style.css">
    <!-- FIM CSS FONTES -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/register.css">
    <link rel="stylesheet" href="./css/global.css">



    <link rel="shortcut icon" href="./img/favicon/favicon.ico" type="image/x-icon">
</head>
<body>
    <div class="main-space">
    <div class="box">
        <form id="form" method="post" enctype="multipart/form-data" action="">
            <fieldset>
                <legend><b>Fomulário de Registro</b></legend>
                <?php
                if (isset($_POST['btn-cad'])) {

                    include_once('./register-bd.php');
                }
                ?>
                <!-- INICIO CAMPO -->
                <div class="inputBox">
                        <div class="textfield">
                        <input type="text" name="username" id="username" class="inputUser inptxt" autocomplete="off" placeholder=" ">
                        <label id="label-nome" for="username" class="labelInput">Nome de Usuário</label>
                        </div>
                    </div>  
                <!-- FIM CAMPO -->

                <!-- INICIO CAMPO -->
                <div class="inputBox">
                    <div class="textfield">
                        <input type="text" name="email" id="email" class="inputUser inptxt" autocomplete="off" placeholder=" ">
                        <label id="label-email" for="email" class="labelInput">Email</label>
                        </div>
                </div>
                <!-- FIM CAMPO -->              
    
                <!-- INICIO CUSTOM SELECT 2.0 -->
                <!-- <div class="inputBox">
                    <div class="custom-select">
                        <select id="genero">
                            <option selected disabled value="">Selecione o seu gênero</option>
                            <option value="masculino">Masculino</option>
                            <option value="feminino">Feminino</option>
                            <option value="outro">Outro</option>
                            <option value="nao-informado">Prefiro não informar</option>
                        </select>
                    </div>
                </div> -->
                    <!-- FIM CUSTOM SELECT 2.0 -->

                    <!-- INICIO CAMPO -->
                <!-- <div class="inputBox">
                    <div class="textfield">
                        <input type="text" name="data_nasc" id="data_nasc" class="inputUser" maxlength="10" autocomplete="off" placeholder=" ">
                        <label id="label-data" for="data_nasc" class="labelInput">Data de Nascimento</label>
                        </div>
                    
                </div> -->
                <!-- FIM CAMPO -->
                

            <!-- INICIO CAMPO -->
            <div class="inputBox">
                <div class="textfield">
                    
                    <input type="password" name="password" id="password" class="inputUser inputPassword inptxt" autocomplete="off" placeholder=" ">
                        <div class="icon">

                    <i id="icon-eye" for="password" class="fa fa-eye-slash icone-main icone-deactived"></i>

                    </div>
                    <label id="label-senha" for="password" class="labelInput">Senha</label>
                </div>
            </div>
            <!-- FIM CAMPO -->

            <!-- INICIO CAMPO -->
            <div class="inputBox">
                <div class="textfield">
                    
                    <input type="password" name="confirmpassword" id="confirmpassword" class="inputUser inputPassword inptxt" autocomplete="off" placeholder=" ">
                        
                    <div class="icon">
                        <i id="icon-eye-confirm" class="fa fa-eye-slash icone-main icone-deactived"></i>
                    </div>
                    <label id="label-csenha" for="confirmpassword" class="labelInput">Confirmar Senha</label>
                </div>
            </div>
            <!-- FIM CAMPO -->
            <!-- <input type="hidden" name="fotouser" value=""> -->


                    <div id="error" class="">
                        <span id="error-text"class="alert-text"></span>
                    </div>
                <!-- <input type="submit" name="submit" id="submit"> -->
                <button class="btn-final" id="btn-submit" name="btn-cad">Cadastre-se</button>
                
                <div class="row-login">
                    <div class="loginb">
                        <h1>Já tem conta? <a href="./login.php">Entre</a></h1>
                    </div>
                </div>
            </fieldset>
        </form>
        <!-- <button id="btn-teste">AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</button> -->
    </div>
</div>
<script src="https://kit.fontawesome.com/83384bd667.js" crossorigin="anonymous"></script>
<!-- <script src="./js/register/verify.js"></script> -->
<script src="./js/register.js"></script>
<script src="./js/global.js" defer></script>
</body>
</html>