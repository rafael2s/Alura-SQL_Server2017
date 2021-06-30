
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

-- Crie um script usando um cursor para achar o valor total de todos os cr�ditos de todos os clientes.

-- Dicas:
-- Declare duas vari�veis: uma que receba o limite de cr�dito do cursor e outra o limite de cr�dito total;
-- Fa�a um loop no cursor e v� somando o valor do limite de cada cliente na vari�vel de limite de cr�dito total;
-- Exiba o valor total do limite.

-- Um exemplo de script �:

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