## Proteggersi dal "Cross site scripting"

In Rails 2.0 il file *application.rb* è molto simile a:

	class ApplicationController < ActionController::Base
	  helper :all

	  protect_from_forgery
	end

Osservate la chiamata al metodo **protect\_from\_forgery**.

Avete mai sentito parlare di "Cross site scripting"? E' questo il nome dato ad una falla nella sicurezza facilmente riscontrabile in molti siti internet ed applicazioni web, essa consente a persone malintenzionate (e mi riferisco a teenager che non hanno nulla da fare né alcuna vita sociale) di alterare il contenuto delle pagine web, effettuare attacchi di tipo "phishing", e prendere il controllo del browser tramite codice JavaScript ed in molti casi forzare l'utente ad eseguire i comandi da essi (i teenager) desiderati. Quest ultimo tipo di attacco viene chiamato "cross-site request forgery".

Cross Site Request Forgery è un tipo di attacco che obbliga utenti legittimi ad eseguire dei comandi senza che gli stessi ne siano a conoscenza. Con l'aumento dell'utilizzo di AJAX, la cosa si fa ancora più grave.

Allo stato attuale, questo metodo è utile per far sì che tutti i form che la vostra applicazione riceverà
provengano da essa stessa, e non da un link appartenente ad altro sito. Lo scopo viene raggiunto includendo in tutti i form e le richieste AJAX generate da Rails un token che poggia sulla sessione corrente inoltre, in seconda battuta, lo stesso token è soggetto a verifica da parte del controller.

Ricordiamo che le richieste di tipo "GET" non sono protette. Tuttavia, rispettandone la semantica (recupero e _mai_ modifica o salvataggio delle informazioni) ciò non costituisce un problema.

Per saperne di più sul CSRF potete far riferimento a:

* [http://www.nomedojogo.com/2008/01/14/como-um-garoto-chamado-samy-pode-derrubar-seu-site/isc.sans.org/diary.html?storyid=1750](http://www.nomedojogo.com/2008/01/14/como-um-garoto-chamado-samy-pode-derrubar-seu-site/isc.sans.org/diary.html?storyid=1750)

* [http://www.nomedojogo.com/2008/01/14/como-um-garoto-chamado-samy-pode-derrubar-seu-site/isc.sans.org/diary.html?storyid=1750](http://www.nomedojogo.com/2008/01/14/como-um-garoto-chamado-samy-pode-derrubar-seu-site/isc.sans.org/diary.html?storyid=1750)

E' bene ricordare che questa non è la soluzione definitiva al problema
o, in gergo, non è la pallottola d'argento.
