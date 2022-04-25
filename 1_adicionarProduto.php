<?php

include_once 'database.php';

$n_codigo_produto = $_POST['cod_produto'];
$nome = '\'' . $_POST['nome_produto'] . '\'';
$disponiveis = $_POST['produtos_disponiveis'];

$sql_insert = "INSERT INTO estoque VALUES($n_codigo_produto, $nome, $disponiveis)";

$req = pg_query($estoque, $sql_insert);
?>
<button onclick="location.href='index.php'">Voltar ao incicio</button>
<button onclick="location.href='2_novoProduto.php'">Adicionar novo produto</button>