## Calculations 
                         
**ActiveRecord::Calculations** ha subìto lievi modifiche per supportare i nomi delle tabelle. Ciò torna utile quando avete relazioni tra tabelle differenti ma con nomi di colonna identici. Ora avete a disposizione queste due opzioni:

	authors.categories.maximum(:id)
	authors.categories.maximum("categories.id")
