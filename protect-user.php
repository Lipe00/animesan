<?php
if(!isset($_SESSION)){
    session_start();
}
if(!isset($_SESSION['id'])){
    die("<center style=\"color: #fff; \">Você não pode acessar esta página pq não está logado!<p><a href=\"login.php\">Faça Login</a></p><center>");
}

?>