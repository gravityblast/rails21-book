## Cache

Ora tutti i metodi **fragment\_cache\_key** restituiscono per default il namespace 'view/' come prefisso.

Tutte le modalità di cache sono state rimosse da **ActionController::Caching::Fragments::*** ed ora si possono trovare in **ActiveSupport::Cache::***. In questo caso, se avete utilizzato, ad esempio, un metodo di caching come **ActionController::Caching::Fragments::MemoryStore**, dovrete cambiare ogni riferimento in **ActiveSupport::Cache::MemoryStore**.

**ActionController::Base.fragment\_cache\_store** è stato rimosso e **ActionController::Base.cache\_store** ha preso il suo posto.

In **ActiveRecord::Base** è stato incluso il metodo **cache\_key** per facilitare alla nuova libreria **ActiveSupport::Cache::*** il salvataggio in cache di ActiveRecord. Funziona in questo modo:

	>> Product.new.cache_key
	=> "products/new"

	>> Product.find(5).cache_key
	=> "products/5"

	>> Person.find(5).cache_key
	=> "people/5-20071224150000"

Sono stati inclusi i metodi **ActiveSupport::Gzip.decompress/compress** per facilitare l'uso del wrapper di **Zlib**.

Adesso potete utilizzare **config.cache\_store** tra le opzioni di ambiente (environment) per specificare la modalità di caching di default. E' bene notare che se la directory **tmp/cache** esiste, allora il default è **FileStore**; altrimeti viene utilizzato **MemoryStore**. Potete configurare secondo le seguenti modalità:

	config.cache_store = :memory_store
	config.cache_store = :file_store, "/path/to/cache/directory"
	config.cache_store = :drb_store, "druby://localhost:9192"
	config.cache_store = :mem_cache_store, "localhost"
	config.cache_store = MyOwnStore.new("parameter")

Per rendere le cose più semplici è stato incluso il seguente commento alla fine del file *environments/production.rb*, affinché vi ricordiate di questa possibilità.

	# Use a different cache store in production
	# config.cache_store = :mem_cache_store
