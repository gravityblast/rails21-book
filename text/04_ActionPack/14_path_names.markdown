## Path Names

I lettori del mio blog (http://www.nomedojogo.com) dovrebbero conoscere il mio plugin **Custom Resource Name**. Credo morirà molto presto... :(

In rails è già possibile includere l'opzione **:as** all'interno delle route (qualcosa che ho implementato nel mio plugin per mantenere la compatibilità), ora è possibile avere anche l'opzione **:path\_names** per cambiare il nome dell'azione.
	
	map.resource :schools, :as => 'escolas', :path_names => { :new => 'nova' }

Ovviamente, il mio plugin continua a essere utile per utenti che usano versione di Rails precedenti.
