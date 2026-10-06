from conexion.postgres_queries import PostgresQueries

def create_tables(query: str):
    list_of_commands = query.split(";")

    postgres = PostgresQueries(can_write=True)
    postgres.connect()

    for command in list_of_commands:
        command = command.strip()
        if command:
            print(f"Executando comando:\n{command}")
            try:
                postgres.executeDDL(command)
                print("-> Sucesso!\n")
            except Exception as e:
                print(f"-> Aviso/Erro: {e}\n")

    postgres.close()

def inserir_dados(query: str, sep:str = ";"):
    list_of_commands = query.split(sep)

    postgres = PostgresQueries(can_write=True)
    postgres.connect()

    for command in list_of_commands:
        command = command.strip()
        if len(command) > 0:
            print(command)
            postgres.write(command)
            print("-> Sucesso!\n")

    postgres.close() 

def run():
    with open("01_ddl/criar_tabelas.sql", "r", encoding="utf-8") as f:
        query_create = f.read()

    print("Iniciando a criação das tabelas...")
    create_tables(query=query_create)
    print("Processo finalizado!")


    with open("02_dml/dados_iniciais.sql", "r", encoding="utf-8") as f:
        query_insert = f.read()

    print("Iniciando a inserção de dados...")
    inserir_dados(query=query_insert)
    print("Processo finalizado!")




if __name__ == "__main__":
    run()

            