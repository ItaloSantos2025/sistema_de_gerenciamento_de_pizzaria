DELIMITER $$

-- 1. Criação da Trigger
CREATE TRIGGER `tg_atualiza_valor_pedido_pizza`
AFTER INSERT ON `pedido_pizzas`
FOR EACH ROW
BEGIN
    DECLARE v_Cod_Pedido INT;
    DECLARE v_Novo_Total DECIMAL(10, 2);

    SET v_Cod_Pedido = NEW.Cod_Pedido;

    SELECT
        COALESCE(SUM(pp.Quantidade * pp.Preco_Venda), 0.00) + -- Soma das Pizzas
        COALESCE(SUM(pb.Quantidade * pb.Preco_Venda), 0.00)   -- Soma das Bebidas
    INTO v_Novo_Total
    FROM
        pedidos p 
    LEFT JOIN
        pedido_pizzas pp ON p.Cod_Pedido = pp.Cod_Pedido
    LEFT JOIN
        pedido_bebidas pb ON p.Cod_Pedido = pb.Cod_Pedido
    WHERE
        p.Cod_Pedido = v_Cod_Pedido;

    UPDATE pedidos
    SET Valor_Total = v_Novo_Total
    WHERE Cod_Pedido = v_Cod_Pedido;
END $$

DELIMITER ;



-- 2. Criação da Trigger
DELIMITER $$


CREATE TRIGGER `tg_atualiza_valor_pedido_bebida`
AFTER INSERT ON `pedido_bebidas`
FOR EACH ROW
BEGIN
    DECLARE v_Cod_Pedido INT;
    DECLARE v_Novo_Total DECIMAL(10, 2);

    
    SET v_Cod_Pedido = NEW.Cod_Pedido;


    SELECT
        COALESCE(SUM(pp.Quantidade * pp.Preco_Venda), 0.00) + -- Soma das Pizzas
        COALESCE(SUM(pb.Quantidade * pb.Preco_Venda), 0.00)   -- Soma das Bebidas
    INTO v_Novo_Total
    FROM
        pedidos p  
    LEFT JOIN
        pedido_pizzas pp ON p.Cod_Pedido = pp.Cod_Pedido
    LEFT JOIN
        pedido_bebidas pb ON p.Cod_Pedido = pb.Cod_Pedido
    WHERE
        p.Cod_Pedido = v_Cod_Pedido;

    UPDATE pedidos
    SET Valor_Total = v_Novo_Total
    WHERE Cod_Pedido = v_Cod_Pedido;
END $$

DELIMITER ;