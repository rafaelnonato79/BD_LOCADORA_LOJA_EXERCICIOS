-- QUESTÃO 1-Nome de todas as cidades e, se existirem, seus respectivos bairros
SELECT 
    C.CID_NOME AS 'CIDADE',
    B.BAI_NOME AS 'NOME'
FROM TB_CIDADES C
LEFT JOIN TB_BAIRROS B ON B.BAI_CID_CODIGO = C.CID_CODIGO
ORDER BY C.CID_NOME ASC
GO

--2) Nome de todas as cidades sem nenhum bairro cadastrado

SELECT 
    C.CID_NOME AS 'CIDADE',
    B.BAI_NOME AS 'NOME'
FROM TB_CIDADES C
LEFT JOIN TB_BAIRROS B ON B.BAI_CID_CODIGO = C.CID_CODIGO
WHERE B.BAI_NOME IS NULL
GO

--3) Nome de todas as marcas sem nenhum produto cadastrado.
INSERT INTO TB_MARCAS (MAR_MARCA)
VALUES ('FILA'), ('CENTAURO')
GO

SELECT 
    M.MAR_MARCA AS 'MARCA',
    P.PRO_NOME AS 'PRODUTO'
FROM TB_MARCAS M
LEFT JOIN TB_PRODUTOS P ON P.PRO_MAR_CODIGO = M.MAR_CODIGO
GO

--4) Nome de todos os produtos que não tiveram nenhuma unidade vendida.
create table tb_vendas(
    
)