import cx_Oracle as db
import sys
import config


class database:
    def __init__(self):
        db.init_oracle_client(lib_dir=config.lib_dir)
        dsnStr = db.makedsn(config.path, config.port, config.SID)
        connection = None

        try:
            print(f'Łączenie się z serwerem : {config.path}, proszę czekać...')
            self.connection = db.connect(
                config.username,
                config.password,
                dsn=dsnStr,
                encoding=config.encoding)
        except db.Error as error:
            print(f'Błąd: {error}, program zostanie zakończony!')
            sys.exit()
        else:
            if connection:
                print("Udało się!")
                print(f'Wersja bazy danych: {self.connection.version}')

    def get_id_header(self, table):
        cur = self.connection.cursor()
        cur.execute(f'select * from {table}')
        headers = [i[0] for i in cur.description]
        cur.close()
        return headers[0]


    def format_data_type(self, data, data_type):
        if (data_type.name == 'DB_TYPE_VARCHAR'):
            return f'\'{data}\''
        elif (data_type.name == 'DB_TYPE_NUMBER'):
            return data

    def print_table(self, table):
        cur = self.connection.cursor()
        try:
            cur.execute(f'select * from {table}')
        except:
            print("Błąd!")
        else:
            res = cur.fetchall()
            if len(res) != 0:
                for i, row in enumerate(res):
                    print(f'{i}. {row}')
            else:
                print("Tabela jest pusta!")
        finally:
            cur.close()
            return res

    def get_table_names(self):
        cur = self.connection.cursor()
        cur.execute("select table_name from user_tables")
        res = cur.fetchall()
        for index, row in enumerate(res):
            print(f'{index}. {row[0]}')
        cur.close()
        return res

    def table_input(self, table):
        cur = self.connection.cursor()
        cur.execute(f'select * from {table}')
        headers = [i[0] for i in cur.description]
        types = [i[1] for i in cur.description]
        print("Wpisuj informacje które chcesz dodać do tabeli:")
        data = [input(f'({types[index].name}){header}: ') for index, header in enumerate(headers)]
        dataStr = ""
        for index, record in enumerate(data):
            if index == 0:
                dataStr += f'({self.format_data_type(record, types[index])},'
            if index is (len(data)-1):
                dataStr += f' {self.format_data_type(record, types[index])})'
            elif index > 0 and index < (len(data)):
                dataStr += f' {self.format_data_type(record, types[index])},'

        headersStr = ""

        for index, header in enumerate(headers):
            if index == 0:
                headersStr += f'({header},'
            if index is (len(data)-1):
                headersStr += f' {header})'
            elif index > 0 and index < (len(data)):
                headersStr += f' {header},'

        sqlCommand = f'insert into {table} {headersStr} values {dataStr}'
        try:
            cur.execute(sqlCommand)
            self.connection.commit()
        except db.Error as error:
            print(f'Błąd: {error}')
        else:
            print("Udało się wprowadzić dane!")
        finally:
            cur.close();

    def delete_row_from_table(self, table, ID_header_name, ID):
        cur = self.connection.cursor()
        try:
            sqlCommand = f'DELETE FROM {table} WHERE {table}.{ID_header_name} = {ID}'
            cur.execute(sqlCommand)
            print(sqlCommand)
            self.connection.commit()
        except db.Error as error:
            print(f'Błąd: {error}')
        else:
            print("Udało się usunąć dane!")
        finally:
            cur.close();



