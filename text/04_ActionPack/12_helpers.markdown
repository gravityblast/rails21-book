## Accessing Helpers outside Views

Quante volte hai creato un **helper** e hai voluto usarlo all'interno dei tuoi **controller**? Per fare ciò, dovevamo includere l'**helper**  all'interno del controller, ma questo sporcava il tuo codice.

Per Rails 2.1 è stato sviluppato un proxy per accedere agli helper fuori dalle view. Funziona in modo molto semplice:

 	# Per accedere al metodo simple_format, per esempio:
	ApplicationController.helpers.simple_format(text)

Semplice e pulito!
