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

    <link rel="stylesheet" href="./css/global.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="shortcut icon" href="./img/favicon/favicon.ico" type="image/x-icon">
</head>
<body>
    
    <div class="space" id="space">
        <!-- <img id="image-back" src=""> -->
    <div class="main-login">
        <div class="right-login">
            <div class="card-login">
                <h1>Login</h1>
                <?php
                if (isset($_POST['btn-cad'])) {

                    include_once('./login-bd.php');
                }
                ?>
                <form id="form" action="" method="post">
                <!-- INICIO CAMPO -->
                <div class="inputBox">
                    <div class="textfield">
                        
                    <input type="text" name="email" id="email" class="inputUser borderoff " autocomplete="off" placeholder=" ">
                    <label id="label-email" for="email" class="labelInput">Email</label>
                    </div>
                </div>
                <!-- FIM CAMPO -->
                
                <!-- INICIO CAMPO -->
                <div class="inputBox">
                    <div class="textfield">
                        
                    <input type="password" name="password" id="password" class="inputUser borderoff" autocomplete="off" placeholder=" ">
                        <div class="icon">

                    <i id="icon-eye"class="fa fa-eye-slash icone-main icone-deactived"></i>

                    </div>
                    <label  id="label-senha" for="password" class="labelInput" >Senha</label>
                    
                    </div>
                </div>
                <!-- FIM CAMPO -->
                
                    <div id="error" class="">
                        <span id="error-text"class="alert-text"></span>
                    </div>
                <button id="btn-login"class="btn-login" name="btn-cad" value="submit">Entrar</button>
            </form>
            <!-- <button id="btn-teste">teste</button> -->
            <div class="registerb">
                <h1>Não tem conta? <a href="./register.php">Cadastre-se</a></h1>
            </div>
            </div>
        </div>
    </div>
    
    <script src="https://kit.fontawesome.com/83384bd667.js" crossorigin="anonymous"></script>
    <script src="./js/login.js"></script>


</body>
</html>