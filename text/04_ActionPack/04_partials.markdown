## Un nuovo modo di utilizzare i partials

Una prassi molto comune nello sviluppo con Rails è l'utilizzo di **partials** per evitare la ripetizione di codice. Ecco un esempio del loro utilizzo:

	<% form_for :user, :url => users_path do %>
		<%= render :partial => 'form' %>
		<%= submit_tag 'Create' %>
	<% end %>

Un **Partial** è un frammento di codice (un template). Utilizzare i **partial** offre il vantaggio di evitare un'inutile ripetizione del codice. Utilizzare un **partial** è molto semplice, potete iniziare con qualcosa come: **render :partial => "name"**. Successivamente, dovete creare un file con il nome del vostro **partial** anteponendovi un trattino basso (underscore). Tutto qui.

Il codice che abbiamo appena visto mostra come abbiamo sempre utilizzato i **partials**, ma in questa nuova versione di rails possiamo fare la stessa cosa, in modo diverso, come in:

	<% form_for(@user) do |f| %>
		<%= render :partial => f %>
		<%= submit_tag 'Create' %>
	<% end %>

In questo esempio verrà renderizzato un partial di nome "users/\_form", che riceverà una variabile chiamata "form" con tutte le referenze create dal **FormBuilder**.

Naturalmente la vecchia modalità continuerà a funzionare.
