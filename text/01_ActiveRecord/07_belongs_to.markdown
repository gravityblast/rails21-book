## Belongs_to

Il metodo **belongs\_to** è stato cambiato per permettere l'uso di **:dependent => :destroy** e **:delete** nelle associazioni.
Per esempio:
       
	belongs_to :author_address
	belongs_to :author_address, :dependent => :destroy
	belongs_to :author_address_extra, :dependent => :delete, 
		:class_name => "AuthorAddress"
