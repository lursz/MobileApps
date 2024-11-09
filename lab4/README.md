# Programowanie Urządzeń Mobilnych

# Laboratorium 5: edycja i dodawanie rekordów
## Wprowadzenie
Podczas tego laboratorium rozbudujemy naszą aplikację o funkcję edycji danych. Celem
 jest stworzenie interfejsu, który umożliwia użytkownikom przeglądanie i modyfikowanie
 szczegółów istniejących zadań oraz dodawanie nowych. Efektem dzisiejszego laboratorium
 będzie w pełni funkcjonalna aplikacja ToDo.

## Przygotowanie
Utwórz w swojej grupie projekt o ścieżce lab4, podobnie jak na poprzednich laboratoriach.
 Umieść w nim komponenty opracowane wcześniej.


 ## Zadania
 ### 1. Widok szczegółów
 Utwórz widok szczegółów zadania (to do) umożliwiający edycję jego wszystkich atry
butów.
 Pamiętaj o użyciu kontrolek odpowiednich dla typów danych poszczególnych pól
 (TextField, TextEditor, DatePicker, Picker) oraz ich odpowiedniej konfiguracji.
 Widok powinien być jak najbardziej ergonomiczny i zapewniać wygodną edycję
 rekordów.

### 2. Edycja istniejących zadań
 Połącz utworzony widok szczegółów ze swoją aplikacją tak, aby użytkownik był przenos
zony do niego po dotknięciu istniejącego zadania, a wprowadzone zmiany były nanoszone
 w modelu danych.
 Aplikacja powinna też pozwolić na usuwanie zadań– umożliwimy to poprzez dodanie
 modyfikatora [onDelete](https://developer.apple.com/documentation/swiftui/dynamicviewcontent/ondelete(perform:)) oraz odpowiedniej funkcji obsługującej samo usunięcie. Może
 też przydać się [przycisk edycji](https://developer.apple.com/documentation/swiftui/editbutton) w górnej belce.

 ### 3. Tworzenie nowego zadania
Wykorzystaj ponownie utworzony wcześniej widok szczegółów przy dodawaniu nowego
 zadania (to do).


 Widok powinien pojawiać się w postaci płachty ([sheet](https://developer.apple.com/documentation/swiftui/view/sheet(ispresented:ondismiss:content:))) i w odróżnieniu od widoku edycji
 mieć przyciski do zapisania lub anulowania w górnej części.
