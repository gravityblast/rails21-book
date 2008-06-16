## Tasks

### rails:update

D'ora in poi quando lanciamo il task **rake rails:freeze:edge** verrà eseguito anche **rails:update**,
che aggiorna i file di configurazione e *JavaScripts*.

### Database in 127.0.0.1

A change was made in the file databases.rake that used to look only in localhost for local databases, it will now also consider the IP **127.0.0.1**. This works for both **create** and **drop** tasks. The databases.rake file was also refactored to make the code less repetitive.

### Fare il freeze di una versione specifica di Rails.

Antecedentemente a Rails 2.1 non era possibile fare il freeze di uno specifico rilascio di Rails all'interno del proprio progetto, si poteva solo usare la revisione come un parametro. In Rails 2.1, possiamo fare il freeze di uno specifico rilascio usando il comando seguente: 

	rake rails:freeze:edge RELEASE=1.2.0

## TimeZone

#### rake time:zones:all

Ritorna tutte le time zones conosciute da rails, raggruppate per offset. Si può anche filtrare il risultato usando un parametro opzionale OFFSET, ad esempio OFFSET=-6.

#### rake time:zones:us

Visualizza la lista di tutti le fusi time zones relative a US. L'opzione OFFSET è valida.

#### rake time:zones:local

Ritorna tutte le time zones conosciute da Rails che hanno lo stesso offset del tuo SO.
