## Utilizzando method\_missing, fate attenzione a non lasciare il fianco scoperto

Il metodo **respond\_to?** è cruciale per via della natura dinamica di ruby. Quante volte abbiamo dovuto
controllare l'esistenza di un metodo o, addirittura, la corrispondenza di tipo di un oggetto (**is\_a?**)?

Comunque, c'è qualcosa di molto importante che molti dimenticano. Date uno sguardo alla classe che
segue che fa uso di **method\_missing**:

	class Dog
	  def method_missing(method, *args, &block)
	    if method.to_s =~ /^bark/
	      puts "woofwoof!"
	    else
	      super
	    end
	  end
	end

	rex = Dog.new
	rex.bark #=> woofwof!
	rex.bark! #=> woofwoof!
	rex.bark_and_run #=> woofwoof!

Credo che conosciate già **method\_missing**, non è vero? Nell'esempio di cui sopra, ho creato un'istanza
della classe **Dog** e chiamato i metodi **bark**, **bark!** e **bark\_and\_run** che non esistono. Quindi, il metodo **method\_missing** viene invocato e, tramite una semplice espressione regolare, restituisce "woofwoof!" ogni qualvolta il metodo inizia con bark.

Osserviamo però cosa accade quando cerco di usare il metodo **respond\_to?**:

	rex.respond_to? :bark #=> false
	rex.bark #=> woofwoof!

Viene restituito false, il che ha un senso visto che la classe non implementa il metodo richiesto.
Dunque, la responsabilità di modificare il metodo **respond\_to?** affinché lavori correttamente
con la mia regola speciale, è nostra. Cambieremo la classe come segue:

	class Dog
	  METHOD_BARK = /^bark/

	  def respond_to?(method)
	    return true if method.to_s =~ METHOD_BARK
	    super
	  end

	  def method_missing(method, *args, &block)
	    if method.to_s =~ METHOD_BARK
	      puts "woofwoof!"
	    else
	      super
	    end
	  end
	end

	rex = Dog.new
	rex.respond_to?(:bark) #=> true
	rex.bark #=> woofwoof!


Adesso stiamo ragionando! Questo è un errore frequentemente riscontrato in molto codice, anche in Rails stesso. Provate ad eseguire **respond\_to?** per verificare l'esistenza di **find\_by\_name** ad esempio.

Ruby è un linguaggio incredibile e molto flessibile ma, come abbiamo visto, se non prestiamo attenzione è facile lasciare il fianco scoperto.

Ovviamente, in Rails 2.1 il problema è stato risolto e quindi possiamo usare **respond\_to?** per verificare l'esistenza di metodi come **find\_by\_something**.
