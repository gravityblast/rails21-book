## Time.current

C'è un nuovo metodo per la classe **Time**. Il valore del metodo **current** dipende da **config.time\_zone**, se è stato specificato precedentemente il metodo restituirà un  **Time.zone.now** altrimenti un **Time.now**.

	# il valore di ritorno dipende da config.time_zone
	Time.current

Anche i metodi **since** e **ago** hanno modificato i propri valori di ritorno restituendo un  **TimeWithZone** nel caso in cui **config.time\_zone** sia stato specificato.

Ciò rende il metodo **Time.current** il nuovo metodo di default per recuperare l'orario attuale, rimpiazzando **Time.now** (che continua ad esistere, ma non tiene conto del timezone specificato).

Anche i metodi **datetime\_select**, **select\_datetime** e **select\_time** sono stati aggiornati a restituire come valore di default **Time.current**.
