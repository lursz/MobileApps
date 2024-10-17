# Programowanie Urządzeń Mobilnych

# Laboratorium 3: przekazywanie danych
## Wprowadzenie
 Na dzisiejszym laboratorium powiążemy przygotowane wcześniej elementy interfejsu
 użytkownika naszej aplikacji i nieco go rozbudujemy.
 Pamiętaj o stosowanu odpowiednich konwencji nazewnictwa plików oraz elementów
 programu.
## Przygotowanie
Utwórz w swojej grupie projekt o ścieżce lab2, podobnie jak na pierwszym laboratorium.
 Umieść w nim komponenty opracowane wcześniej.


 ## Zadania
 ### Źródło prawdy
Utwórz tablicę struktur ToDo, która będzie stanowiła źródło prawdy (ang. single source
 of truth) Twojej aplikacji. Wybierz odpowiednie miejsce do jej utworzenia i dodaj
 odpowiednie adnotacje tak, aby widoki mogły z niej korzystać.

### Widok listy zadań
 Utwórz widok listy zadań, który będzie wyświetlał utworzone wcześniej karty zadań w
 postaci przewijalnej listy. Widok powinien być zdefiniowany jako reużywalny komponent,
 ponieważ będzie wykorzystywany w trzech zakładkach aplikacji.
 Umieść widok listy w zakładce „Wszystkie” swojej aplikacji i skonfiguruj go tak, aby
 wyświetlał wszystkie elementy znajdujące się w źródle prawdy.
Lista elementów do wyświetlenia powinna być przekazywana do widoku jako dowiązanie
 (binding), a więc jej definicja powinna wyglądać mniej więcej tak:
 ```swift
 @Binding var toDos: [ToDo]
 ```
 Skonfiguruj podgląd (#Preview) samej listy tak, aby wykorzystywane wtedy były
 przykładowe, stałe dane. Skorzystaj przy tym z konstrukcji Binding.constant. Możesz
 użyć skrótowej notacji .constant, np.:
 ```Swift
  #Preview {
 ToDoListView(toDos: .constant([
 ToDo(...)
 ToDo(...)
 (...)
 ]))
 }
 ```

 ### Aktualizacja zakładki z podsumowaniem
 Zaktualizuj zakładkę „Podsumowanie” tak, aby wyświetlane były wartości zgodne z
 rzeczywistością.
 Aby zliczyć elementy tablicy spełniające określone wymagania możesz skorzystać z funkcji
 `Array.filter`.

### Zakładki z zadaniami zaplanowanymi i zaległymi
 Wykorzystując widok listy zadań z zadania 2, stwórz brakujące widoki zadań
 zaplanowanych oraz zaległych.
 Wykorzystaj filtrowanie z zadania 3, by wyświetlać elementy tablicy spełniające określone
 wymagania.