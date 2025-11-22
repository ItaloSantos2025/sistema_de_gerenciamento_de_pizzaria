-- 1 consulta simples mostra todas as pizzas cadastradas na tabela pizzas_cardapio

CREATE VIEW `vw_cardapio_pizzas` AS
SELECT
    pc.Cod_Pizza AS `Código da Pizza`,
    CONCAT(pc.Sabor, ' (', UPPER(ptp.Tamanho), ')') AS `Sabor e Tamanho`,
    UPPER(ptp.Tamanho) AS `Tamanho`,
    ptp.Preco AS `Preço Bruto (R$)`,
    FORMAT(ptp.Preco, 2, 'pt_BR') AS `Preço Formatado (R$)` 
FROM
    pizzas_cardapio pc
JOIN
    pizza_tamanho_preco ptp ON pc.Cod_Pizza = ptp.Cod_Pizza
ORDER BY
    pc.Cod_Pizza, ptp.Preco;


SELECT * FROM vw_cardapio_pizzas;


-- 1/2  formata a data e hora do pedido e o nome do cliente.
CREATE OR REPLACE VIEW VW_Pedidos_Formatados_Simples AS
SELECT
    P.Cod_Pedido AS 'Código do Pedido',
    -- Formata a data e hora do pedido para o formato DD/MM/AAAA HH:MM
    DATE_FORMAT(P.Data_Hora, '%d/%m/%Y %H:%i') AS 'Data e Hora',
    -- Combina o nome do cliente e seu código para fácil referência
    CONCAT(C.Nome, ' (Cod:', C.Cod_Cliente, ')') AS 'Cliente Identificado',
    PZ.Nome AS 'Pizzaria do Pedido'
FROM
    pedidos P
JOIN
    clientes C ON P.Cod_Cliente = C.Cod_Cliente
JOIN
    pizzaria PZ ON P.CNPJ_Pizzaria = PZ.CNPJ
ORDER BY
    P.Cod_Pedido;
    
select * from VW_Pedidos_Formatados_Simples;

-- 2/2  analisa os ingredientes, mostrando o nome em letras minúsculas e o comprimento (tamanho) de cada nome.
CREATE OR REPLACE VIEW VW_Ingredientes_Com_Tamanho AS
SELECT
    Cod_Ingrediente AS 'Código',
    -- Converte o nome do ingrediente para minúsculas
    LOWER(Nome) AS 'Nome Minúsculo',
    -- Calcula o comprimento (número de caracteres) do nome
    LENGTH(Nome) AS 'Tamanho do Nome (Caracteres)'
FROM
    ingredientes
ORDER BY
    'Tamanho do Nome (Caracteres)' DESC, Nome;
    
select * from VW_Ingredientes_Com_Tamanho;


-- 1/2 consultar rapidamente a composição de cada pizza no cardápio

CREATE VIEW `vw_igredientes_completo` AS
SELECT
    pc.Sabor AS `Sabor da Pizza`,
    UPPER(ptp.Tamanho) AS `Tamanho`, 
    ptp.Preco AS `Preço Base (R$)`, 
    GROUP_CONCAT(i.Nome ORDER BY i.Nome ASC SEPARATOR ', ') AS `Ingredientes`
FROM
    pizzas_cardapio pc 
JOIN
    pizza_tamanho_preco ptp ON pc.Cod_Pizza = ptp.Cod_Pizza 
JOIN
    pizza_ingredientes pi ON pc.Cod_Pizza = pi.Cod_Pizza 
JOIN
    ingredientes i ON pi.Cod_Ingrediente = i.Cod_Ingrediente 
GROUP BY 
    pc.Sabor, ptp.Tamanho, ptp.Preco 
ORDER BY 
    pc.Sabor, ptp.Tamanho;


SELECT * FROM VW_Igredientes_Completo;


-- 2/2 para listar todos os nomes de pizzarias com seus números de telefone.

CREATE OR REPLACE VIEW VW_Telefones_Pizzaria AS
SELECT
    PZ.Nome AS 'Nome da Pizzaria',
    PZ.CNPJ AS 'CNPJ',
    TP.Telefone AS 'Telefone de Contato'
FROM
    pizzaria PZ
JOIN
    telefone_pizzaria TP ON PZ.CNPJ = TP.CNPJ
ORDER BY
    PZ.Nome, TP.Telefone;
    
select * from VW_Telefones_Pizzaria;


################## FUNÇÕES ####################


-- 3 Funções Personalizadas

-- 1/3 Esta função retorna o nome fantasia da pizzaria, dado o seu CNPJ.

DELIMITER //

CREATE FUNCTION FN_Nome_Pizzaria_Por_CNPJ (
    p_CNPJ VARCHAR(18)
)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE v_Nome VARCHAR(255);

    SELECT Nome
    INTO v_Nome
    FROM pizzaria
    WHERE CNPJ = p_CNPJ;

    RETURN COALESCE(v_Nome, 'Pizzaria Não Encontrada');
END //

DELIMITER ;

SELECT FN_Nome_Pizzaria_Por_CNPJ('11.111.111/0001-11');

-- 2/3 Esta função retorna o preço de uma bebida, dado o seu código no cardápio.

DELIMITER //

CREATE FUNCTION FN_Obter_Preco_Bebida (
    p_Cod_Bebida INT
)
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE v_Preco DECIMAL(10, 2);

    SELECT Preco
    INTO v_Preco
    FROM bebidas_cardapio
    WHERE Cod_Bebida = p_Cod_Bebida;

    RETURN COALESCE(v_Preco, 0.00);
END //

DELIMITER ;

SELECT FN_Obter_Preco_Bebida(1);


-- 3/3 Esta função conta quantos clientes estão registrados em um CEP específico, utilizando a tabela.

DELIMITER //

CREATE FUNCTION FN_Contar_Clientes_Por_CEP (
    p_CEP VARCHAR(9)
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE v_Total_Clientes INT;

    SELECT COUNT(Cod_Cliente)
    INTO v_Total_Clientes
    FROM clientes
    WHERE CEP = p_CEP;

    RETURN v_Total_Clientes;
END //

DELIMITER ;

SELECT FN_Contar_Clientes_Por_CEP('55600-111');
