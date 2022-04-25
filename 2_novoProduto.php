<form action="1_adicionarProduto.php" method="post">
    <input type="text" name="nome_produto" placeholder="Nome"> <br><br>
    <input type="number" min="0" name="cod_produto" placeholder="Codigo do produto"> <br><br>
    <input type="number" min="0" name="produtos_disponiveis" placeholder="Quantidade disponivel"> <br><br>
    <input type="submit" value="Adicionar">
</form>
<button onclick="location.href='index.php'">Voltar</button>