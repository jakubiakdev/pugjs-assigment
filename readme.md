# Express.js z Pug
Mały szkolny projekt z użyciem Pug.js, Express.js i MySQL

## Architektura

### `/backend`

Jest to RESTowe api łączące się z bazą danych MySQL dające dostęp do uporządkowanych danych w JSONie.

### `/frontend`

Jest to strona internetowa renderowana na serwerze na templateach Pug.js. Strony są routowane przez Express.js, a dane dostarcza backend do serwera frontendu. Klient łączy się jedynie z frontendem, przez co na frontendzie zarządzane są sesje związane z koszykami oraz przekazywanie dalej informacji z formularzy.

## Funkcje projektu
- Strona stylowana z Bootstrap (CDN)
- Layout strony rozdzielony na template i zawartość
- Koszyk z sesjami
- Status zamówienia który się aktualizuje dla użytkownika
- Wczytywanie newsów i menu z bazy danych
- Panel administracyjny z logowaniem
    - Usuwanie zamówień, zmiana ich statusu
- Error handling z własną stroną od błędów

## Wykorzystane technologie
- Node.js
- Express.js
- express-session
- MySQL
- [Pug](https://pugjs.org)
- Bootstrap

## Uruchamianie

1. Uruchom bazę danych MySQL na localhost z użytkownikiem `root` bez hasła (np. XAMPP)
2. Dla obu folderów wykonaj następne polecenia
```sh
npm i 
node index.js
```