# Banco de Investimentos SQL 🏦

![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)

## Visão Geral
Este repositório contém um sistema completo para gestão de carteiras de investimentos em SQLite, com foco em integridade, performance e segurança.

## 🚀 Estrutura do Projeto
.
├── schema/
│   ├── create_tables.sql
│   ├── views.sql
│   ├── triggers.sql
│   └── indexes.sql
├── data/
│   ├── insert_investidores.sql
│   ├── insert_instituicoes.sql
│   ├── insert_tipos_investimento.sql
│   ├── insert_carteiras.sql
│   └── insert_transacoes.sql
├── queries/
│   ├── relatorios_gerais.sql
│   └── relatorios_analiticos.sql
├── seguranca/
│   ├── 01_criar_usuarios.sql
│   ├── 02_inserir_usuarios.sql
│   ├── 03_view_gerente.sql
│   ├── 04_sql_injection_exemplo.sql
│   └── seguranca.md
├── LICENSE
└── .gitignore

## 🏗️ Como Rodar
1. Clone o repositório:
   ```bash
   git clone https://github.com/cali-arena/banco-investimentos-sqlite.git
   cd banco-investimentos-sqlite

   ## 🏗️ Nome do time
   Lucas Cabral
   Amanda Rodrigues
   Klauber Barros
   Fernando Aureliano
   Lucas Santana
