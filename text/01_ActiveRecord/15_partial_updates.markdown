## Update parziali

L'implementazione dei **Dirty Objects** è stata il punto di partenza di un'altra feature molto interessante.

Dal momento che adesso possiamo rintracciare cosa ha modificato lo stato di un oggetto, perché non utilizzare ciò per eliminare update inutili al database?

Nelle precedenti versioni di Rails quando invocavamo il metodo **save** su un oggetto **ActiveRecord** esistente, tutti i suoi campi venivano modificati nel database. Anche quelli che non avevano subìto alcun cambiamento.

Questa operazione potrebbe essere enormemente migliorata con l'uso dei **Dirty Objects** ed è esattamente quello che è successo. Date un'occhiata alle query SQL generate in Rails 2.1 quando cercate di salvare un oggetto con poche modifiche:

	article = Article.find(:first)
	article.title  #=> "Title"
	article.subject  #=> "Edge Rails"

	# Let's change the title
	article.title = "New Title"

	# it creates the following SQL
	article.save
	#=>  "UPDATE articles SET title = 'New Title' WHERE id = 1"

Notate come solo i campi che sono stati alterati vengono modificati nel database. Se nessun campo viene modificato, allora **ActiveRecord** non esegue alcun update.

Per abilitare/disabilitare questa nuova feature dovete modificare la proprietà **partial\_updates** nel vostro modello.

	# To enable it
	MyClass.partial_updates = true

Se volete abilitare/disabilitare questa feature in tutti i vostri modelli, allora dovete editare il file *config/initializers/new\_rails\_defaults.rb*:

	# Enable it to all models
	ActiveRecord::Base.partial_updates = true

Inoltre non dimenticate di informare Rails attraverso *config/initializers/new\_rails\_defaults.rb* se decidete di modificare un campo senza l'uso del metodo **attr=**, come nel seguente esempio:

	# If you use **attr=**, 
	# then it's ok not informing
	person.name = 'bobby'
	person.name_change    # => ['bob', 'bobby']
	
	
	# But you must inform that the field will be changed
	# if you plan not to use **attr=** 
	person.name_will_change!
	person.name << 'by'
	person.name_change    # => ['bob', 'bobby']

Se non informate il framework del fatto che sono previsti cambiamenti del genere, allora questi non vengono rintracciati e pertanto le tabelle nel database non vengono correttamente aggiornate.
