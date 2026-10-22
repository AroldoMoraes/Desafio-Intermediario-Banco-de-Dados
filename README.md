# Desafio Intermediário — Banco de Dados (SQL Server)

Script da atividade intermediária de SQL Server, continuação da atividade iniciante. O script cria tabelas relacionadas à tabela `Produto`, faz consultas com `JOIN`, exclui registros com subquery e monta nomes completos tratando valores `NULL` com `CASE`.

## Conteúdo

```
produtos_intermediario.sql
```

## O que o script faz

1. Cria as tabelas `ProdutoCategoria` e `ProdutoEstoque`, ambas ligadas a `Produto` por `ID_Produto` com chave estrangeira e `ON DELETE CASCADE`.
2. Insere categoria e quantidade em estoque para todos os produtos existentes.
3. Lista nome do produto, categoria e quantidade em estoque com `INNER JOIN`.
4. Insere três produtos de roupa: Calça Baggy, Moletom Canguru e Camiseta Preta.
5. Exclui os produtos da categoria `Roupas` usando subquery.
6. Cria a tabela `Cliente` com título, primeiro nome, inicial do meio e último nome.
7. Gera uma lista única de nomes completos com `DISTINCT`, montando o texto com `CASE` para ignorar os campos `NULL`.

## Pré-requisitos

- SQL Server (Express também serve)
- A tabela `Produto` já criada e populada pela atividade iniciante (`produtos.sql`)
- SQL Server Management Studio (SSMS), Azure Data Studio ou `sqlcmd`

## Como executar

1. Execute primeiro o script da atividade iniciante, que cria e popula a tabela `Produto`.
2. Execute o `produtos_intermediario.sql` no mesmo banco de dados.

Com `sqlcmd`:

```bash
sqlcmd -S .\SQLEXPRESS -E -C -d NomeDoBanco -i produtos_intermediario.sql
```

No SSMS, basta abrir o arquivo e pressionar `F5` com o banco correto selecionado.

## Saída esperada

Resultado da consulta com `JOIN`:

| Nome | Categoria | Quantidade |
| --- | --- | --- |
| Acucar | Alimentos | 30 |
| Arroz | Alimentos | 5 |
| Bolacha | Alimentos | 50 |
| Cafe | Bebidas | 25 |
| Feijao | Alimentos | 10 |
| Leite | Bebidas | 20 |
| Macarrao | Alimentos | 15 |
| Oleo | Alimentos | 35 |

Lista de nomes completos:

```
Ana Costa
Pedro L. Santos
Sr. Joao P. Silva
Sra. Maria Souza
```

Ao final, os três produtos de roupa foram excluídos e seus registros em `ProdutoCategoria` e `ProdutoEstoque` saíram junto por causa do `ON DELETE CASCADE`.

## Autor

Aroldo Moraes
