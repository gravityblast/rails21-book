##Rimuovere gli spazi bianchi con il metodo squish

Due nuovi metodi sono stati aggiunti all'oggetto **String**: **squish** e **squish!**.

Questi metodi sono analoghi al metodo **strip**. Esso rimuove gli spazi bianchi presenti all'inizio ed alla fine del testo. Rimuove anche gli spazi inutili (spazi bianchi ripetuti) presenti all'interno del testo. Osservate l'esempio:

	“    A    text    full    of     spaces    “.strip
	#=> “A    text    full    of     spaces”

	“    A    text    full    of     spaces    “.squish
	#=> “A text full of spaces”
