## Il metodo clone

Adesso possiamo clonare una resource esistente:

	ryan = Person.find(1)
	not_ryan = ryan.clone
	not_ryan.new?  # => true

Notate che l'oggetto copiato non clona nessuno degli attributi della classe, ma solo gli attributi della risorsa.

	ryan = Person.find(1)
	ryan.address = StreetAddress.find(1, :person_id => ryan.id)
	ryan.hash = {:not => "an ARes instance"} 

	not_ryan = ryan.clone
	not_ryan.new?            # => true
	not_ryan.address         # => NoMethodError
	not_ryan.hash            # => {:not => "an ARes instance"}