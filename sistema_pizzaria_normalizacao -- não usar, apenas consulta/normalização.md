**CEPs**



CEP (PK)



Logradouro



Bairro



Cidade



Estado







**Pizzaria**



CNPJ (PK)



Nome



CEP (FK para CEPs.CEP)



Numero







**Telefone\_Pizzaria**



CNPJ (PK, FK para Pizzaria.CNPJ)



Telefone (PK)







**Clientes**



Cod\_Cliente (PK)



Nome



CEP (FK para CEPs.CEP)



Numero









**Telefone\_Cliente**



Cod\_Cliente (PK, FK para Clientes.Cod\_Cliente)



Telefone (PK)









**Pedidos**



Cod\_Pedido (PK)



Data\_Hora



Cod\_Cliente (FK para Clientes.Cod\_Cliente)



CNPJ\_Pizzaria (FK para Pizzaria.CNPJ)









**Pizzas\_Cardapio**



Cod\_Pizza (PK)



Sabor



Preco\_Base









**Bebidas\_Cardapio**



Cod\_Bebida (PK)



Nome



Preco









**Ingredientes**



Cod\_Ingrediente (PK)



Nome









**Pizza\_Ingredientes**



Cod\_Pizza (PK, FK para Pizzas\_Cardapio.Cod\_Pizza)



Cod\_Ingrediente (PK, FK para Ingredientes.Cod\_Ingrediente)









**Pedido\_Pizzas**



Cod\_Pedido (PK, FK para Pedidos.Cod\_Pedido)



Cod\_Pizza (PK, FK para Pizzas\_Cardapio.Cod\_Pizza)



Quantidade



Preco\_Venda



Borda









**Pedido\_Bebidas**



Cod\_Pedido (PK, FK para Pedidos.Cod\_Pedido)



Cod\_Bebida (PK, FK para Bebidas\_Cardapio.Cod\_Bebida)



Quantidade



Preco\_Venda











