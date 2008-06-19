## Utilizzare l'email come username.

Alcuni servizi utilizzano l'email come username (nome utente), il che ci forza a dover utilizzare URL come la seguente:

	http://ernesto.jimenez@negonation.com:pass@tractis.com

Ma ciò era fonte di problemi. Dal momento che abbiamo due (@) l'interprete di perde nel leggerlo. Per questo motivo, **ActiveResource** è stata leggermente estesa, permettendo [TODO envisioning] un uso più semplice dell'autenticazione basata su indirizzi email. Adesso potete utilizzare il seguente codice:

	class Person < ActiveResource::Base
	  self.site = "http://tractis.com"
	  self.user = "ernesto.jimenez@negonation.com"
	  self.password = "pass"
	end
