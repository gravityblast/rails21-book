## Incremento e decremento

Ora i metodi **increment**, **increment!**, **decrement** e **decrement!** di **ActiveRecord** hanno un nuovo parametro opzionale. Nelle precedenti versioni di Rails potevate usare questi metodi per aggiungere o sottrarre 1 (uno) ad una data colonna. In Rails 2.1 potete specificare quale valore deve essere aggiunto o sottratto. Ad esempio: 

	player1.increment!(:points, 5)
	player2.decrement!(:points, 2)

Nel precedente esempio sto aggiungendo 5 punti al giocatore 1 (player1) e sottraendo 2 punti dal giocatore 2 (player2). Dal momento che questo parametro è opzionale, il codice esistente non viene invalidato.
