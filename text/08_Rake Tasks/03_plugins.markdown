## Plugin

### Gemme ora come plugin

Ora, ogni gemma contenente il file **rails/init.rb** può essere installata all'interno della cartella **vendor** del vostro progetto Rails come un normale **plugin**.

### Utilizzare i generators dei plugin

E' possibile configurare **Rails** per ricercare **plugins** in cartelle diverse dalla cartella **vendor/plugins** semplicemente includendo questa linea di codice all'interno del file **environment.rb**.

	config.plugin_paths = ['lib/plugins', 'vendor/plugins']
	
Rails 2.0, comunque, ha un bug in questa configurazione che si manifesta quando il plugin ha dei generators. A causa di questo bug Rails riconosce solo i generators presenti all'interno della cartella **vendor/plugins**. In Rails 2.1 questo bug è stato risolto.