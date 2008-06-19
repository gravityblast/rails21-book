## Auto Link

Il metodo **auto\_link** prende un qualunque testo come parametro, e se in questo testo sono presenti indirizzi realtivi as e-mail o siti internet, restituisce lo stesso testo ma con i link.

[TODO: è correttp l'esempio?]

Ad esempio:

	auto_link("Visita questo sito ora: http://www.rubyonrails.com")
	# => Visita questo sito ora: http://www.rubyonrails.com

Alcuni siti, come Amazon, utilizzano il simbolo "=" nei loro URL. Questo metodo non riconosce quel simbolo. Ecco come si comporta in questo caso:

	auto_link("http://www.amazon.com/Testing/ref=pd_bbs_sr_1")
	# => http://www.amazon.com/Testing/ref

Si noti come il metodo tronchi il link esattamente prima del simbolo "=", prima di Rails 2.1 questo simbolo non era supportato.

Lo stesso metodo è stato successivamente aggiornato per consentire l'utilizzo degli URL con parentesi.

Un esempio di URL con parentesi:

	http://en.wikipedia.org/wiki/Sprite_(computer_graphics)
