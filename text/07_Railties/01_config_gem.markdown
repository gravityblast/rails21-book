## config.gem

Ora è possibile configurare tutte le gemme necessarie per un progetto usando una nuova feature chiamata **config.gem**. Nel file **environment.rb** è sufficiente specificare di quali gemme il progetto necessita per funzionare. Osserviamo l'esempio:

	config.gem "bj" 

	config.gem "hpricot", :version => '0.6',
	                      :source => "http://code.whytheluckystiff.net" 

	config.gem "aws-s3", :lib => "aws/s3"

Per installare tutte le dipendenze in un colpo solo, possiamo semplicemente usare un task Rake:

	# Installa tutte le gemme specificate
	rake gems:install

E' anche possibile elencare quali gemme vengono usate in un progetto in questo modo: 

	# Elenca tutte le gemme dipendenti
	rake gems

Se una delle gemme ha un file chiamato **rails/init.rb** e volete mantenere la gemma con la vostra applicazione, potete usare:

	# Copia la gemma specificata in vendor/gems/nome_do_gem-x.x.x
	rake gems:unpack GEM=gem_name

Così facendo, la gemma verrà copiata nella directory **vendor/gems/gem\_name-x.x.x**. Nel caso in cui non verrà specificato il nome, Rails copierà le gemme nella directory **vendor/gem**

## config.gem in plugins

La feature **config.gem** è anche disponibile per i plugins.

Fino a Rails 2.0 il file **init.rb** di un plugin aveva un aspetto come questo:

	# init.rb of plugin open_id_authentication
	require 'yadis' 
	require 'openid' 
	ActionController::Base.send :include, OpenIdAuthentication 

Ma in Rails 2.1 il file **init.rb** sarebbe stato:

	config.gem "ruby-openid", :lib => "openid", :version => "1.1.4"
	config.gem "ruby-yadis",  :lib => "yadis",  :version => "0.3.4" 

	config.after_initialize do
	  ActionController::Base.send :include, OpenIdAuthentication
	end

In questo modo, quando verrà eseguito il task per installare tutte le gemme necessarie, queste gemme verranno aggiunte automaticamente.