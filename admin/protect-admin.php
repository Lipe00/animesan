<?php
if(!isset($_SESSION)){
    session_start();
}

if(!isset($_SESSION['id'])){
    die("Você não pode acessar esta página pq não está logado!<p><a href=\"login.php\">Faça Login</a></p>");
}elseif(!isset($_SESSION['admin'])){
    die("Você não tem permissão para acessar esta página!<p><a href=\"index.php\">Retorne</a></p>");
}
?>