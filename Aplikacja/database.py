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
        elif (data_type.name == 'DB_TYPE_DATE'):
            return f'TO_DATE(\'{data}\',\'yyyy/mm/dd\')'

    def print_table(self, table):
        cur = self.connection.cursor()
        try:
            cur.execute(f'select * from {table}')
        except db.Error as error:
            print(f'Błąd! {error}')
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

    def get_views_names(self):
        cur = self.connection.cursor()
        try:
            cur.execute("select view_name from user_views")
        except db.Error as error:
            print(f'Błąd! {error}')
        else:
            res = cur.fetchall()
            if len(res) != 0:
                for i, row in enumerate(res):
                    print(f'{i}. {row[0]}')
            else:
                print("Nie ma żadnych widoków!")
        finally:
            cur.close()
            return res

    def get_cursors_names(self):
        cur = self.connection.cursor()
        try:
            cur.execute("select object_name from USER_PROCEDURES where object_type in ('PROCEDURE')")
        except db.Error as error:
            print(f'Błąd! {error}')
        else:
            res = cur.fetchall()
            if len(res) != 0:
                for i, row in enumerate(res):
                    print(f'{i}. {row[0]}')
            else:
                print("Nie ma żadnych kursorów!")
        finally:
            cur.close()
            return res

    def dbms_lines(self):
        cur = self.connection.cursor()
        cur.callproc("dbms_output.enable")
        status = cur.var( db.NUMBER)
        line   = cur.var( db.STRING)
        while True:
            cur.callproc( "DBMS_OUTPUT.GET_LINE", (line, status))
            if status.getvalue() != 0:
                break
            print(line.getvalue())
        cur.close()

    def print_cursor(self, cursor):
        cur = self.connection.cursor()
        try:
            sqlCommand = f'call {cursor}()'
            cur.execute(sqlCommand)
            self.connection.commit()
        except db.Error as error:
            print(f'Błąd! {error}')
        else:
            self.dbms_lines()
        finally:
            cur.close()

    def print_view(self, view):
        cur = self.connection.cursor()
        try:
            cur.execute(f'select * from {view}')
        except db.Error as error:
            print(f'Błąd! {error}')
        else:
            res = cur.fetchall()
            if len(res) != 0:
                for i,row in enumerate(res):
                    print(f'{i}. {row}')
        finally:
            cur.close()

    def get_triggers_names(self):
        cur = self.connection.cursor()
        try:
            cur.execute("select object_name from USER_PROCEDURES where object_type in ('TRIGGER')")
        except db.Error as error:
            print(f'Błąd! {error}')
        else:
            res = cur.fetchall()
            if len(res) != 0:
                for i, row in enumerate(res):
                    print(f'{i}. {row[0]}')
            else:
                print("Nie ma żadnych wyzwalaczy!")
        finally:
            cur.close()


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
        print("format daty : yyyy/mm/dd")
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
            self.connection.commit()
        except db.Error as error:
            print(f'Błąd: {error}')
        else:
            print("Udało się usunąć dane!")
        finally:
            cur.close();
