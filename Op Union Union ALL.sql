restore database < Database NORTHWND > with recovery
alter database <Database  NORTHWND> set hadr off

SELECT city 
FROM customers
UNION
SELECT city
FROM suppliers
ORDER BY city;f  

SELECT '1' AS STRING ,1 AS INTEIRO
UNION 
SELECT 'A',4

--EXEMPLO USANDO UNION ALL

SELECT 'CLI', city
FROM customers
UNION ALL
SELECT 'FORNEC', city
FROM Suppliers
ORDER BY city;

--EXEMPLO USANDO UNION

SELECT 'CLI' AS FornOrClient, city,
       country
FROM customers 
 WHERE country = 'Germany'
UNION 
SELECT 'FORNC', city,
       country
FROM Suppliers
 WHERE country = 'Germany'
 ORDER BY city; 

 --EXEMPLO USANDO UNION ALL

SELECT 'CLI' AS FornOrClient, city ,
       country
FROM customers 
 WHERE country = 'Germany'
UNION ALL
SELECT 'FORNC', city,
       country
FROM Suppliers
 WHERE country = 'Germany'
 ORDER BY city; 