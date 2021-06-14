use AdventureWorks2014 

SELECT p.firstname,
       p.lastname,
	   e.vacationhours,
	   e.sickleavehours,
	   e.vacationhours + e.sickleavehours AS 'Horas Ausente'
FROM humanresources.employee AS e
   JOIN person.person AS p
   ON e.businessentityid = p.businessentityid
   ORDER BY 'Horas Ausente' ASC;

-- SUBTRAINDO O MIN E O MAX
Use AdventureWorks2014

SELECT MAX(taxrate) maximo, MIN (taxrate) minimo,
       MAX(taxrate) - MIN (taxrate) AS 'Tax Rate Diffecence'
FROM sales.SalesTaxRate
WHERE StateProvinceID IS NOT NULL;

--NOVO PREÇO
SELECT productid,
       NAME,
	   listprice,
	   listprice * 1.15 AS Novo_preco
       FROM   production.product
	       WHERE NAME LIKE 'Mountain-%'
ORDER BY productid ASC;

/*
Divisão. Calcular meta de vendas mensal da equipe de vendas em um Ciclo de 12 meses.
*/

SELECT s.businessentityid AS SalesPersonID,
       firstname,
	   lastname,
	   salesquota,
	   salesquota / 12 AS 'Sales Target Per Month'
FROM sales.salesperson AS s
    JOIN humanresources.Employee AS e
	  ON s.businessentityid = e.businessentityid
	JOIN person.person AS p
	  ON e.businessentityid = p.businessentityid;

-- Exemplo MOD %

SELECT 38 / 5 AS Inteiro,
       38 % 5 AS Restante
