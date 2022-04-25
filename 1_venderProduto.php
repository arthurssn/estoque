<?php

include_once 'database.php';

$cod_produto = $_POST["cod"];
$qtde = $_POST["qtd"];

echo "$cod_produto e $qtde <br><br>";

$sql_vendido = "INSERT INTO vendido VALUES(1, $cod_produto , $qtde)";

$req = pg_query($estoque, $sql_vendido);
$req = pg_query($estoque, $sql_select);

if (pg_num_rows($req) > 0) {
    while ($row = pg_fetch_array($req)) {
        echo "Codigo no produto: " . $row["cod_produto"] . " - Nome: " . $row["nome"] . " - Quantidade disponível: " . $row["qtd_disponivel"] . "<br>";
    }
} else {
    echo "++ Nenhum registro encontrado no banco de dados!!";
}
?>

<button onclick="location.href='index.php'">Voltar</button>