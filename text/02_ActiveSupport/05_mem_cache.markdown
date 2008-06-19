## Adesso mem\_cache\_store accetta opzioni

L'inclusione di **Memcache-Client** all'interno di **ActiveSupport::Cache** rende le cose più semplici che mai, ma limita la sua flessibilità per il fatto di non permetterci di personalizzare nulla se non l'IP del server **memcached**.

**Jonathan Weiss** ha scritto una patch, inclusa in Rails, che permette di includere parametri extra:

	ActiveSupport::Cache.lookup_store :mem_cache_store, "localhost"

	ActiveSupport::Cache.lookup_store :mem_cache_store, "localhost", '192.168.1.1', 
		:namespace => 'foo'

oppure

	config.action_controller.fragment_cache_store = :mem_cache_store, 'localhost', 
		{:compression => true, :debug => true, :namespace =>'foo'}
