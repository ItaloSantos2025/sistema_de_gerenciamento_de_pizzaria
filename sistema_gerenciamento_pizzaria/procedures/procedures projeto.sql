use sistema_pizzaria_normalizacao;

-- Atividade Procedure

-- 1) 

DELIMITER $$

CREATE PROCEDURE sp_CadastrarCliente(
    IN p_Nome VARCHAR(255),
    IN p_CEP VARCHAR(9),
    IN p_Numero VARCHAR(10)
)
BEGIN
    -- Comando SQL que será executado
    INSERT INTO clientes (Nome, CEP, Numero)
    VALUES (p_Nome, p_CEP, p_Numero);

    -- Opcional: Retorna o ID do cliente que acabou de ser inserido
    SELECT LAST_INSERT_ID() AS Novo_Cod_Cliente;

END$$

-- Restaura o delimitador padrão
DELIMITER ;


CALL sp_CadastrarCliente('Ana Beatriz', '55608-000', '150');

SELECT * FROM clientes WHERE Nome = 'Ana Beatriz';

-- 2 ) Criar um procedimento que use o parâmetro  de retorno de dados (OUT).

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultarPrecoPizza`(
    IN p_NomeSabor VARCHAR(100),    
    IN p_Tamanho CHAR(1),           
    OUT p_Preco DECIMAL(10, 2)    
)
BEGIN
    
    SELECT ptp.Preco
    INTO p_Preco
    FROM pizzas_cardapio pc
    JOIN pizza_tamanho_preco ptp ON pc.Cod_Pizza = ptp.Cod_Pizza
    WHERE pc.Sabor = p_NomeSabor 
      AND ptp.Tamanho = p_Tamanho; 

END$$

DELIMITER ;


CALL sp_ConsultarPrecoPizza('Calabresa', @preco_resultado);
SELECT @preco_resultado AS 'Preco_da_Calabresa';
-- outro exemplo: Frango com Catupiry


-- 3) Criar um procedimento que use o parâmetro  de entrada e retorno de dados (INOUT).

DELIMITER $$

CREATE PROCEDURE sp_AdicionarTaxaEntrega(
    INOUT p_ValorTotal DECIMAL(10, 2) -- ENTRA com um valor, SAI com ele modificado
)
BEGIN
    -- Define a taxa de entrega fixa
    DECLARE v_TaxaFixa DECIMAL(10, 2);
    SET v_TaxaFixa = 5.00;

    -- Pega o valor que ENTROU (p_ValorTotal)
    -- Soma a taxa fixa nele
    -- E atualiza a MESMA variável (p_ValorTotal) para SAIR com o novo valor
    SET p_ValorTotal = p_ValorTotal + v_TaxaFixa;

END$$

DELIMITER ;

SET @total_do_pedido = 35.00;

SELECT @total_do_pedido AS 'Valor ANTES de adicionar a taxa';

CALL sp_AdicionarTaxaEntrega(@total_do_pedido);

SELECT @total_do_pedido AS 'Valor DEPOIS de adicionar a taxa';


-- 4 ) Criar um procedimento que insira automaticamente 10 informações passando apenas uma informação.

DELIMITER $$

CREATE PROCEDURE sp_InserirClientesEmLote(
    IN p_NomeBase VARCHAR(200) -- O único dado de entrada
)
BEGIN
    -- 1. Criamos um contador
    DECLARE v_contador INT;
    SET v_contador = 1;

    -- 2. Criamos um loop que vai rodar 10 vezes
    WHILE v_contador <= 10 DO

        -- 3. Dentro do loop, nós inserimos o cliente
        INSERT INTO clientes (Nome, CEP, Numero)
        VALUES (
            CONCAT(p_NomeBase, v_contador),  -- Ex: 'Cliente Teste' + '1' = 'Cliente Teste1'
            '55600-000',  -- Nosso "CEP Padrão" (precisa existir na tabela ceps)
            'S/N'         -- Nosso "Número Padrão" (Sem Número)
        );

        -- 4. Incrementamos o contador para o loop continuar
        SET v_contador = v_contador + 1;

    END WHILE;

    -- Opcional: Mostra uma mensagem de sucesso
    SELECT '10 clientes inseridos com sucesso!' AS Resultado;

END$$

DELIMITER ;

CALL sp_InserirClientesEmLote('ClienteLote');

SELECT Nome, CEP, Numero
FROM clientes
WHERE Nome LIKE 'ClienteLote%';


-- 5) Criar um procedimento que conte a quantidade de itens de uma tabela. Exemplo: quantidade de alunos

DELIMITER $$

CREATE PROCEDURE sp_ContarPizzasNoCardapio(
    OUT p_Total_Sabores INT  -- O parâmetro de SAÍDA para guardar o número
)
BEGIN
    -- Conta o número total de linhas (sabores) na tabela 'pizzas_cardapio'
    -- e armazena o resultado no parâmetro de saída 'p_Total_Sabores'
    SELECT COUNT(*)
    INTO p_Total_Sabores
    FROM pizzas_cardapio;

END$$

DELIMITER ;

CALL sp_ContarPizzasNoCardapio(@total);
SELECT @total AS 'Quantidade de Sabores no Cardapio';
