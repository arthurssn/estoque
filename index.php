<?php
include_once 'database.php';
$sql_select = "SELECT * FROM estoque ORDER BY 1";
$req = pg_query($estoque, $sql_select);

if (pg_num_rows($req) > 0) {
    while ($row = pg_fetch_array($req)) {
        echo "Codigo do produto: " . $row["cod_produto"] . " - Nome: " . $row["nome"] . " - Quantidade disponível: " . $row["qtd_disponivel"] . "<br>";
    }
} else {
    echo "++ Nenhum registro encontrado no banco de dados!!";
}
?>
<br><br>

<button onclick="location.href='2_novaVenda.php'">Nova venda</button>
<button onclick="location.href='2_novoProduto.php'">Adicionar novo produto</button>
<button onclick="location.href='2_atualizarProduto.php'">Atualizar produto</button>

<?php
