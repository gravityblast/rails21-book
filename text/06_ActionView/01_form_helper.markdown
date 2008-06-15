## ActionView::Helpers::FormHelper

### fields\_for form\_for con l'opzione index.

I metodi **#fields\_for** e **form\_for** necessitavano dell'opzione **:index**. Ora non è più necessario usare **:index => nil** su ogni oggetto del form. Osservare gli esempi:

Questo è come di solito era il codice:

	<% fields_for "project[task_attributes][]", task do |f| %>
	  <%= f.text_field :name, :index => nil %>
	  <%= f.hidden_field :id, :index => nil %>
	  <%= f.hidden_field :should_destroy, :index => nil %>
	<% end %>

Ora assomiglia a qualcosa del tipo:

	<% fields_for "project[task_attributes][]", task,
	              :index => nil do |f| %>
	  <%= f.text_field :name %>
	  <%= f.hidden_field :id %>
	  <%= f.hidden_field :should_destroy %>
	<% end %>
