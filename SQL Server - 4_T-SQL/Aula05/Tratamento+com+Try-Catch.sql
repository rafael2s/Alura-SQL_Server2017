
CREATE PROCEDURE [dbo].[TrataErroZeroTry] @CPF VARCHAR(12), @ANO INT, @DENOMINADOR INT, 
@MENSAGEM VARCHAR(50) OUTPUT
AS
BEGIN
  BEGIN TRY
     SELECT SUM(A.QUANTIDADE * A.[PRE�O]) AS FATURAMENTO,
     SUM(A.QUANTIDADE * A.[PRE�O])/@DENOMINADOR AS COMISSAO
     FROM [ITENS NOTAS FISCAIS] A INNER JOIN [NOTAS FISCAIS] B
     ON A.NUMERO = B.NUMERO WHERE B.CPF = @CPF AND YEAR(B.[DATA]) = @ANO
  END TRY
  BEGIN CATCH
      SET @MENSAGEM = 'Houve um erro n�mero: ' + CONVERT(VARCHAR(10), @@ERROR)
  END CATCH
END

commit

DECLARE @DENOMINADOR INT
DECLARE @CPF VARCHAR(12)
DECLARE @ANO INT
DECLARE @MENSAGEM VARCHAR(30)

SET @CPF = '1471156710'
SET @ANO = 2016
SET @DENOMINADOR = 0
SET @MENSAGEM = ''
EXEC TrataErroZeroTry @CPF = @CPF, @ANO = @ANO, @DENOMINADOR = @DENOMINADOR, @MENSAGEM = @MENSAGEM OUTPUT
IF @MENSAGEM <> ''
  PRINT @MENSAGEM


-- Crie uma nova SP chamada InclusaoVendedor02, agora tratando o erro com TRY-CATCH.

-- Crie a SP:

CREATE PROCEDURE InclusaoVendedor02
@MATRICULA AS VARCHAR(5), @NOME AS VARCHAR(100), 
    @PERCENTUAL AS FLOAT,
@DATAADMISSAO AS DATE, @FERIAS AS BIT, @BAIRRO AS VARCHAR(50), 
@MENSAGEM VARCHAR(100) OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO [TABELA DE VENDEDORES] (MATRICULA, NOME, 
            [PERCENTUAL COMISS�O], [DATA ADMISS�O], [DE FERIAS], BAIRRO)
        VALUES (@MATRICULA, @NOME, @PERCENTUAL, @DATAADMISSAO, @FERIAS, @BAIRRO)
    END TRY
BEGIN CATCH
    SET @MENSAGEM = 'Houve um erro n�mero: ' + CONVERT(VARCHAR(10), @@ERROR)
END CATCH
END
commit

-- Executando-a

DECLARE @MENSAGEM VARCHAR(30)
EXEC InclusaoVendedor02 '00238', 'Pericles Alves', 0.11, '20160821', 
    0, 'Santo Amaro', @MENSAGEM = @MENSAGEM OUTPUT
IF @MENSAGEM <> ''
    PRINT @MENSAGEM

