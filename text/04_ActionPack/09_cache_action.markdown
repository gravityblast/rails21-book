## caches\_action accepts conditionals

Il metodo **caches\_action** ora accetta l'opzione **:if**, permettendo l'uso di una condizione che specifica quando l'**azione** deve essere messa in **cache**. Per esempio:

	caches_action :index, :if => Proc.new { |c| !c.request.format.json? }

Nell'esempio sopra, l'azione ** index** verrà messa in **cache** solo se non viene richiamata da una request di tipo JSON.
