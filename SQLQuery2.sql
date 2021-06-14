use curso

--drop table Alunos
--Criação table
CREATE TABLE alunos
(
id_aluno int identity(1,1),
nome varchar(20) not null,
)

--drop table disciplina
CREATE TABLE disciplina
(
id_disciplina int identity(1,1),
nome_disc varchar(20)
)

--drop table matricula
CREATE TABLE matricula
(
id_aluno int,
id_disciplina int,
periodo varchar(10)
)

Select * from alunos

--Alterando table campo ID_ALUNO para não permitir NOT NULL
ALTER TABLE MATRICULA ALTER COLUMN id_aluno INT NOT NULL

--Alterando table
ALTER TABLE MATRICULA ALTER COLUMN id_disciplina INT NOT NULL

--Criando chave PRIMARIA COMPOSTA
ALTER TABLE MATRICULA ADD CONSTRAINT PK1 PRIMARY KEY (ID_ALUNO,id_disciplina)

--Adicionando CHAVE PRIMARIA TABLE DISCIPLINA
ALTER TABLE DISCIPLINA ADD CONSTRAINT PK2 PRIMARY KEY (id_disciplina)

--Adicionando CHAVE PRIMARIA NA TABLE ALUNOS
ALTER TABLE ALUNOS ADD CONSTRAINT PK_1 PRIMARY KEY (id_aluno)

--Adicionando CHAVE ESTRANGEIRA NA TABLE MATRICULA CAMPO ID_ALUNO
ALTER TABLE MATRICULA
ADD CONSTRAINT FK_MAT1 FOREIGN KEY (ID_ALUNO) REFERENCES ALUNOS(ID_ALUNO)

--Adicionando CHAVE ESTRANGEIRA NA TABLE MATRICULA CAMPO ID_DISCIPLINA
ALTER TABLE MATRICULA 
ADD CONSTRAINT FK_MAT2 FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina)

--INSERT RESGISTROS 
INSERT INTO alunos VALUES ('Ana'),('Pedro'),('Ney'),('Helder'),('Rafa')

--INSERT REGISTROS
INSERT INTO disciplina VALUES ('Fisica'),('Quimica'),('Matematica'),('Banco de Dados'),('Programação')

select * from disciplina

--INSERT REGISTROS
INSERT INTO matricula values ('1','1','Noturno')
INSERT INTO matricula values ('1','2','Vespertino')
INSERT INTO matricula values ('1','3','Matutino')

INSERT INTO matricula values ('2','3','Noturno')
INSERT INTO matricula values ('2','4','Noturno')

INSERT INTO matricula values ('3','1','Noturno')
INSERT INTO matricula values ('3','3','Noturno')
INSERT INTO matricula values ('3','4','Noturno')

INSERT INTO matricula values ('5','1','Matutino')
INSERT INTO matricula values ('5','2','Vespertino')
INSERT INTO matricula values ('5','4','Noturno')

select 