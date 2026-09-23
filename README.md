# Estudos de Banco de Dados - FAESA

Repositório dedicado aos estudos práticos de Banco de Dados com **PostgreSQL** e **DBeaver**.

---

## 📁 Estrutura de Pastas

* **`01_ddl/`**: Scripts de definição de dados (DDL - `CREATE TABLE`, `DROP TABLE`, `VIEW`, etc.).
* **`02_dml/`**: Scripts de manipulação de dados (DML - `INSERT`, `UPDATE`, `DELETE`).
* **`03_consultas/`**: Scripts de consultas SQL (`SELECT`, joins, agrupamentos).
* **`04_psql/`**: Scripts específicos para PostgreSQL.
* **`SQL_CODIGOS/`**: Códigos SQL gerais de apoio.
* **`conexion/`**: Classes de conexão com o banco de dados (PostgreSQL e Oracle).
  * `postgres_queries.py`: Gerenciador de conexão e execução para PostgreSQL.
  * `oracle_queries.py`: Gerenciador de conexão original para Oracle.
  * `passphrase/`: Arquivos de credenciais (ignorados pelo Git por segurança).
* **`criar_tabelas.py`**: Script de automação em Python para criação de tabelas e views no PostgreSQL.

---

## 🚀 Como Executar

### 1. Pré-requisitos
* Python 3.10+
* PostgreSQL instalado e rodando (banco padrão configurado: `db_faesa`)
* DBeaver (para visualização dos dados)

### 2. Instalação das dependências
```bash
pip install psycopg2-binary pandas
```

### 3. Configurar Credenciais
Crie o arquivo `conexion/passphrase/authentication.postgres` com o seu usuário e senha:
```text
postgres,sua_senha
```
*(Esse arquivo está protegido pelo `.gitignore` e não sobe para o repositório remoto).*

### 4. Executar criação das tabelas
```bash
python criar_tabelas.py
```
