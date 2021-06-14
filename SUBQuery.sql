--Criando tables clientes

use curso

CREATE TABLE clientes
(
cod_cli nchar(5) primary key,
cli_nome nvarchar(40) not null
)

--Inserindo dados na table apartir da table customers da DB NorthWnd
INSERT INTO clientes
select customerid, CompanyName FROM NORTHWND.dbo.Customers

--Criando Table pedidos
CREATE TABLE pedidos
(
num_ped int primary key,
cod_cliente nchar(5) not null,
data datetime not null,
total decimal(10,2)
)

--Inserindo dados na table apartir da table Orders da DB NorthWnd
 INSERT INTO pedidos (num_ped,cod_cliente,data)
 select OrderID,customerid,OrderDate FROM NORTHWND.dbo.Orders

 select * from pedidos
 where total < 50
 
--Atualizando campo total da table pedido com update em subselect
update pedidos set total=(select sum(b.unitprice*b.quantity)
from NORTHWND.dbo.[Order Details] b
where num_ped=b.orderID)

select getdate()

select 

--Apresentar Clientes que fizeram compras antes da data atual
SELECT cod_cli,
       cli_nome
FROM clientes
WHERE cod_cli NOT IN (SELECT cod_cliente
                   FROM pedidos
				   WHERE data < getdate())

--Dar somente os clientes que estão na table pedidos e na table clientes
SELECT P.num_ped,
       P.data,
	   P.cod_cliente,
	   (SELECT C.cli_nome
	    FROM clientes C
		WHERE P.cod_cliente = C.cod_cli) AS nome_cli
FROM pedidos AS P

/*
Nesta Query com SubQuery vamos trazer o total de cada cliente partindo da table pedidos
*/
SELECT P.cod_cliente,
       (SELECT C.cli_nome
	   FROM clientes C
	   WHERE P.cod_cliente = C.cod_cli) AS NOME_CLI,
	   sum(p.total) total
FROM pedidos AS P
GROUP BY P.cod_cliente

/*
Nesta Query com SubQuery vamos trazer todos os clientes e valor de suas compras
*/
SELECT c.cod_cli,
       (SELECT isnull (sum(p.total),0)
	   FROM pedidos p
	   WHERE c.cod_cli = p.cod_cliente) AS total
FROM clientes c
GROUP BY c.cod_cli

--Eliminando clientes da table clientes que não fizeram pedidos
DELETE FROM clientes
where cod_cli not in (select cod_cliente from pedidos)
       






