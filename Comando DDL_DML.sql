-- DDL Criação de Tabela para Exercícios
CREATE TABLE FUNCIONARIOS
(
 ID int identity (1,1),
 NOME VARCHAR (50) NOT NULL,
 SALARIO DECIMAL (10,2),
 SETOR VARCHAR (30)
)
-- DDL Select 
 -- Exemplo Select 
 SELECT * FROM funcionarios

 -- Exemplo Select
          SELECT nome, setor
		  FROM funcionarios 

-- Exemplo Select 
 SELECT nome, setor as depto
 FROM funcionarios

 -- DML Insert
 INSERT INTO funcionarios VALUES ('João', 1000, ''), ('Jose', 2000, ''), ('Alexandre', 3000, '')

 -- OU
 INSERT INTO funcionarios (nome, salario) VALUES ('Pedro', 1000)


 -- DML Update
  UPDATE funcionarios SET salario = '1500', setor = 'HR' 
  WHERE id = '1'
    UPDATE funcionarios SET nome = 'André', setor = 'Financial'
  WHERE id = '4'
    UPDATE funcionarios SET nome = 'Natacha', setor = 'Purchase Affairs'
  WHERE id = '5'
    UPDATE funcionarios SET nome = 'Rafaela', setor = 'HR' 
  WHERE id = '6'
    UPDATE funcionarios SET nome = 'Ney', setor = 'IT'
  WHERE id = '7'
    UPDATE funcionarios SET nome = 'Diogo', setor = 'IT'
  WHERE id = '8'
    UPDATE funcionarios SET nome = 'Helder', setor = 'IT'
  WHERE id = '9'

  -- Simulando um Erro
  INSERT INTO funcionarios (nome,salario) VALUES ('Pedro')
 

  SELECT nome, 
         salario,
		 setor as Dpt    
  FROM funcionarios
  WHERE salario < 1500
   and setor = 'IT';

 -- OU Aumento de 50% sobre Salário Atual.
  UPDATE funcionarios SET salario = salario*1.5
  WHERE id = '7'

-- Exemplo Update com mais de um campo
UPDATE funcionarios SET salario = salario*1.5
WHERE id <> '1'
 and setor = 'IT';
 -- Exemplo Update com mais de um campo
UPDATE funcionarios SET salario = salario*1.5
WHERE id <> '1'

-- DML DELETE
DELETE funcionarios WHERE id ='1'


  
