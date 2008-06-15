## ActionController::Routing

### Map.root
Ora quando si usa **map.root** si può essere più **DRY** usando gli alias.
Nelle precedenti versioni di rails si faceva qualcosa del tipo:

	map.new_session :controller => 'sessions', :action => 'new'
	map.root :controller => 'sessions', :action => 'new'

Ora si può fare in questo modo:

	map.new_session :controller => 'sessions', :action => 'new'
	map.root :new_session
	
### Riconoscimento delle route
La vecchia implementazione controllava tutte le route, una per una e spesso impiegava molto tempo. È stata sviluppata una nuova e più efficiente implementazione. Viene creato un albero di route e il riconoscimento è fatto tramite i prefissi, saltando le route simili. In questo modo il tempo di riconoscimento viene ridotto di circa 2,7 volte.

Tutta la nuova implementazione è nel file **recognition\_optimisation.rb** e il suo funzionamento dettegliato è ben spiegato nei commenti. Per maggiori informazioni riguardo la sua implementazione si guardi la documentazione nel codice sorgente stesso.

### Assert_routing

Ora è possibile testare una route con un metodo HTTP. Vedi l'esempio:

	assert_routing({ :method => 'put',
	                 :path => '/product/321' },
	               { :controller => "product",
	                 :action => "update",
	                 :id => "321" })
	
### Map.resources

Immagina di avere un sito tutto scritto in una lingua diversa dall'inglese e vuoi impostare le tue route per usare la stessa lingua. In altre parole, invece di avere:

	http://www.miosito.it/products/1234/reviews

Vorresti avere qualcosa del tipo:

	http://www.miosito.it/prodotti/1234/commenti

Questo era già possibile ottenerlo, ma non in modo semplice e senza compromettere le convenzioni di rails.

Ora ci sono le opzioni **:as** con **map.resources** per personalizzare le proprie route. Vedi l'esempio per avere le URL sopra in italiano:

	map.resources :products, :as => 'prodotti' do |product|
	  # product_reviews_path(product) ==
	  # '/prodotti/1234/commenti’
	  product.resources :product_reviews, :as => 'commenti'
	end
