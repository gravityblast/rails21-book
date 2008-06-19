## Il metodo **sum**

### Espressioni nel metodo **sum**

Ora possiamo utilizzare espressioni nei metodi **ActiveRecord** che hanno a che fare con i calcoli, come **sum**, per esempio:

	Person.sum("2 * age")

### Modifiche nel valore di ritorno di default del metodo sum

Nelle precedenti versioni, quando utilizzavamo il metodo **sum** di **ActiveRecord** per calcolare la somma di tutte le righe di una tabella e nessuna riga soddisfava le condizioni espresse durante la chiamata del metodo, il valore di ritorno di default era **nil**.

In Rails 2.1 il valore di ritorno di default (cioè quando non viene trovata nessuna riga) è 0. Si veda l'esempio:

	Account.sum(:balance, :conditions => '1 = 2') #=> 0
