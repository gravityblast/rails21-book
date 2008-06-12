## Url polimorfiche

I metodi helper per le URL polimorfiche sono utilizzati come una soluzione più elegante rispetto ai "renamed routes" quando lavorate con **ActiveRecord**.

Questi metodi diventano utili quando volete generare l'URL per una risorsa **RESTful** senza specificare il tipo con la quale la risorsa stessa viene associata.

E' molto semplice lavorare con essi. Date un'occhiata ai pochi esempi (nei commenti viene presentato come realizzare la stessa cosa in versioni di Rails antecedenti la 2.1):                                    

	record = Article.find(:first) 
	polymorphic_url(record) #-> article_url(record)

	record = Comment.find(:first)
	polymorphic_url(record)  #->  comment_url(record)

	# it can also identify recently created elements
	record = Comment.new
	polymorphic_url(record)  #->  comments_url()

Notate come il metodo **polymorphic_url** sia capace di identificare il tipo che gli viene passato e generare di conseguenza il route corretto. Sono anche supportate le **nested resources** e i **namespaces**:

	polymorphic_url([:admin, @article, @comment])
	#-> this will return:
	admin_article_comment_url(@article, @comment)


Potete anche utilizzare prefissi come **new**, **edit** and **formatted**. Date un'occhiata ai seguenti esempi:

	edit_polymorphic_path(@post)
	#=> /posts/1/edit

	formatted_polymorphic_path([@post, :pdf])
	#=> /posts/1.pdf
