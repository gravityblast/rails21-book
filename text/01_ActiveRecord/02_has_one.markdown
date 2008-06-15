## Has\_one

### Supporto per l'opzione through

Il metodo **has\_one** adesso dispone dell'opzione **through**. Funziona esattamente come **has_many :through**, ma rappresenta l'associazione al singolo oggetto **ActiveRecord**.

	class Magazine < ActiveRecord::Base
	  has_many :subscriptions
	end

	class Subscription < ActiveRecord::Base
	  belongs_to :magazine
	  belongs_to :user
	end

	class User < ActiveRecord::Base
	  has_many :subscriptions
	  has_one :magazine, :through => :subscriptions, 
		        :conditions => ['subscriptions.active = ?', true]
	end
	
### Has\_one con :source\_type             

Il metodo **has\_one :through**, appena visto, ha anche l'opzione **:source\_type**. Cercherò di illustrarla attraverso qualche esempio. Iniziamo con le due classi seguenti:

	class Client < ActiveRecord::Base
	  has_many :contact_cards 

	  has_many :contacts, :through => :contact_cards
	end 

Ciò a cui siamo interessati qui è la classe **Client** che **ha molti** (has_many) tipi di contatti dal momento che la classe **ContactCard** ha una relazione polimorfica.

Nel successivo passo del nostro esempio creiamo due classi per rappresentare una **ContactCard**:         

	class Person < ActiveRecord::Base
	  has_many :contact_cards, :as => :contact
	end

	class Business < ActiveRecord::Base
	  has_many :contact_cards, :as => :contact
	end

**Person** e **Business** sono correlate alla mia classe **Client** attraverso la tabella **ContactCard**. In altre parole ho due tipi di contatti: personali e di business. 
          
Ciò, comunque, non funziona. Osservate cosa succedere quando cerco di recuperare un contatto:

	>> Client.find(:first).contacts
	# ArgumentError: /…/active_support/core_ext/hash/keys.rb:48:
	# in `assert_valid_keys’: Unknown key(s): polymorphic 

Per fare in modo che funzioni dobbiamo usare **:source_type**. Modifichiamo la nostra classe **Client**:
                       
	class Client < ActiveRecord::Base
	  has_many :people_contacts,
	           :through => :contact_cards,
	           :source => :contacts,
	           :source_type => :person 

	  has_many :business_contacts,
	           :through => :contact_cards,
	           :source => :contacts,
	           :source_type => :business
	end

Notate come ora abbiamo due modi differenti per recuperare i nostri contatti, inoltre possiamo indicare a quale contatto **:source_type** siamo interessati:

	Client.find(:first).people_contacts
	Client.find(:first).business_contacts
