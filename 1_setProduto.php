<?php

include_once 'database.php';

$n_codigo_produto = $_POST['cod_produto'];
$disponiveis = $_POST['produtos_disponiveis'];

$sql_set = "UPDATE estoque SET qtd_disponivel = $disponiveis WHERE cod_produto = $n_codigo_produto";

$req = pg_query($estoque, $sql_set);
?>
<button onclick="location.href='index.php'">Voltar ao incicio</button>
<button onclick="location.href='2_atualizarProduto.php'">Atualizar novo produto</button>