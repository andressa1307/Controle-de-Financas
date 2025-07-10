-- Cria o banco
CREATE DATABASE FinancasPessoais;
GO

-- Usa o banco
USE FinancasPessoais;
GO

-- Tabela de entradas (salário, renda extra)
CREATE TABLE Entradas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Data DATE NOT NULL,
    Tipo VARCHAR(50),         -- 'Salário' ou 'Renda Extra'
    Valor DECIMAL(10, 2) NOT NULL
);

-- Tabela de despesas
CREATE TABLE Despesas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Data DATE NOT NULL,
    Categoria VARCHAR(50),    -- Ex: 'Aluguel', 'Internet', etc.
    Valor DECIMAL(10, 2) NOT NULL
);

-- Tabela de investimentos
CREATE TABLE Investimentos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Data DATE NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL
);


-- Receita total
SELECT 'Receita' AS Tipo, Tipo AS Subtipo, Data, Valor FROM Entradas
UNION ALL
SELECT 'Despesa', Categoria, Data, Valor FROM Despesas
UNION ALL
SELECT 'Investimento', 'Investimento', Data, Valor FROM Investimentos;

select * from Entradas
Select * from Investimentos
Select * from Despesas



use FinancasPessoais

select * from Entradas

update entradas set valor = 3865 where id = 1

update entradas set valor = 406 where id = 2

select * from Despesas

update Despesas set Valor = 300 where id =3

select SUM (valor) from Despesas as despesa



SELECT 
    (SELECT SUM(valor) FROM Entradas) -
    (SELECT SUM(valor) FROM Despesas) -
	(select sum (valor) from Investimentos)
 AS saldo;


select SUM (valor) from Despesas as despesa
select SUM (valor) from Entradas as entrada

use FinancasPessoais

-- Cria calendário de meses do ano atual
WITH Calendario AS (
    SELECT DATEFROMPARTS(YEAR(GETDATE()), numero, 1) AS Mes
    FROM (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12)) AS M(numero)
),

-- Soma receitas por mês da tabela Entradas
ReceitasPorMes AS (
    SELECT
        DATEFROMPARTS(YEAR(Data), MONTH(Data), 1) AS Mes,
        SUM(Valor) AS Receita
    FROM Entradas
    GROUP BY DATEFROMPARTS(YEAR(Data), MONTH(Data), 1)
)

-- Junta os meses com ou sem dados
SELECT 
    FORMAT(C.Mes, 'MMMM', 'pt-BR') AS NomeMes,
    C.Mes,
    ISNULL(R.Receita, 0) AS Receita
FROM Calendario C
LEFT JOIN ReceitasPorMes R ON C.Mes = R.Mes
ORDER BY C.Mes;




select * from Entradas
Select * from Investimentos
Select * from Despesas

-- Cria calendário de meses do ano atual + soma despesas
WITH Calendario AS (
    SELECT DATEFROMPARTS(YEAR(GETDATE()), numero, 1) AS Mes
    FROM (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12)) AS M(numero)
),
DespesasPorMes AS (
    SELECT
        DATEFROMPARTS(YEAR(Data), MONTH(Data), 1) AS Mes,
        SUM(Valor) AS Despesa
    FROM Despesas
    GROUP BY DATEFROMPARTS(YEAR(Data), MONTH(Data), 1)
)
SELECT 
    FORMAT(C.Mes, 'MMMM', 'pt-BR') AS NomeMes,
    C.Mes,
    ISNULL(D.Despesa, 0) AS Despesa
FROM Calendario C
LEFT JOIN DespesasPorMes D ON C.Mes = D.Mes
ORDER BY C.Mes;

update Despesas set valor = 80 where id = 2
Select * from Despesas
update Despesas set Data = '2025-07-02' where id =2