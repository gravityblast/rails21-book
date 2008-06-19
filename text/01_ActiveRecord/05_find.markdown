## Find

### Conditions

Da oggi potete passare un oggetto come parametro del metodo **find** di **ActiveRecord**. Osservate questo esempio:

	class Account < ActiveRecord::Base
	  composed_of :balance, :class_name => "Money", :mapping => %w(balance amount)
	end

In questo caso potete passare un'instanza di **Money** come parametro del metodo **find** della classe **Account**, per esempio:
            
	amount = 500
	currency = "USD"
	Account.find(:all, :conditions => { :balance => Money.new(amount, currency) })
	
### Last

Fino ad ora potevamo usare solamente tre operatori per ricercare i dati utilizzando il metodo **find** di **ActiveRecord**. Questi sono: **:first**, **:all** e l'id dell'oggetto (in questo caso non passiamo nessun argomento a **find** oltre all'id stesso)

In Rails 2.1 esiste un quarto operatore chiamato **:last**. Qualche esempio:

	Person.find(:last)
	Person.find(:last, :conditions => [ "user_name = ?", user_name])
	Person.find(:last, :order => "created_on DESC", :offset => 5)

Per comprendere pienamente come funziona tale operatore date un'occhiata al seguente test:
	                                                             
	def test_find_last
	  last  = Developer.find :last
	  assert_equal last, Developer.find(:first, :order => 'id desc')
	end
	
### All

Il metodo statico **all** è un alias a **find(:all)**. Esempio:
                      	
	Topic.all è equivalente a Topic.find(:all)

### First

Il metodo statico **first** è un alias a **find(:first)**. Esempio:
              
	Topic.first è equivalente a Topic.find(:first)

### Last

Il metodo statico **last** è un alias a **find(:last)**. Esempio:

	Topic.last è equivalente a Topic.find(:last)

             
## Utilizzare i metodi **first** e **last** con named\_scope

Tutti i metodi sopra citati funzionano nei **named_scope**. Supponiamo di creare un **named\_scope** chiamato **recent**. Il seguente statement è corretto:

		post.comments.recent.last
