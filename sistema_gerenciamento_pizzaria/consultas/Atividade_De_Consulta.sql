/*****************************************************************
* Equipe:  Ítalo Santos, Elison José, Matheus Douglas, Rafael Lucas e Allan Junior.
* DATA: 22/09/2025
*/
use sistema_gerenciamento_pizzaria;

-- Duas simples:

SELECT * FROM clientes;

SELECT nome, numero FROM pizzaria;

-- Três com junções

-- 1)
SELECT
    p.Cod_Pedido,
    c.Nome AS Nome_Cliente,
    pz.Nome AS Nome_Pizzaria
FROM
    pedidos p
INNER JOIN
    clientes c ON p.Cod_Cliente = c.Cod_Cliente
INNER JOIN
    pizzaria pz ON p.CNPJ_Pizzaria = pz.CNPJ;
    
-- 2)

SELECT
    i.Nome AS Ingrediente
FROM
    pizzas_cardapio pc
INNER JOIN
    pizza_ingredientes pi ON pc.Cod_Pizza = pi.Cod_Pizza
INNER JOIN
    ingredientes i ON pi.Cod_Ingrediente = i.Cod_Ingrediente
WHERE
    pc.Sabor = 'Frango com Catupiry';
    
-- 3)

SELECT
    c.Nome,
    tc.Telefone
FROM
    clientes c
INNER JOIN
    telefone_cliente tc ON c.Cod_Cliente = tc.Cod_Cliente
WHERE
    c.Nome = 'Ana Costa';


-- Criar consultas envolvendo (Mínimo 2 de cada):

-- Funções de string

-- 1)
SELECT
    CONCAT(Nome, ' | Endereço: CEP ', CEP, ', Nº ', Numero) AS Descricao_Cliente
FROM
    clientes;
    
-- 2)
SELECT
    Nome,
    LENGTH(Nome) AS Tamanho_do_Nome
FROM
    ingredientes;


-- Funções de data

-- 1) 
SELECT
    Cod_Pedido,
    Cod_Cliente,
    DATE(Data_Hora) AS Dia_do_Pedido
FROM
    pedidos;
    
-- 2)
SELECT
    Cod_Pedido,
    DATE_FORMAT(Data_Hora, '%d/%m/%Y às %H:%i') AS Data_Formatada
FROM
    pedidos;


-- Like e Not like

-- 1)
SELECT Nome FROM clientes WHERE Nome LIKE 'A%';
SELECT Sabor FROM pizzas_cardapio WHERE Sabor LIKE '%a%';

-- 2)
SELECT Nome FROM ingredientes WHERE Nome NOT LIKE '%Fatiada%';
SELECT Nome FROM pizzaria WHERE Nome NOT LIKE '%Express%';

-- Between

-- 1)
SELECT Cod_pedido, Valor_total FROM pedidos WHERE valor_total BETWEEN 38.00 AND 70.00;

-- 2)
SELECT Cod_Pedido, Cod_Cliente, Data_Hora FROM pedidos WHERE Cod_Pedido BETWEEN 2 AND 4;

-- UPPER, LOWER

-- 1)
SELECT UPPER(Nome) AS Nome_Pizzaria_Maiusculo FROM pizzaria;
SELECT UPPER(Nome) AS Nome_Cliente_Maiusculo FROM clientes;

-- 2) 
SELECT LOWER(Sabor) AS Sabor_Minusculo FROM pizzas_cardapio;
SELECT LOWER(Borda) AS tipo_de_borda FROM pedido_pizzas;

-- MAX, MIN  e AVG

-- 1) 
SELECT
    MAX(Preco) AS Pizza_Mais_Cara,
    MIN(Preco) AS Pizza_Mais_Barata,
    AVG(Preco) AS Media_de_Precos
FROM
    pizza_tamanho_preco;
    
-- 2)
SELECT
    MAX(Preco_Venda) AS Maior_Valor_Vendido,
    MIN(Preco_Venda) AS Menor_Valor_Vendido,
    AVG(Preco_Venda) AS Media_Por_Item,
    SUM(Preco_Venda) AS Receita_Total_Pizzas
FROM
    pedido_pizzas;
