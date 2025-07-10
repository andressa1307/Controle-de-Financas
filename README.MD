# 💰 Dashboard de Finanças Pessoais com Power BI

Este projeto é um dashboard de **controle financeiro pessoal** desenvolvido no **Power BI**, utilizando dados de entradas (receitas), despesas e investimentos. Ele permite **acompanhar o saldo mensal, gastos por categoria, evolução das receitas e despesas ao longo do ano**, entre outras análises visuais.

## 📊 Visão Geral do Projeto

O objetivo é ajudar qualquer pessoa a organizar suas finanças pessoais de forma simples, visual e eficiente. O projeto foi construído com base em uma estrutura de dados SQL e conectado diretamente ao Power BI para visualização dinâmica.

<img src="./imagens/controle-de-financas.png" alt="Dashboard de Finanças" width="800"/>

> 📍 *A imagem acima mostra o dashboard principal com cartão de saldo estilizado com fundo ondulado personalizado.*

## 🔧 Tecnologias Utilizadas

- **Power BI**
- **SQL Server** (estrutura de dados)
- **DAX** (para medidas personalizadas)
- **Power Query** (transformação de dados)

---

## 🗃️ Estrutura de Dados

O projeto utiliza três tabelas principais:

- `Entradas`: dados de receitas (ex: salário, renda extra)
- `Despesas`: dados de gastos categorizados
- `Investimentos`: valores destinados a aplicações financeiras

Exemplo de comandos SQL usados para criar as tabelas:

```sql
CREATE TABLE Entradas (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Data DATE NOT NULL,
  Tipo VARCHAR(50),
  Valor DECIMAL(10,2) NOT NULL
);
