## Oggetti "sporchi"

Ora in Rails abbiamo la possibilità di tenere traccia dei cambiamenti effettuati ad un oggetto **ActiveRecord**. E' possibile sapere se un oggetto è stato modificato o meno. Nel caso in cui sia stato modificato, possiamo rintracciare i suoi ultimi cambiamenti. Date un'occhiata ai seguenti esempi:
                  
  article = Article.find(:first)
	article.changed?  #=> false

	article.title  #=> "Title"
	article.title = "New Title"
	article.title_changed? #=> true

	# shows title before change
	article.title_was  #=> "Title"

	# before and after the change
	article.title_change  #=> ["Title", "New Title"]

Come potete vedere è molto semplice. Potete anche ottenere una lista di tutti i cambiamenti effettuati sull'oggetto con uno dei seguenti metodi:

	# returns a list with all of the attributes that were changed
	article.changed  #=> ['title']

	# returns a hash with attributes that were changed 
	# along with its values before and after
	article.changes  #=> { 'title’ => ["Title", "New Title"] }


Notate che quando un oggetto viene salvato il suo stato cambia:             

	article.changed?  #=> true
	article.save  #=> true
	article.changed?  #=> false

Nel caso in cui vogliate modificare lo stato di un oggetto senza utilizzare **attr=**, avrete bisogno di indicare esplicitamente che l'attributo verrà  cambiato utilizzando il metodo **attr\_name\_will\_change!** (sostituire **attr** con l'attributo reale dell'oggetto). Date un'occhiata ai seguenti esempi:
    
	article = Article.find(:first)
	article.title_will_change!
	article.title.upcase!
	article.title_change  #=> ['Title', 'TITLE']
