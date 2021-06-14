-- Operador Where
USE NORTHWND
   SELECT * FROM
   customers
   WHERE country = 'Brazil';


-- Operador And
USE AdventureWorks2014
   SELECT   b.firstname,
            b.lastname,
			a.businessentityid,
			a.loginid,
			a.jobtitle,
			a.vacationhours
	FROM  humanresources.employee a
	    inner join Person.Person b
	        on a.BusinessEntityID=b.BusinessEntityID
	WHERE a.jobtitle = 'Marketing Assistant'
	AND a.vacationhours < 40;

-- SELECT * FROM HumanResources.Employee

-- Operador Logico Between
   SELECT e.firstname,
          e.lastname,
		  ep.rate
	FROM HumanResources.vEmployee e
	JOIN humanresources.employeepayhistory ep
	ON e.BusinessEntityID = ep.BusinessEntityID 
	   WHERE ep.rate BETWEEN 10 AND 30
	ORDER BY ep.rate;   

-- Operador IN
SELECT p.firstname,
       p.lastname,
	   sp.salesquota
FROM person.person AS p
JOIN sales.salesperson AS sp
   ON p.businessentityid = sp.businessentityid
   WHERE p.businessentityid IN (SELECT sp.businessentityid
         WHERE salesquota < 250000);


-- Operador NOT IN
SELECT p.firstname,
       p.lastname,
	   sp.salesquota
FROM person.person AS p
JOIN sales.salesperson AS sp
   ON p.businessentityid = sp.businessentityid
   WHERE p.businessentityid NOT IN (SELECT sp.businessentityid
         WHERE salesquota > 250000);
		 
-- Operador LIKE (LOCALIZA VALORES QUE CONTENHA "OR" EM QUALQUER LUGAR)
USE NORTHWND
SELECT * FROM customers
      WHERE contactname LIKE '%or%';

-- Operador LIKE (LOCALIZA VALORES QUE CONTENHA 'R' NA SEGUNDA POSIÇÃO)
SELECT * FROM customers
      WHERE contactname LIKE '_r%';

-- Operador LIKE (LOCALIZA VALORES QUE CONTENHA 'A' E POSSUEM PELO MENOS 3 CARACTERES DE COMPRIMENTO)
SELECT * FROM customers
      WHERE contactname LIKE 'a_%_%';

-- Operador LIKE (LOCALIZA VALORES QUE CONTENHA 'A' E TEMINA COM 0)
SELECT * FROM customers
      WHERE contactname LIKE 'a%O';


-- Operador LIKE (LOCALIZA VALORES QUE CONTENHA 'A' E TEMINA COM 0)
SELECT * FROM customers
     WHERE contactname NOT LIKE 'a%';

Use AdventureWorks2014
SELECT p.firstname,
       p.lastname,
	   ph.phonenumber
FROM person.personphone AS ph
     INNER JOIN person.person AS p
	      ON ph.businessentityid = p.businessentityid
		WHERE ph.phonenumber LIKE '415%4'
ORDER BY p.lastname;

-- Operador LIKE CORINGA []
SELECT businessentityid,
       firstname,
	   lastname 
	   FROM person.person
	   WHERE firstname LIKE '[CS]he%';

SELECT lastname,
	   firstname
FROM person.person
WHERE lastname LIKE 'Zh[ae]ng'
ORDER BY lastname ASC,firstname ASC;

-- Operador NOT 
SELECT productid,
       NAME,
	   color,
	   standardcost
FROM production.product 
    WHERE productnumber LIKE 'BK-%'
	AND color = 'Silver'
	AND NOT standardcost < 400;

-- Operador OR
SELECT firstname,
       lastname,
	   shift, -- Tunrno
	   department
FROM HumanResources.vEmployeeDepartmentHistory
WHERE Department = 'Quality Assurance'
AND (shift = 'Evening' OR shift = 'Night');

-- Operador IS NULL
USE AdventureWorks2014
SELECT lastname,
       firstname,
	   MiddleName
FROM person.person
WHERE MiddleName IS NULL;

-- Operador IS NOT NULL
SELECT lastname,
       firstname,
	   MiddleName
FROM person.person
WHERE MiddleName IS NOT NULL;

-- Operador HAVING 
USE NORTHWND
SELECT Count(CustomerID) AS Number ,
       country
	   FROM customers
	   GROUP BY country HAVING Count(CustomerID) < 5;

-- Operador HAVING
USE NORTHWND
SELECT employees.lastname,
       Count(orders.orderid) AS NumberOfOrders
FROM orders
INNER JOIN employees
    ON orders.employeeid = employees.employeeid
--WHERE lastname = 'Davolio' OR lastname = 'Fuller'
GROUP BY lastname HAVING Count(orders.orderid) > 25;









