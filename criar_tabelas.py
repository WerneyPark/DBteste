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

def run():
    with open("01_ddl/criar_tabelas.sql", "r", encoding="utf-8") as f:
        query_create = f.read()

    print("Iniciando a criação das tabelas...")
    create_tables(query=query_create)
    print("Processo finalizado!")

if __name__ == "__main__":
    run()

            