## Salvare il nome completo di una classe quando si usa STI

Quando utilizziamo **modelli** con **namespace** e **STI**, **ActiveRecord** salva solo il nome della classe, senza i suoi **namespace** (*demodulized*). Questo funziona solo quando tutte le class in **STI** sono nel medesimo **namespace**. Osserviamo l'esempio:

	class CollectionItem < ActiveRecord::Base; end
	class ComicCollection::Item < CollectionItem; end

	item = ComicCollection::Item.new
	item.type # => 'Item’

	item2 = CollectionItem.find(item.id)
	# returns an error, because it can't find
	# the class Item

Questa modifica aggiunge una nuova opzione che permette ad **ActiveRecord** di salvare l'intero nome della classe.

Per abilitare/disablitare questa feature dovete modificare il file **environment.rb**, affinché abbia:

	ActiveRecord::Base.store_full_sti_class = true

Il suo valore di default è true.
