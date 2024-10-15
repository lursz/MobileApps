# Todo App

# Laboratorium 2: SwiftUI
## Wprowadzenie
 Na dzisiejszym laboratorium przygotujemy elementy interfejsu użytkownika oraz modelu
 danych aplikacji służącej do zarządzania listą rzeczy do zrobienia (ang. to-do list).
 Tworzone widoki powinny korzystać wyłącznie z kolorów zdefiniowanych w katalogu
 zasobów aplikacji, a sama aplikacja powinna mieć poprawny i estetyczny wygląd zarówno
 w jasnym, jak i ciemnym trybie ekranu. W aplikacji Simulator możesz przełączać
 urządzenie między trybami przy pomocy opcji menu Features > Toggle Appearance (lub
 odpowiedniego skrótu klawiszowego).
 Pamiętaj o stosowanu odpowiednich konwencji nazewnictwa plików oraz elementów
 programu.
 1
## Przygotowanie
 Utwórz projekt Xcode, pamiętając o:
 - wybraniu wyłącznie iOS jako platformę docelową,
 - wybraniu odpowiedniej nazwy produktu w konwencji camelCase,
 - oraz odpowiedniego identyfikatora organizacji w odwróconym zapisie domenowym.
 Nie wybieraj żadnego mechanizmu przechowywania danych ani testów jednostkowych.
 Wkatedralnym systemie GitLab znajdziesz swoją osobistą grupę do tworzenia repozy
toriów na wyniki wykonania ćwiczeń laboratoryjnych.
 Utwórz w tej grupie projekt o ścieżce lab1. Kod aplikacji powinien znaleźć się w
 repozytorium tego projektu. W głównym katalogu repozytorium powinien znaleźć się
 plik o rozszerzeniu .xcodeproj1, a pozostałe pliki powinny być zorganizowane w sposób
 przyjęty dla projektów Xcode.
 Uwaga: Wszystkie czynności związane z systemem kontroli wersji Git możesz wykonać
 z poziomu Xcode. Nie jest to oczywiście jedyny sposób, ale tak będzie najszybciej i
 najłatwiej. W tym celu wykonaj poniższe kroki.
1. Na komputerach w laboratorium wygodniej będzie skorzystać z dostępu HTTPS
 niż SSH, potrzebny więc będzie token dostępowy. W panelu Preferences swojego
 konta GitLab wybierz zakładkę Access Tokens i utwórz nowy token posiadający co
 najmniej uprawnienia:
- `api`, aby mógł tworzyć repozytoria,
- `read_repository`,
- oraz `write_repository`.
2. Skopiuj token do schowka i ewentualnie zapisz. Jest on wyświetlany tylko raz, po
 utworzeniu!
3. Wejdź do preferencji Xcode i w zakładce Accounts utwórz nowe konto typu GitLab
 self-hosted:
4. Wswoim projekcie, wejdź do drugiej od lewej zakładki nawigatorów (Source Control
 navigator), w niej wybierz zakładkę Repositories i w sekcji Remotes wybierz New
 (...) remote.... 

Pamiętaj aby:
 - jako właściciela (Owner) wybrać utworzoną dla Ciebie grupę (np. PUM 2024– Jan Kowalski),
 - projekt ustawić jako prywatny (Private).


 ## Zadania
 ### Model danych
 Utwórz strukturę o nazwie ToDo, modelującej pojedyncze zadanie. Model powinien
 zawierać następujące pola:
 - tytuł,
 - opis (może być nil),
 - priorytet (wysoki/normalny/niski)– wraz z definicją odpowiedniego enumeracyjnego
 typu danych,
 - planowana data wykonania– jako odpowiedni typ danych (może być nil),
 - termin (deadline)– jako odpowiedni typ danych (może być nil).

### Widok pojedynczej karty zadania
 Utwórz widok pojedynczej karty zadania, która będzie używana do wyświetlania zadań
 na liście. Karta powinna zawierać:
 - miejsce na checkbox służący do oznaczania wykonania zadania (samą kontrokę
 dodamy na kolejnych zajęciach),
 - tytuł zadania,
 - oznaczenie kolorem priorytetu zadania– moze to być np. element ramki lub kropka
 w odpowiednim kolorze,
 - planowana data wykonania, wskazywana jako „dziś”, „jutro”, „pojutrze” lub, w
 pozostałych przypadkach, krótka data składająca się z dnia i miesiąca (np. „12
 marca”) oraz dodatkowo roku, jeżeli data nie jest w bieżącym roku (np. „15 maja
 2025”),
 - liczba dni pozostałych do terminu (deadline), lub liczba dni o którą go przekroczono.
 Zdefiniuj w katalogu zasobów aplikacji 3 kolory reprezentujące priorytet zadania
 (wysoki/normalny/niski).
 Skonfiguruj strukturę tak, aby miała zmienną (typu ToDo) reprezentującą treść zadania.
 Widok powinien wyświetlać dane z tej struktury. Ustaw odpowiednio sekcję podglądu
 (#Preview) tak, aby wyświetlane było przykładowe zadanie.
 ### Widok podsumowania
 Utwórz widok podsumowania, które będzie pokazywało liczbę zadań w poszczególnych
 kategoriach. W tym widoku umieść wyłącznie treści statyczne.
 Na górze widoku powinien pojawić się estetyczny napis tytułowy „Podsumowanie”.
 Poniżej umieść 3 zaokrąglone prostokąty wskazujące:
 - liczbę zadań nadchodzących (czyli takich, które mają zaplanowaną datę wykonania),
 - liczbę zadań zaległych (czyli takich które mają przekroczony deadline)– która
 powinna być oznaczona odpowiednim kolorem (np. czerwonym),
 - liczbę zadań z każdym z priorytetów, przy czym priorytety powinny być oznaczone
 kolorem.
 Ramki powinny mieć odpowiedni kolor tła oraz przezroczystość (modyfiktator .opacity).
 Tło całego widoku powinno być gradientem między dwoma kolorami.
 Dodaj do katalogu zasobów:
 - kolor tła ramki,
 - graniczne kolory gradientu,
 - kolor używany do wyświetlania liczby zadań zaległych.

### Widok zakładek
 Widok zakładek będzie głównym widokiem aplikacji. Wykorzystaj widok TabView i
 utwórz na dole 4 zakładki:
 - Podsumowanie,
 - Wszystkie,
 - Zaplanowane,
 - Zaległe.
 Każda zakładka powinna mieć odpowiednią ikonę z katalogu Symbols w Bibliotece
 (Library) Xcode oraz tytuł. Podłącz widok podsumowania jako treść pierwszej zakladki,
 w pozostałych umieść teksty (napisy) jako placeholder.
 Wjednej z zakładek wyświetl statycznie plakietkę (badge) z jakąś liczbą.