# Banco de Investimentos SQL 🏦

![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)


## 🧠 Modelagem Lógica

**Tabelas Principais:**

- **Investidores**: Armazena os dados de pessoas físicas com CPF, nome, e-mail, telefone e endereço.
- **Instituições**: Contém CNPJ, nome da instituição, tipo (ex: banco, corretora) e contato.
- **Tipos_Investimento**: Classifica os produtos por nome, descrição e nível de risco.
- **Carteiras**: Cada investidor pode possuir uma ou mais carteiras. Ligação com Investidores.
- **Investimentos**: Ligação entre carteiras, tipos de investimento e instituições.
- **Transações**: Registra movimentações financeiras por tipo (depósito, compra, rendimento...).
- **Usuários**: Controle de acesso com hash de senha/email e perfil (admin, gerente, investidor).

**Relacionamentos:**

- Um **Investidor** → pode ter várias **Carteiras**
- Uma **Carteira** → pode conter vários **Investimentos**
- Cada **Investimento** → pertence a uma **Instituição** e um **Tipo**
- As **Transações** → se relacionam a um único **Investimento**
- A tabela **Usuários** permite controle e auditoria dos acessos, inclusive com views exclusivas para o papel 'gerente'.

## 🛡️ Segurança
- As senhas e e-mails são armazenados com hash.
- Perfis de acesso com `CHECK` no papel.
- View `Vw_Gerente_Carteiras` exibe carteiras apenas se houver usuário gerente.
- Simulação de ataques `SQL Injection` para estudo e mitigação.

## 📊 Consultas Disponíveis
- Relatórios gerais de carteiras, investimentos e movimentações
- Relatórios analíticos para cálculos de saldo, rentabilidade e comportamento de investidores

## 🏗️ Como Rodar
1. Clone o repositório:
```bash
git clone https://github.com/cali-arena/banco-investimentos-sqlite.git
cd banco-investimentos-sqlite


   ** 👥 Time de Desenvolvimento**
Lucas Cabral

Amanda Rodrigues

Klauber Barros

Fernando Aureliano

Lucas Santana
