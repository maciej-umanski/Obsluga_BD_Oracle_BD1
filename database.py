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
        except:
            print("Błąd!")
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
