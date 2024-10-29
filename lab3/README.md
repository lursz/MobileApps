# Programowanie Urządzeń Mobilnych

# Laboratorium 4: persystencja i nawigacja
## Wprowadzenie
Na dzisiejszym laboratorium rozbudujemy naszą aplikację o persystencję danych z
 wykorzystaniem SwiftData i dodamy nawigację między widokami. Uzupełnimy również
 widok pojedynczej karty zadania o checkbox, na który przygotowaliśmy miejsce już w
 pierwszym etapie powstawania aplikacji.

## Przygotowanie
Utwórz w swojej grupie projekt o ścieżce lab3, podobnie jak na pierwszym laboratorium.
 Umieść w nim komponenty opracowane wcześniej.


 ## Zadania
 ### Persystencja
 Zmodyfikuj swój projekt tak, aby dane przechowywane były w sposób trwały, przy
 pomocy frameworku [SwiftData](https://developer.apple.com/documentation/swiftdata).  
 Wtym celu będziesz musiał(a):
 - wodpowiednich plikach zaimportować moduł SwiftData,
 - przekształcić strukturę stanowiącą model danych w klasę i oznaczyć ją jako [element
 modelu danych](https://developer.apple.com/documentation/swiftdata/model()),
 - ustawić kontener modelu dla sceny aplikacji– co również spowoduje dodanie do
 środowiska aplikacji kontekstu modelu,
 - wodpowiednich widokach stworzyć własność context, czerpiącą odpowiedni zasób
 ze środowiska aplikacji.


 Pamiętaj że po uruchomieniu aplikacji model danych będzie pusty. Możesz go łatwo
 wypełnić przykładowymi rekordami (instancjami ToDo) korzystając z metody task, która
 powoduje wykonanie kodu tuż przed wyświetleniem widoku do którego jest podłączona,
 np.:
 ```swift
 List(todos) { todo in
 ...
 }
 .task {
 context.insert(Todo(...))
 context.insert(Todo(...))
 }
 ```

### Nawigacja
 Do nawigacji w częściach naszej aplikacji prezentujących wykorzystamy prezentowany
 na wykładzie mechanizm [NavigationSplitView](https://developer.apple.com/documentation/swiftui/navigationsplitview). Dla przypomnienia: jest to wzorzec,
 który zawiera widok główny (np. listę elementów– master) oraz widok szczegółów (np.
 szczegóły wybranego elementu– detail)1. W zależności od urządenia (rozmiaru oraz
 orientacji jego ekranu), widok master może być wyświetlany zamiennie z widokiem detail,
 ale może też pojawiać się na pasku po lewej stronie– chowanym lub widocznym cały czas.
 iOS dokonuje takiego wyboru automatycznie i nasza aplikacja będzie wyglądała dobrze
 na różnych urządzeniach, minimalnym nakładem pracy, pod warunkiem że postępujemy
 zgodnie z założeniami tych narzędzi.
 Zmodyfikuj swoje widoki list tak, aby korzystały z wspomnianego wzorca. Na widoku
 szczegółów powinien pojawiać się– na razie– tylko wycentrowany tytuł zadania
 (ToDo.title). Pamiętaj o widoku szczegółów wyświetlanym gdy nie jest wybrana żadna
 opcja, a ekran urządzenia wymaga jego wyświetlania cały czas!
 Na górze listy powinien być wyświetlany tytuł (navigationTitle) odpowiedni do tego
 którą listę oglądamy (wszystkie, zaległe, itd.). W widoku szczegółów tytuł powinien być
 ogólny („Zadanie”), i zawsze wyświetlany w górnej belce.

 ### Dodawanie rekordu
Wwidoku listy dodaj na górnej belce (toolbar) przycisk „+” (ToolbarItem), który
 dodaje nowe zadanie. W tej chwili podłącz do niego minimalną logikę, która tworzy nowe
 zadanie o tytule „Nowe zadanie”.


 Zależnie od tego w której zakładce jesteśmy, nowe zadanie powinno:
 - nie mieć ustawionych żadnych dat (zakładka „Wszystkie”),
- mieć ustawioną planowaną datę wykonania na jutro (zakładka „Zaplanowane”),
 - mieć ustawiony termin wykonania (deadline) na przedwczoraj (zakładka „Zaległe”).


### Checkbox
By dodać do widoku pojedynczej karty zadania checkbox, który pozwoli na oznaczanie
 zadania jako wykonane, dodaj nową strukturę CheckBoxView, która jako parametr
 przyjmie jedną zmienną typu Bool- pole wchodzące w skład struktury ToDo. Za
wartość widoku ustaw na ikonę z katalogu Symbols w Bibliotece (Library) Xcode, na
 przykład checkmark.square.fill dla zadania wykonanego i square dla zadania niewyko
nanego.

 W widoku pojedynczej karty zadania uczyń checkbox klikalnym, dodając metodę
 `.onTapGesture.`