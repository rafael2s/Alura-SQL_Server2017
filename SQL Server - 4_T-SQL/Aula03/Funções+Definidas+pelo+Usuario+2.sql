
CREATE FUNCTION EnderecoCompleto 
(@ENDERECO VARCHAR(100), @CIDADE VARCHAR(50), @ESTADO VARCHAR(50), @CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
   DECLARE @ENDERECO_COMPLETO VARCHAR(250)
   SET @ENDERECO_COMPLETO = @ENDERECO + ' - ' + @CIDADE + ' - ' + @ESTADO + ' - ' + @CEP
   RETURN @ENDERECO_COMPLETO
END
commit
SELECT CPF, [dbo].[EnderecoCompleto]([ENDERECO 1], CIDADE, ESTADO, CEP) AS END_COMPLETO
FROM [TABELA DE CLIENTES]

ALTER FUNCTION EnderecoCompleto 
(@ENDERECO VARCHAR(100), @CIDADE VARCHAR(50), @ESTADO VARCHAR(50), @CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
   DECLARE @ENDERECO_COMPLETO VARCHAR(250)
   SET @ENDERECO_COMPLETO = @ENDERECO + ', ' + @CIDADE + ', ' + @ESTADO + ', ' + @CEP
   RETURN @ENDERECO_COMPLETO
END

SELECT CPF, [dbo].[EnderecoCompleto]([ENDERECO 1], CIDADE, ESTADO, CEP) AS END_COMPLETO
FROM [TABELA DE CLIENTES]

SELECT DATA, COUNT(*) AS NUMERO FROM [NOTAS FISCAIS] 
    WHERE DATA >= '20170101' AND DATA <= '20170110'
GROUP BY DATA

ALTER FUNCTION FuncTabelaNotas (
    @DATAINICIAL AS DATE, 
    @DATAFINAL AS DATE
) RETURNS TABLE
RETURN SELECT DATA, COUNT(*) AS NUMERO 
    FROM [NOTAS FISCAIS] WHERE DATA >= @DATAINICIAL AND 
        DATA <= @DATAFINAL 
GROUP BY DATA 
commit
SELECT * FROM [dbo].[FuncTabelaNotas]('20170101','20170110')