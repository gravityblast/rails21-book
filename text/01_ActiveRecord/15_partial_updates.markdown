## Update parziali

L'implementazione dei **Dirty Objects** è stata il punto di partenza di un'altra feature molto interessante.

Dal momento che adesso possiamo rintracciare cosa è stato modificato nello stato di un oggetto, perché non utilizzare ciò per eliminare update inutili dal database?

Nelle precedenti versioni di Rails quando invocavamo il metodo **save** su un oggetto **ActiveRecord** esistente, tutti i suoi campi venivano modificati nel database. Anche quelli che non avevano subìto alcun cambiamento.

Questa operazione potrebbe essere enormemente migliorata con l'uso dei **Dirty Objects** ed è esattamente quello che è successo. Date un'occhiata alle query SQL generate in Rails 2.1 quando cercate di salvare un oggetto con poche modifiche:

	article = Article.find(:first)
	article.title  #=> "Title"
	article.subject  #=> "Edge Rails"

	# Modifichiamo il titolo
	article.title = "New Title"

	# viene generato il seguente statement SQL
	article.save
	#=>  "UPDATE articles SET title = 'New Title' WHERE id = 1"

Notate come solo i campi che sono stati alterati vengono modificati nel database. Se nessun campo viene modificato, allora **ActiveRecord** non esegue alcun update.

Per abilitare/disabilitare questa nuova feature dovete modificare la proprietà **partial\_updates** nel vostro modello.

	# Per abilitarlo
	MyClass.partial_updates = true

Se volete abilitare/disabilitare questa feature in tutti i vostri modelli, allora dovete editare il file *config/initializers/new\_rails\_defaults.rb*:

	# Per abilitarlo in tutti i modelli
	ActiveRecord::Base.partial_updates = true

Inoltre non dimenticate di informare Rails attraverso *config/initializers/new\_rails\_defaults.rb* se decidete di modificare un campo senza l'uso del metodo **attr=**, come nel seguente esempio:

	# Se utilizzate **attr=**
	# non è necessario informare Rails
	person.name = 'bobby'
	person.name_change    # => ['bob', 'bobby']
	
	
	# Ma dovete informare il framework su quali attributi
	# potranno cambiare se pensate di non utilizzare **attr=**
	person.name_will_change!
	person.name << 'by'
	person.name_change    # => ['bob', 'bobby']

Se non informate il framework del fatto che sono previsti cambiamenti del genere, allora questi non vengono rintracciati e pertanto le tabelle nel database non vengono correttamente aggiornate.
