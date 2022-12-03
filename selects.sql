-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
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
 	produtos prod ON pp.produto_id = prod.id;
 
 -- 2)
 SELECT
 	ped.id
 FROM
 	pedidos ped
 JOIN
 	produtos_pedidos pp ON ped.id = pp.pedido_id
 JOIN
 	produtos prod ON pp.produto_id = prod.id
 WHERE 
 	prod.nome LIKE 'Fritas';
 
 -- 3)
 SELECT
 	cl.nome 
 FROM
 	pedidos ped
 JOIN
 	produtos_pedidos pp ON ped.id = pp.pedido_id
 JOIN
 	produtos prod ON pp.produto_id = prod.id
 JOIN
 	clientes cl ON ped.id = cl.id
 WHERE
 	prod.nome LIKE 'Fritas';
 
 -- 4)
SELECT
 	SUM(ROUND((prod.preço)::NUMERIC,  2))
 FROM
 	pedidos ped
 JOIN
 	produtos_pedidos pp ON ped.id = pp.pedido_id
 JOIN
 	produtos prod ON pp.produto_id = prod.id
 JOIN
 	clientes cl ON ped.id = cl.id
 WHERE
 	cl.nome LIKE 'Laura';

-- 5)
 SELECT
 	prod.nome,
 	COUNT(prod.nome)
 FROM
 	pedidos ped
 JOIN
 	produtos_pedidos pp ON ped.id = pp.pedido_id
 JOIN
 	produtos prod ON pp.produto_id = prod.id
 GROUP BY
 	prod.nome HAVING COUNT(prod.nome) >= 0 ORDER BY prod.nome ASC;
 