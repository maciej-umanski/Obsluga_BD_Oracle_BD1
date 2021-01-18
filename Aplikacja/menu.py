from database import database
import sys


class menu:
    def __init__(self):
        self.database = database()

    def show_table_content_menu(self):
        print("")
        res = self.database.get_table_names()
        if res:
            try:
                choice = int(input("\nWpisz numer tabeli do wypisania: "))
            except:
                print("Błąd")
                return
            else:
                if choice >= 0 and choice <= len(res)-1:
                    print("")
                    self.database.print_table(res[choice][0])
                    return
                else:
                    print("Wybrano złą opcje!")
                    return;
        else:
            print("W bazie danych nie ma żadnych tabel!")

    def show_cursors_menu(self):
        print("")
        res = self.database.get_cursors_names();
        if(res):
            try:
                choice = int(input("\nWpisz numer kursora do wyświetlenia: "))
            except:
                print("Błąd")
                return
            else:
                if choice >= 0 and choice <= len(res)-1:
                    print("")
                    self.database.print_cursor(res[choice][0])

    def add_content_menu(self):
        print("")
        res = self.database.get_table_names()
        if res:
            try:
                choice = int(input("\nWpisz numer tabeli do której chcesz wpisać informacje: "))
            except:
                print("Błąd")
                return
            else:
                if choice >= 0 and choice <= len(res)-1:
                    self.database.table_input(res[choice][0])
                    return
                else:
                    print("Wybrano złą opcje!")
                    return
        else:
            print("W bazie danych nie ma żadnych tabel!")

    def delete_content_menu(self):
        print("")
        res = self.database.get_table_names()
        if res:
            try:
                choice = int(input("\nWpisz numer tabeli z której chcesz usunąć daną: "))
            except:
                print("Błąd")
                return
            else:
                if choice >= 0 and choice <= len(res)-1:
                    choice1 = choice
                    res1 = self.database.print_table(res[choice][0])
                    try:
                        choice = int(input("Wpisz numer wiersza który chcesz usunąć: "))
                    except:
                        print("Błąd!")
                        return
                    else:
                        if choice >= 0 and choice <= len(res1)-1:
                            header = self.database.get_id_header(res[choice1][0])
                            self.database.delete_row_from_table(res[choice1][0], header, res1[choice][0])
                        else:
                            print("Wybrano zła opcje!")
                            return
                else:
                    print("Wybrano złą opcje!")
                    return

    def show_views_menu(self):
        print("")
        res = self.database.get_views_names();
        if(res):
            try:
                choice = int(input("\nWpisz numer widoku do wyświetlenia: "))
            except:
                print("Błąd")
                return
            else:
                if choice >= 0 and choice <= len(res)-1:
                    print("")
                    self.database.print_view(res[choice][0])

    def print_menu(self):
        while True:
            print("\n//MENU//")
            print("0. Wyjdź z programu")
            print("1. Wyświetl zawartość tabel")
            print("2. Dodaj rekord do tabeli")
            print("3. Usun rekord z tabeli")
            print("4. Pokaż dostępne widoki")
            print("5. Pokaż dostępne kursory")
            print("6. Pokaż dostępne wyzwalacze\n")

            try:
                choice = int(input("Wybierz opcje: "))
            except:
                print("Błąd!")
            else:
                if choice == 0:
                    sys.exit()
                elif choice == 1:
                    self.show_table_content_menu()
                elif choice == 2:
                    self.add_content_menu()
                elif choice == 3:
                    self.delete_content_menu()
                elif choice == 4:
                    self.show_views_menu()
                elif choice == 5:
                    self.show_cursors_menu()
                elif choice == 6:
                    self.database.get_triggers_names()
                else:
                    print("Wybrałeś złą opcje, spróbuj ponownie!")
