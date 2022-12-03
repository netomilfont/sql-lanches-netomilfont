-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
 INSERT INTO clientes
 	(nome, lealdade)
 VALUES
	('Georgia', 0);

-- 2)
INSERT INTO pedidos 
	(status, cliente_id)
VALUES 
	('Recebido', 6);

-- 3)
INSERT INTO produtos_pedidos 
	(pedido_id, produto_id)
VALUES 
	(6, 1),
	(6, 2),
	(6, 6),
	(6, 8),
	(6, 8);

-- Leitura

-- 1)
SELECT
 	cl.*,
 	ped.*,
 	prod.id,
 	prod.nome,
 	prod.tipo,
 	ROUND((prod.preço)::NUMERIC, 2) preço,
 	prod.pts_de_lealdade
 FROM
 	pedidos ped
 JOIN
 	produtos_pedidos pp ON ped.id = pp.pedido_id
 JOIN
 	produtos prod ON pp.produto_id = prod.id
 JOIN
 	clientes cl ON ped.id = cl.id
 WHERE
 	cl.nome LIKE 'Georgia';

-- Atualização

-- 1)
UPDATE 
 	clientes cl
 SET
	lealdade = 20
 WHERE
	cl.nome LIKE 'Georgia';


-- Deleção

-- 1)
DELETE FROM
	clientes cl
WHERE
	cl.nome LIKE 'Marcelo';

