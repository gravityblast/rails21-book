## ActionView::Helpers::AssetTagHelper

### register\_javascript\_expansion

Questo metodo registra uno o più file javascript per essere inclusi quando un simbolo, definito dal programmatore, è dato come parametro al metodo **javascript\_include\_tag**. L'idea è di chiamare questo metodo dentro il file  **init.rb** del plugin, per registrare i file javascript che il plugin mette in **public/javascripts**. Ecco come funziona:

	# Nel file the init.rb
	ActionView::Helpers::AssetTagHelper.register_javascript_expansion 
		:monkey => ["head", "body", "tail"] 

	# Nella view:
	javascript_include_tag :monkey

	# Otteremo qualcosa come:
	<script type="text/javascript" src="/javascripts/head.js"></script>
	<script type="text/javascript" src="/javascripts/body.js"></script>
	<script type="text/javascript" src="/javascripts/tail.js"></script>


### register\_stylesheet\_expansion


Questo metodo fa esattamente lo stesso di **ActionView::Helpers::AssetTagHelper#register\_javascript\_expansion**, ma crea un simbolo per essere usato dopo tramite il metodo **stylesheet\_link\_tag**. Si osservi l'esempio:

	# Nel file the init.rb
	ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion 
		:monkey => ["head", "body", "tail"] 

	# Nella view:
	stylesheet_link_tag :monkey

	# Otteremo qualcosa come:
	<link href="/stylesheets/head.css"  media="screen" rel="stylesheet" 
		type="text/css" />
	<link href="/stylesheets/body.css"  media="screen" rel="stylesheet" 
		type="text/css" />
	<link href="/stylesheets/tail.css"  media="screen" rel="stylesheet" 
		type="text/css" />
