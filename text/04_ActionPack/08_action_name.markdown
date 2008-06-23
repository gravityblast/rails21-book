## action\_name

Ora, per sapere che view è stata chiamata durante (TODO), possiamo semplicemente usare il metodo **action\_name**
Now, to know which view was called during running time of your view, we just use the **action\_name** method:

	<%= action_name %>

Il valore ritornato sarà lo stesso ritornato da **params[:action]**, ma in un modo più elegante.
