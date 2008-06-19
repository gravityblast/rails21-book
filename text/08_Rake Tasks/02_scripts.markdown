## Gli Script

### plugin

Il comando `script/plugin install` adesso consente l'utilizzo dell'opzione `-e/--export`, che rilascia un `svn export`. Aggiunto il supporto per i plugin ospitati su repository GIT.

### dbconsole

Questo script fornisce le stesse funzionalità di `script/console`, ma per il vostro database. In altre parole vi collega ad un client a riga di comando per il vostro database.

Guardando il codice, apparentemente dovrebbe lavorare solo con mysql, postgresql, and sqlite(3). Quando un altro tipo di  database è configurato in `database.yml`, questo script visualizza: "not supported for this database type [nessun supporto per questo tipo di database]"
