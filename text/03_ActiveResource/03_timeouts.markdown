## Timeout

ActiveResource utilizza il protocollo **HTT** per accedere alle API RESTful, e a causa di ciò e suscettibile a problemi quali risposte lente da parte dei server oppure server non raggiungibili.
In tali casi, le chiamate ad ActiveResource possono andare in timeout. Adesso è possibile controllare il tempo di timeout attraverso l'omonima proprietà:

	class Person < ActiveResource::Base
	  self.site = "http://api.people.com:3000/"
	  self.timeout = 5 # waits 5 seconds before expire
	end

Nell'esempio precedente è stato impostato un timeout di 5 secondi. Un valore basso è consigliato per permettere al vostro sistema il fail-fast, prevenendo una cascata di failure che incapaciterebbe il vostro server.

Internamente ActiveReasource mutua risorse dalla libreria Net:HTTP per costruire risorse HTTP. Quando impostate un valore per la proprietà timeout, il medesimo valore viene definito per **read\_timeout** dell'oggetto Net:HTTP utilizzato.

Il valore di default è pari a 60 secondi.
