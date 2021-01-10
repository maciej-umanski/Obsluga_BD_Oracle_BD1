import cx_Oracle as db
import sys
import config


class database:
    def __init__(self):
        connection = None
        db.init_oracle_client(lib_dir=config.lib_dir)
        dsnStr = db.makedsn(config.path, config.port, config.SID)

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

    def print_table(self, table):
        cur = self.connection.cursor()
        try:
            cur.execute(f'select * from {table}')
<<<<<<< Updated upstream
        except:
            print("Błąd!")
=======
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
            cur.execute("select object_name from USER_PROCEDURES")
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
    status = cur.var( cx_Oracle.NUMBER)
    line   = cur.var( cx_Oracle.STRING)

    lines = []
    while True:
        cur.callproc( 'DBMS_OUTPUT.GET_LINE', (line, status))
        if status.getvalue() == 0:
            lines.append( line.getvalue())
        else:
            break
    return lines
    
    def print_cursor(self, cursor):
        cur = self.connection.cursor()
        try:
            sqlCommand = f'call {cursor}'
            cur.execute(sqlCommand)
            print(sqlCommand)
            self.connection.commit()
        except db.Error as error:
            print(f'Błąd! {error}')
        else:
            for line in dbms_lines(self):
        log.debug( line)
        finally:
            cur.close()
    
    def print_view(self, view):
        cur = self.connection.cursor()
        try:
            cur.execute(f'select * from {view}')
        except db.Error as error:
            print(f'Błąd! {error}')
>>>>>>> Stashed changes
        else:
            res = cur.fetchall()
            for row in res:
                print(row)

    def get_table_names(self):
        cur = self.connection.cursor()
        cur.execute("select table_name from user_tables")
        res = cur.fetchall()
        for index, row in enumerate(res):
            print(f'{index}. {row[0]}')
        return res
