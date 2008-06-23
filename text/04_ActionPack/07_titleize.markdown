## Applying title formatting in strings

C'era un bug usando il metodo **String#titleize** in una stringa che conteneva 's. Con questo bug, il metodo ritornava 's in maiuscolo. Ecco un esempio:

	>> "brando’s blog".titleize
	=> "Brando’S Blog"

Vediamo lo stesso esempio dopo la correzione del bug:	

	>> "brando’s blog".titleize
	=> "Brando’s Blog"
