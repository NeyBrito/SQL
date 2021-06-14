--Parte 1 CONCEDE-GRANT
  --Cria um login e da permiss�es no banco
EXEC master.dbo.sp_addlogin 'UsrTeste','SenhaTeste'
EXEC sp_grantdbaccess 'UsrTeste','SenhaTeste'
EXEC sp_revokedbaccess 'UsrTeste'
EXEC sp_droplogin 'UsrTeste'

--Concedendo acesso de Atualiza��o para UserNey
GRANT UPDATE ON FUNCIONARIOS TO UsrTeste;

--Concedendo acesso de Incert para UserNey
GRANT INSERT ON FUNCIONARIOS TO UsrTeste;

--Concedendo Acesso de Leitura para UserNey
GRANT SELECT FUNCIONARIOS TO UsrTeste;

--Concedendo Acesso de Delete para o UserNey
GRANT DELETE ON FUNCIONARIOS TO UsrTeste;

--Criando procedure
CREATE PROCEDURE testproc
as
SELECT * FROM Cidades

--Executando Procedure
EXEC testproc

--Concedendo acesso para executar Proc TESTE_PROC Para UserNey
GRANT EXECUTE ON testproc TO UserNey

--Verificando Usu�rio logado
SELECT CURRENT_USER

--Alterando usu�rio logado
SETUSER 'UserNey'
 
--Verificando usu�rio logado
SELECT CURRENT_USER

--Verificando usu�rio logado
SETUSER 'USRTESTE'
