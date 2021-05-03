
SELECT CEILING(12.333223)

SELECT FLOOR(12.333223)

SELECT RAND()

SELECT * FROM [ITENS NOTAS FISCAIS]

SELECT * FROM [NOTAS FISCAIS]

SELECT [QUANTIDADE], [PRE�O], ROUND(([QUANTIDADE] * [PRE�O]),1) FROM [ITENS NOTAS FISCAIS]

SELECT YEAR(DATA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRE�O))) 
FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA) = 2016
GROUP BY YEAR(DATA)

CONVERT(VARCHAR, GETDATE(), 101) = 04/09/2018