## JSON

Rails ora accetta richieste POST con contenuto JSON. Per esempio, è possibile inviare una richiesta post in questo modo: 

	POST /posts
	{"post": {"title": "Breaking News"}}

E tutto va nella variabile **params**. Per esempio:
And everything goes to variable **params**. This works, for example:

	def create
	  @post = Post.create params[:post]
	  # …
	end

Per quelli che non conoscono JSON, è un "concottente" dell'XML, ed è ampiamente utilizzato per lo scambio di dati JavaScript, perchè è rappresentato in questo linguaggio. Prende il nome da qui: **JavaScript Object Notation**.
