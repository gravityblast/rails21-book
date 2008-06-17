## ActionView::Helpers::TextHelper

### excerpt

Il metodo **excerpt** è un helper che trova una parola dentro un testo e restituisce un'abbreviazione di quel testo con il numero di caratteri, dati come parametro, prima e dopo la parola. Se necessario verranno aggiunti "…". Esempio:

	excerpt('This is an example', 'an', 5)
	# => "…s is an examp…"

Il problema è che è sbagliato. Il metodo ha restituito 6 caratteri e non 5. Questo bug è stato corretto. Ecco l'output corretto di questo metodo:

	excerpt('This is an example', 'an', 5)
	# => "…s is an exam…"
	
###simple\_format

Il metodo **simple\_format** principalmente riceve come parametro un qualsiasi testo e lo formatta in modo semplice in **HTML**. Prende il testo e sostituisce a capo (\n) con il tag **HTML** "< br />" e quando si hanno due a capo consecutivi (\n\n) separa il testo nel paragrafo con il tag "< p>".

In Rails 2.1 questo metodo supporta ulteriori parametri. Oltre al testo, si può specificare quali attributi **HTML** vogliamo che il tag "< p>" abbia. Esempio: 

	simple_format("Hello Mom!", :class => 'description')
	# => "<p class=’description’>Hello Mom!</p>"

Gli attributi **HTML** saranno aggiunti in tutti i tag "< p>" creati dal metodo.
