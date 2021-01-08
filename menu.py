from database import database
import sys


class menu:
    def __init__(self):
        self.database = database()

    def show_table_content_menu(self):
        res = self.database.get_table_names()
        if res:
            print("Wpisz numer tabeli do wypisania")
            try:
                choice = int(input())
            except:
                print("Błąd")
                return
            else:
                if choice >= 0 and choice <= len(res)-1:
                    self.database.print_table(res[choice][0])
                    return
                else:
                    print("Wybrano złą opcje!")
                    return;
        else:
            print("W bazie danych nie ma żadnych tabel!")

    def add_content_menu(self):
        res = self.database.get_table_names()
        if res:
            print("Wpisz numer tabeli do której chcesz wpisać informacje")
            try:
                choice = int(input())
            except:
                print("Błąd")
                return
            else:
                if choice >= 0 and choice <= len(res)-1:
                    self.database.table_input(res[choice][0])
                    return
                else:
                    print("Wybrano złą opcje!")
                    return;
        else:
            print("W bazie danych nie ma żadnych tabel!")

    def delete_content_menu(self):
        res = self.database.get_table_names()
        if res:
            print("Wpisz numer tabeli z której chcesz usunąć daną")
            try:
                choice = int(input())
            except:
                print("Błąd")
                return
            else:
                if choice >= 0 and choice <= len(res)-1:
                    choice1 = choice
                    res1 = self.database.print_table(res[choice][0])
                    print("Wpisz numer wiersza który chcesz usunąć")
                    try:
                        choice = int(input())
                    except:
                        print("Błąd!")
                        return
                    else:
                        if choice >= 0 and choice <= len(res1)-1:
                            header = self.database.get_id_header(res[choice1][0])
                            self.database.delete_row_from_table(res[choice1][0], header, res1[choice][0])  
                        else:
                            print("Wybrano zła opcje!")
                            return;
                else:
                    print("Wybrano złą opcje!")
                    return;

    def show_views_menu(self):
        res = self.database.get_views_names();
        if(res):
            print("Wpisz numer widoku do wyświetlenia:")
            try:
                choice = int(input())
            except:
                print("Błąd")
                return
            else:
                if choice >= 0 and choice <= len(res)-1:
                    self.database.print_view(res[0][choice])

    def print_menu(self):
        while True:
            print("//MENU//")
            print("0. Wyjdź z programu")
            print("1. Wyświetl zawartość tabel")
            print("2. Dodaj rekord do tabeli")
            print("3. Usun rekord z tabeli")
            print("4. Pokaż dostępne widoki")
            print("5. Pokaż dostępne kursory")

            try:
                choice = int(input())
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
                    print("KURSORY")
                else:
                    print("Wybrałeś złą opcje, spróbuj ponownie!")
