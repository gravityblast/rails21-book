## UTC o GMT?

Un emendamento [TODO amendment], ma interessante. Fino ad ora Rails ha molto utilizzato l'acronimo UTC, ma quando il metodo **to\_s** di **TimeZone** viene invocato, esso restituisce GMT, non UTC. Questo è dovuto al fatto che l'acronimo GMT è il più noto tra gli utenti finali.

Se date un'occhiata la pannello di controllo di Windows, dove potete scegliere il timezone (fuso orario), noterete che l'acronimo utilizzato è GMT. Anche Google e Yahoo hanno usato GMT nei loro prodotti.

	TimeZone['Moscow'].to_s #=> "(GMT+03:00) Moscow"
