from database import database
import sys


class menu:
    def __init__(self):
        self.database = database()

    def show_table_content_menu(self):
        res = self.database.get_table_names()
        print("Wpisz numer tabeli do wypisania")
        while True:
            try:
                choice = int(input())
            except:
                print("Błąd")
                return
            else:
                self.database.print_table(res[0][choice])
                return

    def print_menu(self):
        while True:
            print("//MENU//")
            print("0. Wyjdź z programu")
            print("1. Wyświetl zawartość tabel")

            try:
                self.choice = int(input())
            except:
                print("Błąd!")
            else:
                if self.choice == 0:
                    sys.exit()
                elif self.choice == 1:
                    self.show_table_content_menu()
                else:
                    print("Wybrałeś złą opcje, spróbuj ponownie!")
