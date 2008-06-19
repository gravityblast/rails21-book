## ActiveSupport::CoreExtensions::Date::Calculations

### Time#end\_of\_day

Restituisce la data corrente con l'ora impostata alle 11:59:59 PM.

### Time#end\_of\_week

Restituisce la fine della settimana (domenica 11:59:59 PM).

### Time#end\_of\_quarter

Restituisce un oggetto Date rappresentante la fine del trimestre. In altre parole, restituisce l'ultimo giorno di marzo, giugno, settembre o dicembre, a seconda della data corrente.

### Time#end\_of\_year

Restituisce il 31 dicembre alle 11:59:59 PM.

### Time#in\_time\_zone

Questo metodo è simile a **Time#localtime**, ad eccezione del fatto che utilizza **Time.zone** al posto del timezone del sistema operativo sottostante. Potete passare come parametro indifferentemente **TimeZone** o **String**. Osserviamo qualche esempio:

	Time.zone = 'Hawaii'
	Time.utc(2000).in_time_zone
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00

	Time.utc(2000).in_time_zone('Alaska')
	# => Fri, 31 Dec 1999 15:00:00 AKST -09:00

### Time#days\_in\_month

E' stato risolto un bug nel metodo **days\_in\_month**, il quale restituiva un numero errato di giorni per il mese di febbraio qualora l'anno non fosse specificato.

I cambiamenti comprendono il fatto di considerare l'anno corrente come valore di default laddove nessun valore venga specificato per l'anno nella chiamata dei metodi. Supponete di trovarvi in un anno bisestile. Osservate il seguente esempio:

	Loading development environment (Rails 2.0.2)
	>> Time.days_in_month(2)
	=> 28

	Loading development environment (Rails 2.1.0)
	>> Time.days_in_month(2)
	=> 29

### DateTime#to_f

La classe **DateTime** ha ricevuto un nuovo metodo, **to_f**, che restituisce la data come un tipo float, rappresentante il numero di secondi dall'istante Unix epoch (numero di secondi dalla mezzanotte del 1 gennaio 1970).

### Date.current

La classe **Date** ha ricevuto un nuovo metodo chiamato **current**, che deve essere utilizzato al posto di **Date.today**, poiché tiene conto del timezone impostato in **config.time\_zone** nel caso in cui sia stato impostato. Se così non fosse, restituisce **Date.today**.
