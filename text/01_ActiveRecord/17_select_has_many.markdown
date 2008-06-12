## Opzione :select in has\_one e belongs\_to

I ben noti metodi **has\_one** e **belongs\_to** ricevono una nuova opzione: **:select**.

Il suo valore di default è "\*" (come in "SELECT * FROM table"), ma potete modificarlo per recuperare solo i valori delle colonne che vi interessano.

Non dimenticate di includere le **primary keys** e **foreign keys**, altrimenti otterreste un errore.

Il metodo **belongs_to** non ha più l'opzione **:order**. Ma non vi preoccupate, poiché non era realmente utilizzata.
