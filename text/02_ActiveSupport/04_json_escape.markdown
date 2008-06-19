## JSON escape

Il metodo **json\_escape** funziona come **html\_escape**. E' molto utile quando vogliamo mostrare stringhe **JSON** in una pagine **HTML**, per esempio in fase di documentazione.

	puts json_escape("is a > 0 & a < 10?")
	# => is a \u003E 0 \u0026 a \u003C 10?

Possiamo anche utilizzare la scorciatoia **j** in ERB:

	<%= j @person.to_json %>

Se volete che tutto il codice **JSON** venga [TODO escaped] per default, includete il seguente codice all'interno del vostro file **environment.rb**:

	ActiveSupport.escape_html_entities_in_json = true
