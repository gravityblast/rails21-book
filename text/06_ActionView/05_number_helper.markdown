## ActionView::Helpers::NumberHelper

### number\_to\_currency

Il metodo **number\_to\_currency** ora accetta l'opzione **:format** come parametro, quindi è possibile formattare il valore di ritorno del metodo. Nelle versioni passate, quando si doveva formattare la valuta locale, bisognava includere uno spazio davanti l'opzione **:unit** per avere il formato dell'output corretto. Osservare gli esempi:

	# € è il simbolo dell'Euro
	number_to_currency(9.99, :separator => ",", :delimiter => ".", :unit => "€")
	# => "€9,99″

	number_to_currency(9.99, :format => "%u %n", :separator => ",", 
		:delimiter => ".", :unit => "€")
	# => "€ 9,99″
	
Oltre a questo, si possono fare altre personalizzazioni:

	number_to_currency(9.99, :format => "%n in euro", :separator => ",", 
		:delimiter => ".", :unit => "€")
	# => "9,99 in euro"

Quando si creano delle stringhe formattate è possibile usare i seguenti parametri:

	%u Per la valuta
	%n Per il numero
