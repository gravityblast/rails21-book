## TimeZone

### Definire un fuso orario predefinito (timezone)

Al metodo **time\_zone\_select** è stata aggiunta una nuova opzione, ora potete visualizzare un valore predefinito nel caso l'utente non selezioni nessun **TimeZone**, oppure quando la colonna sul database è nulla. Per ottenere questo, è stata introdotta l'opzione **:default** che può essere utilizzata come segue:

	time_zone_select("user", "time_zone", nil, :include_blank => true)
	
	time_zone_select("user", "time_zone", nil, 
		:default => "Pacific Time (US & Canada)" )
	
	time_zone_select( "user", 'time_zone', TimeZone.us_zones, 
		:default => "Pacific Time (US & Canada)")

Nel caso in cui utilizziamo l'opzione **:default**, dovrebbe essere visualizzato il **TimeZone** già selezionato.

### Il metodo formatted_offset

Il metodo **formatted\_offset** è stato incluso nelle classi **Time** e **DateTime**. Questo metodo restituisce la differenza tra il nostro **TimeZone** e UTC, nel formato **+HH:MM**. Ad esempio, se ci troviamo in Brasile, la differenza restituita dal metodo sarà una stringa uguale a **"-03:00″**.

Vediamo alcuni esempi:

Calcolare la differenza da un data (DateTime):

	datetime = DateTime.civil(2000, 1, 1, 0, 0, 0, Rational(-6, 24))
	datetime.formatted_offset         # => "-06:00″
	datetime.formatted_offset(false)  # => "-0600″

Calcolare la differenza da un orario (Time):

	Time.local(2000).formatted_offset         # => "-06:00″
	Time.local(2000).formatted_offset(false)  # => "-0600″

Da notare che questo metodo restituisce una stringa (**string**), che può essere formattata o meno a seconda del valore passato come parametro.

### Il metodo with\_env\_tz

Il metodo **with\_env\_tz** ci consente di scrivere test realtivi a fusi orari differenti con molta semplicità:

	def test_local_offset
	  with_env_tz 'US/Eastern' do
	    assert_equal Rational(-5, 24), DateTime.local_offset
	  end
	  with_env_tz 'US/Central' do
	    assert_equal Rational(-6, 24), DateTime.local_offset
	  end
	end

Inizialmente si pensò di chiamare questo helper **with\_timezone**, poi è stato rinominato in **with\_env\_tz** per evitare confusione con il fuso orario restituito da **ENV['TZ']** e **Time.zone**.

### Time.zone_reset!

È stato rimosso per non essere più usato.

### Time#in\_current\_time\_zone

È stato modificato per restituire **self** quando **Time.zone** è nullo. 

### Time#change\_time\_zone\_to\_current

È stato modificato per restituire **self** quando **Time.zone** è nullo. 

### TimeZone#now

Il metodo **TimeZone#now** è stato modificato per ritornare un oggetto **ActiveSupport::TimeWithZone** rappresentante l'orario corrente, nel fuso orario configurato, come definito in **Time.zone**. Ad esempio:

	Time.zone = 'Hawaii'  # => "Hawaii"
	Time.zone.now         # => Wed, 23 Jan 2008 20:24:27 HST -10:00

### Compare\_with\_coercion

Il metodo **compare\_with\_coercion** (e il suo alias <=>) è stato inserito nelle classi **Time** e **DateTime** rendendo possibile effettuare comparazioni cronologiche tra le classi **Time** e **DateTime**, e le instanze di  **ActiveSupport::TimeWithZone**.
Per comprendere meglio, diamo un'occhita a questo esempio (i risultati di ogni linea sono contenuti nei commenti):

	Time.utc(2000) <=> Time.utc(1999, 12, 31, 23, 59, 59, 999) # 1
	Time.utc(2000) <=> Time.utc(2000, 1, 1, 0, 0, 0) # 0
	Time.utc(2000) <=> Time.utc(2000, 1, 1, 0, 0, 0, 001)) # -1

	Time.utc(2000) <=> DateTime.civil(1999, 12, 31, 23, 59, 59) # 1
	Time.utc(2000) <=> DateTime.civil(2000, 1, 1, 0, 0, 0) # 0
	Time.utc(2000) <=> DateTime.civil(2000, 1, 1, 0, 0, 1)) # -1

	Time.utc(2000) <=> ActiveSupport::TimeWithZone.new(Time.utc(1999, 12, 31, 23, 59, 59) )
	Time.utc(2000) <=> ActiveSupport::TimeWithZone.new(Time.utc(2000, 1, 1, 0, 0, 0) )
	Time.utc(2000) <=> ActiveSupport::TimeWithZone.new(Time.utc(2000, 1, 1, 0, 0, 1) ))

### TimeWithZone#between?

Il metodo **between?** è stato incluso nella classe **TimeWithZone** per verificare se un'istanza è compresa tra due date. Esempio:

	@twz.between?(Time.utc(1999,12,31,23,59,59),
	              Time.utc(2000,1,1,0,0,1))
	
### TimeZone#parse

Questo metodo crea una nuova istanza di **ActiveSupport::TimeWithZone** a partire da una stringa. Ad esempio:
	
	Time.zone = "Hawaii"
	# => "Hawaii"
	Time.zone.parse('1999-12-31 14:00:00')
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00


	Time.zone.now
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00
	Time.zone.parse('22:30:00')
	# => Fri, 31 Dec 1999 22:30:00 HST -10:00

### TimeZone#at

Questo metodo può essere usato per creare una nuova istanza di **ActiveSupport::TimeWithZone** a partire dal numero di secondi trascorsi dalla Unix epoch. Ad esempio:

	Time.zone = "Hawaii" # => "Hawaii"
	Time.utc(2000).to_f  # => 946684800.0

	Time.zone.at(946684800.0)
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00

### Altri metodi

I metodi **to\_a**, **to\_f**, **to\_i**, **httpdate**, **rfc2822**, **to\_yaml**, **to\_datetime** e **eql?** sono stati aggiunti alla classe **TimeWithZone**. Per altre informazioni riguardo questi metodi fate riferimento alla documentazione di **Rails**.

### Preparare la classe TimeWithZone per Ruby 1.9

In Ruby 1.9 avremo alcuni nuovi metodi nella classe **Time**, come ad esempio:

	Time.now
	# => Thu Nov 03 18:58:25 CET 2005

	Time.now.sunday?
	# => false

Esiste un metodo per ogni giorno della settimana.

Un'altra cosa interessante è che il metodo **to\_s** dell'oggetto **Time** restituisce un valore differente. Attualmente quando eseguiamo **Time.new.to\_s**, viene restituito:

	Time.new.to_s
	# => "Thu Oct 12 10:39:27 +0200 2006″

In Ruby 1.9 avremo:

	Time.new.to_s
	# => "2006-10-12 10:39:24 +0200″

Cosa ha a che fare tutto ciò con Rails 2.1? Tutto. Rails viene migliorato affinché tenga in considerazione queste modifiche. La class **TimeWithZone**, ad esempio, è stata migliorata per funzionare con il metodo del primo esempio.
