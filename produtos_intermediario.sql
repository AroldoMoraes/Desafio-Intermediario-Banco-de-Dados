CREATE TABLE ProdutoCategoria (
    ID_Produto INT PRIMARY KEY,
    Categoria VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto) ON DELETE CASCADE
);

CREATE TABLE ProdutoEstoque (
    ID_Produto INT PRIMARY KEY,
    Quantidade INT NOT NULL,
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto) ON DELETE CASCADE
);

INSERT INTO ProdutoCategoria (ID_Produto, Categoria)
SELECT ID_Produto,
       CASE WHEN Nome IN ('Leite', 'Cafe') THEN 'Bebidas' ELSE 'Alimentos' END
FROM Produto;

INSERT INTO ProdutoEstoque (ID_Produto, Quantidade)
SELECT ID_Produto, ID_Produto * 5
FROM Produto;

SELECT p.Nome, c.Categoria, e.Quantidade
FROM Produto p
INNER JOIN ProdutoCategoria c ON p.ID_Produto = c.ID_Produto
INNER JOIN ProdutoEstoque e ON p.ID_Produto = e.ID_Produto
ORDER BY p.Nome;

INSERT INTO Produto (ID_Produto, Nome, Preco_Custo, Preco_Venda) VALUES
(11, 'Calça Baggy', 80, 120),
(12, 'Moletom Canguru', 90, 150),
(13, 'Camiseta Preta', 25, 50);

INSERT INTO ProdutoCategoria (ID_Produto, Categoria) VALUES
(11, 'Roupas'),
(12, 'Roupas'),
(13, 'Roupas');

INSERT INTO ProdutoEstoque (ID_Produto, Quantidade) VALUES
(11, 10),
(12, 8),
(13, 20);

DELETE FROM Produto
WHERE ID_Produto IN (
    SELECT ID_Produto
    FROM ProdutoCategoria
    WHERE Categoria = 'Roupas'
);

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Titulo VARCHAR(10) NULL,
    PrimeiroNome VARCHAR(50) NOT NULL,
    InicialMeio CHAR(1) NULL,
    UltimoNome VARCHAR(50) NOT NULL
);

INSERT INTO Cliente (ID_Cliente, Titulo, PrimeiroNome, InicialMeio, UltimoNome) VALUES
(1, 'Sr.', 'Joao', 'P', 'Silva'),
(2, NULL, 'Ana', NULL, 'Costa'),
(3, 'Sra.', 'Maria', NULL, 'Souza'),
(4, NULL, 'Pedro', 'L', 'Santos'),
(5, NULL, 'Ana', NULL, 'Costa');

SELECT DISTINCT
    CASE WHEN Titulo IS NULL THEN '' ELSE Titulo + ' ' END
    + PrimeiroNome
    + CASE WHEN InicialMeio IS NULL THEN '' ELSE ' ' + InicialMeio + '.' END
    + ' ' + UltimoNome AS NomeCompleto
FROM Cliente
ORDER BY NomeCompleto;
