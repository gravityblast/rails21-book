## Labels

Quando viene creata una nuova form utilizzando uno **scaffold** verrà generato il seguente codice:

	<% form_for(@post) do |f| %>
	  <p>
	    <%= f.label :title %><br />
	    <%= f.text_field :title %>
	  </p>
	  <p>
	    <%= f.label :body %><br />
	    <%= f.text_area :body %>
	  </p>
	  <p>
	    <%= f.submit "Update" %>
	  </p>
	<% end %>

Questo appare molto più sensato. È stato aggiunto il metodo **label**, il quale restituisce una *stringa* con il titolo della colonna incluso in un tag HTML **\<label\>**.

	>> f.label :title
	=> <label for="post_title">Title</label>

	>> f.label :title, "A short title"
	=> <label for="post_title">A short title</label>

	>> label :title, "A short title", :class => "title_label"
	=> <label for="post_title" class="title_label">A short title</label>

Vi siete accorti del parametro **for** all'interno del tag? "post\_title" è il titolo della textbox che contiene il titolo del nostro post. Infatti il tag **\<label\>** è associato all'oggetto **post\_title**. Quando cliccate sulla label (che non è un link) è l'oggetto HTML associato a riceve il focus.

Robby Russell ha scritto un interessante post nel suo blog a riguardo. Potete leggerlo qui: [http://www.robbyonrails.com/articles/2007/12/02/that-checkbox-needs-a-label](http://www.robbyonrails.com/articles/2007/12/02/that-checkbox-needs-a-label)

Inoltre è stato incluso in **FormTagHelper** il metodo **label\_tag**. Questo metodo si comporta come label, ma più semplicemente:

	>> label_tag 'name'
	=> <label for="name">Name</label> 

	>> label_tag 'name', 'Your name'
	=> <label for="name">Your name</label> 

	>> label_tag 'name', nil, :class => 'small_label'
	=> <label for="name" class="small_label">Name</label>

Il metodo accetta anche l'opzione *:for**, ad esempio:

	label(:post, :title, nil, :for => "my_for")

che restituisce qualcosa del genere:

	<label for="my_for">Title</label>
