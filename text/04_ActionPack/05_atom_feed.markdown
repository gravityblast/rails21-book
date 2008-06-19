## Nuovi namespaces nei feed Atom

Conoscete il metodo **atom\_feed**? È una delle nuove caratteristiche di Rails 2.0, che consente di creare con facilità feed Atom. Ecco un esempio del suo utilizzo:

In un file *index.atom.builder*:

	atom_feed do |feed|
	  feed.title("Nome do Jogo")
	  feed.updated((@posts.first.created_at))

	  for post in @posts
	    feed.entry(post) do |entry|
	      entry.title(post.title)
	      entry.content(post.body, :type => 'html')

	      entry.author do |author|
	        author.name("Carlos Brando")
	      end
	    end
	  end
	end

Che cos'è un feed Atom ? Atom è il nome di un insieme di stili e metadati basati su XML. In altre parole è un protocollo per pubblicare contenuti e relativi aggiornamenti su internet, come in un blog as esempio. I feed sono sono sempre pubblicati in XML, e Atom viene identificato con un media type application/atom+xml.

Nella prima versione di Rails 2.0 questo metodo accettava parametri come **:language**, **:root_url** e **:url**, potete ottenere altre informazioni a riguardo nella documentazione di Rails. Con i miglioramenti introdotti, possiamo includere nuovi namespace nel primo elemento del feed (root). Ad esempio:

	atom_feed('xmlns:app' => 'http://www.w3.org/2007/app') do |feed|

restiturà:

	<feed xml:lang="en-US" xmlns="http://www.w3.org/2005/Atom" 
		xmlns:app="http://www.w3.org/2007/app">

Se modificassimo l'esempio precedente, avremmo:

	atom_feed({'xmlns:app' => 'http://www.w3.org/2007/app',
		'xmlns:openSearch' => 'http://a9.com/-/spec/opensearch/1.1/'}) do |feed| 

	  feed.title("Nome do Jogo")
	  feed.updated((@posts.first.created_at))
	  feed.tag!(openSearch:totalResults, 10) 

	  for post in @posts
	    feed.entry(post) do |entry|
	      entry.title(post.title)
	      entry.content(post.body, :type => 'html')
	      entry.tag!('app:edited', Time.now) 

	      entry.author do |author|
	        author.name("Carlos Brando")
	      end
	    end
	  end
	end
