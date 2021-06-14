-- DDL CRIANDO TABELA
use curso
CREATE TABLE employeeNey
(   registration INT IDENTITY (782400,1),
    name          CHAR(50) NOT NULL,
	lastname      CHAR(50) NOT NULL,
	address       CHAR(50),
	city          CHAR(50),
	country       CHAR(25),
	date_of_birth DATETIME 
)

SELECT * FROM employeeNey

--DDL CRIANDO TABELA COM CHAVE ESTRANGEIRA
CREATE TABLE Salary
( registration INT PRIMARY KEY NOT NULL,
  salary DECIMAL (10,2) NOT NULL,
  FOREIGN KEY(registration) REFERENCES employeeNey(registration)
)

--DDL para ADICIONAR CHAVE PRIMARIO NA TABELA EMPLOYEENEY
ALTER TABLE employeeNey ADD PRIMARY KEY (registration)

SELECT * FROM salary

--DDL CRIAÇÃO TABELA COM CHAVE PRIMARIA
CREATE TABLE audit_salary
(      
       transaction_   INT IDENTITY(1,1),
       registragion  INT                 NOT NULL,
	   date_transfer DATETIME            NOT NULL,
	   sal_old       DECIMAL     (10, 2),
	   sal_new       DECIMAL     (10, 2),
	   User_          varchar    (20)    NOT NULL       
)

--DDL CRIAÇÃO DE INDEX
CREATE INDEX ix_emplo1 ON employeeNey(date_of_birth)
CREATE INDEX ix_emplo2 ON employeeNey(city,country)

--Adicionando novo campo na tabela
ALTER TABLE employeeNey ADD genre CHAR(1);

SELECT * FROM employeeNey

--Renomeando campo de tabela
--EXEC sp_rename 'TABELA_ORIGEM.CAMPO_ORIG', 'CAMPO_ORIG', 'COLUMN'
EXEC Sp_rename 'employeeNey.address', 'address1','COLUMN'

