
DECLARE @NOME VARCHAR(200)
DECLARE CURSOR1 CURSOR FOR SELECT TOP 4 NOME FROM [TABELA DE CLIENTES]
OPEN CURSOR1
FETCH NEXT FROM CURSOR1 INTO @NOME
WHILE @@FETCH_STATUS = 0
BEGIN
   PRINT @NOME
   FETCH NEXT FROM CURSOR1 INTO @NOME
END

commit

-- Crie um script usando um cursor para achar o valor total de todos os créditos de todos os clientes.

-- Dicas:
-- Declare duas variáveis: uma que receba o limite de crédito do cursor e outra o limite de crédito total;
-- Faça um loop no cursor e vá somando o valor do limite de cada cliente na variável de limite de crédito total;
-- Exiba o valor total do limite.

-- Um exemplo de script é:

DECLARE @LIMITECREDITO FLOAT
DECLARE @LIMITECREDITOACUM FLOAT
DECLARE CURSOR2 CURSOR FOR SELECT [LIMITE DE CREDITO] 
    FROM [TABELA DE CLIENTES]
SET @LIMITECREDITOACUM = 0
OPEN CURSOR2
FETCH NEXT FROM CURSOR2 INTO @LIMITECREDITO
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @LIMITECREDITOACUM = @LIMITECREDITOACUM + 
        @LIMITECREDITO
    FETCH NEXT FROM CURSOR2 INTO @LIMITECREDITO
END
CLOSE CURSOR2
DEALLOCATE CURSOR2
PRINT @LIMITECREDITOACUM

commit