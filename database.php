<?php
$servidor = "localhost";
$porta = 5432;
$bd = " /*insira o nome do banco postgres */ ";
$usuario = "postgres";
$senha = " /* senha do banco*/ ";

$sql_select = "SELECT * FROM estoque ORDER BY 1";

$estoque = pg_connect("host=$servidor port=$porta dbname=$bd user=$usuario password=$senha");
if (!$estoque) {
    die('Não foi possível se conectar ao banco de dados.');
}
