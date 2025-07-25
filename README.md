# Banco de Investimentos SQL 🏦



## Visão Geral
Este repositório contém um sistema completo para gestão de carteiras de investimentos em SQLite, com foco em integridade, performance e segurança. Ele permite o gerenciamento de investidores, carteiras, instituições, tipos de investimento, transações e segurança de acesso via perfis.

## 🚀 Estrutura do Projeto
.
├── schema/
│ ├── create_tables.sql
│ ├── views.sql
│ ├── triggers.sql
│ └── indexes.sql
├── data/
│ ├── insert_investidores.sql
│ ├── insert_instituicoes.sql
│ ├── insert_tipos_investimento.sql
│ ├── insert_carteiras.sql
│ ├── insert_transacoes.sql
│ └── insert_usuarios.sql
├── queries/
│ ├── relatorios_gerais.sql
│ └── relatorios_analiticos.sql
├── seguranca/
│ ├── 01_criar_usuarios.sql
│ ├── 02_inserir_usuarios.sql
│ ├── 03_view_gerente.sql
│ ├── 04_sql_injection_exemplo.sql
│ └── seguranca.md
├── LICENSE
└── .gitignore


## 🧠 Modelagem Lógica

**Tabelas Principais:**

- **Investidores** → dados cadastrais do investidor (CPF como chave).
- **Instituições** → bancos, corretoras etc. identificadas por CNPJ.
- **Tipos_Investimento** → nome, descrição e nível de risco.
- **Carteiras** → vinculadas ao investidor; pode ter várias.
- **Investimentos** → relaciona carteira, tipo e instituição.
- **Transações** → movimentações financeiras por tipo (depósito, rendimento etc).
- **Usuários** → controle de acesso com hash e papel (admin, gerente, investidor).

**Relacionamentos:**

- Investidor → Carteiras → Investimentos → Transações  
- Investimentos → Tipo + Instituição  
- Usuários controlam acesso e visualização via view do perfil 'gerente'.

## 🛡️ Segurança e Controle

- Senhas e e-mails armazenados como hash (SHA‑256).
- Perfil de acesso validado com `CHECK` e default `investidor`.
- View `Vw_Gerente_Carteiras` disponível apenas se existir usuário com papel `gerente`.
- Exemplo de SQL injection com instrução segura via aplicação usando placeholders.

## 👥 Equipe e Divisão de Trabalho

Trabalho foi dividido entre duplas, cada uma ficou responsável por partes específicas do projeto:

| Dupla                         | Responsabilidades |
|------------------------------|-------------------|
| Lucas Santana & Amanda Rodrigues | Modelagem de dados, criação de tabelas (`schema/create_tables.sql`) |
| Lucas Santana & Amanda Rodrigues | População de dados (`data/*.sql`) e consultas analíticas (`queries/*.sql`) |
|  Marry & Lucas Cabral | Segurança e controle de acesso (`seguranca/*.sql` e `seguranca.md`) |
| Klauber Barros & Fernando Aureliano | Controle de versão com Git, gerenciamento do repositório no GitHub, além da geração de dashboards em Power BI para visualização de dados das carteiras e investimentos. |


## 📊 Consultas Disponíveis

- Relatórios gerais de carteiras, investimentos e transações.
- Relatórios analíticos com rentabilidade, evolução mensal, top investidores/assets.
- Consultas com `GROUP BY`, `AVG`, `SUM`, `COUNT`, `JOIN`, `DISTINCT`.

## 🏗️ Como Rodar

```bash
git clone https://github.com/cali-arena/banco-investimentos-sqlite.git
cd banco-investimentos-sqlite




👥 Time de Desenvolvimento

Lucas Cabral

Amanda Rodrigues

Klauber Barros

Fernando Aureliano

Lucas Santana

Marry Genez
