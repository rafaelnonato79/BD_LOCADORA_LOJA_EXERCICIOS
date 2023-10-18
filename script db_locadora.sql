--CRIA O BANCO DE DADOS
create database db_locadora

--SELECIONA O BANCO DE DADOS
USE db_locadora

--CRIAR A TABELA TB_DIRETORES
CREATE TABLE TB_DIRETORES(
	DIR_ID int not null identity, 
	DIR_NOME varchar(100) not null
	constraint PK_DIRETORES primary key(DIR_ID)
)
GO

--INSERE DADOS NA TABELA 
INSERT INTO TB_DIRETORES
	(DIR_NOME)
VALUES
	('Steven Spielberg'),
	('Quentin Tarantino'),
	('Martin Scorsese'),
	('Woody Allen')
GO

	--LISTAR TODOS OS REGISTROS DA TABELA TB_DIRETORES
	SELECT* FROM TB_DIRETORES

CREATE TABLE TB_ATORES(
	ATO_ID INT NOT NULL IDENTITY,
	ATO_NOME VARCHAR(100) NOT NULL,
	CONSTRAINT PK_ATORES PRIMARY KEY(ATO_ID)
)
GO

	-- INSERIR ATORES
INSERT INTO TB_ATORES
	(ATO_NOME)
VALUES
	('Nicolas Cage'),
	('Brad Pitt'),
	('Adam Sandler'),
	('Julia Roberts'),
	('Robert De Niro'),
	('Denzel Washington'),
	('Bruce Willis')
GO

 -- LISTA ATORES
SELECT* FROM TB_ATORES
GO

CREATE TABLE TB_PAISES(
	PAI_ID INT NOT NULL IDENTITY,
	PAI_DESCRICAO VARCHAR(30) NOT NULL,
	PAI_SIGLA CHAR(3) NOT NULL,
	CONSTRAINT PK_PAISES PRIMARY KEY(PAI_ID)
)
GO

-- INSERIR PAISES
INSERT INTO TB_PAISES
	(PAI_SIGLA,PAI_DESCRICAO)
VALUES	
	('BRA', 'Brasil'),
	('USA', 'Estados Unidos'),
	('FRA', 'França'),
	('ESP', 'Espanha'),
	('ITA', 'Itália'),
	('ARG', 'Argentina'),
	('POR', 'Portugal')
GO

--LISTAR PAISES
SELECT* FROM TB_PAISES
GO

--CRIA A TABELA DE GENEROS
CREATE TABLE TB_GENEROS(
	GEN_ID INT NOT NULL IDENTITY,
	GEN_DESCRICAO VARCHAR(50) NOT NULL,
	CONSTRAINT PK_GENEROS PRIMARY KEY(GEN_ID)
)
GO

--INSERIR GENEROS
INSERT INTO TB_GENEROS
	(GEN_DESCRICAO)
VALUES
	('Ação'),
	('Comédia'),
	('Drama'),
	('Suspense'),
	('Terror'),
	('Ficção Cientifica'),
	('Romance')
GO

--LISTAR GENEROS
SELECT* FROM TB_GENEROS
GO

CREATE TABLE TB_CLASSIFICACOES(
	CLA_ID INT NOT NULL IDENTITY,
	CLA_DESCRICAO VARCHAR(20) NOT NULL,
	CLA_SIGLA VARCHAR(2) NOT NULL,
	CONSTRAINT PK_CLASSIFICACOES PRIMARY KEY(CLA_ID)
)
GO

--INSERIR CLASSIFICAÇÕES
INSERT INTO TB_CLASSIFICACOES
	(CLA_SIGLA, CLA_DESCRICAO)
VALUES
	('L','Livre'),
	('10','Maiores de 10 anos'),
	('12', 'Maiores de 12 anos'),
	('14','Maiores de 14 anos'),
	('16','Maiores de 16 anos'),
	('18','Maiores de 18 anos')
GO

--LISTA CLASSIFICAÇÕES
SELECT* FROM TB_CLASSIFICACOES
GO

--CRIAR TABELA DE FILMES
CREATE TABLE TB_FILMES(
	FIL_ID INT NOT NULL IDENTITY,
	FIL_TITULO VARCHAR(100) NOT NULL,
	FIL_SINOPSE TEXT,
	FIL_DURACAO INT,
	FIL_ANO_LANCAMENTO INT,
	FIL_CLA_ID INT,
	FIL_PAI_ID INT,
	CONSTRAINT PK_FILMES PRIMARY KEY(FIL_ID),
	CONSTRAINT FK_CLA_FIL FOREIGN KEY(FIL_CLA_ID)
		REFERENCES TB_CLASSIFICACOES(CLA_ID),
	CONSTRAINT FK_PAI_ID FOREIGN KEY(FIL_PAI_ID)
		REFERENCES TB_PAISES(PAI_ID)
)
GO	

--INSERIR FILMES
INSERT INTO TB_FILMES
	(FIL_TITULO, FIL_DURACAO, FIL_ANO_LANCAMENTO, FIL_CLA_ID, FIL_PAI_ID)
VALUES
	('O Poderoso Chefão',175,1972,6,2),
	('Pulp Fiction', 154, 1994, 5, 2),
	('Cães de Aluguel', 99, 1994, 5, 2),
	('Taxi Driver', 114, 1976, 5, 2),
	('O Lobo de Wall Street', 180, 2013, 5 ,2)
GO

SELECT* FROM TB_FILMES
GO

--CRIA A TABELA TB_DIRETORES_FILMES
CREATE TABLE TB_DIRETORES_FILMES(
	DDF_FIL_ID INT NOT NULL,
	DDF_DIR_ID INT NOT NULL,
	CONSTRAINT PK_DIRETORES_FILMES PRIMARY KEY (DDF_FIL_ID, DDF_DIR_ID),
	CONSTRAINT FK_FIL_DDF FOREIGN KEY (DDF_FIL_ID)
		REFERENCES TB_FILMES (FIL_ID),
	CONSTRAINT FK_DIR_DDF FOREIGN KEY (DDF_DIR_ID)
		REFERENCES TB_DIRETORES (DIR_ID)
)
GO

--INSERIR DADOS NA TABELA TB_DIRETORES_FILMES
INSERT INTO TB_DIRETORES_FILMES
	(DDF_FIL_ID,DDF_DIR_ID)
VALUES
	(1,3),
	(2,2),
	(3,2),
	(4,3),
	(5,3)
GO

--LISTAR DADOS DE TB_DIRETORES_FILMES
SELECT* FROM TB_DIRETORES_FILMES
GO

--CRIAR TABELA DE TB_GENEROS_FILMES
CREATE TABLE TB_GENEREOS_FILMES(
	GDF_FIL_ID INT NOT NULL,
	GDF_GEN_ID INT NOT NULL,
	CONSTRAINT PK_GENEROS_FILMES PRIMARY KEY (GDF_FIL_ID, GDF_GEN_ID),
	CONSTRAINT FK_FIL_GDF FOREIGN KEY (GDF_FIL_ID)
		REFERENCES TB_FILMES (FIL_ID),
	CONSTRAINT FK_GEN_GDF FOREIGN KEY (GDF_GEN_ID)
		REFERENCES TB_GENEROS (GEN_ID)
)
GO

INSERT INTO TB_GENEREOS_FILMES
	(GDF_FIL_ID, GDF_GEN_ID)
VALUES
	(1,3),
	(1,5),
	(2,3),
	(2,4),
	(3,3),
	(3,4),
	(4,3),
	(4,4),
	(4,5),
	(5,3),
	(5,4)
GO

-- LISTAR DADOS DE TB_GENEROS_FILMES
SELECT* FROM TB_GENEREOS_FILMES
GO

--CRIAR TABELA TB_ATORES_FILMES
CREATE TABLE TB_ATORES_FILMES(
	ADF_FIL_ID INT NOT NULL,
	ADF_ATO_ID INT NOT NULL,
	CONSTRAINT PK_ATORES_FILMES PRIMARY KEY (ADF_FIL_ID, ADF_ATO_ID),
	CONSTRAINT FK_FIL_ADF FOREIGN KEY (ADF_FIL_ID)
		REFERENCES TB_FILMES (FIL_ID),
	CONSTRAINT FK_ATO_ID FOREIGN KEY (ADF_ATO_ID)
		REFERENCES TB_ATORES (ATO_ID)
)
GO

--INSERIR DADOS EM TB_ATORES_FILMES
INSERT INTO TB_ATORES_FILMES
	(ADF_FIL_ID, ADF_ATO_ID)
VALUES
	(1,1), (1,2), (1,3),
	(2,1), (2,2), (2,3),
	(3,1), (3,2), (3,3),
	(4,1), (4,2), (4,3),
	(5,1), (5,2), (5,3)
GO

--LISTAR TODOS OS REGISTROS DE TB_ATORES_FILMES
SELECT* FROM TB_ATORES_FILMES
GO





