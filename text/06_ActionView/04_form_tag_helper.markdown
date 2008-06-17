## ActionView::Helpers::FormTagHelper

### submit\_tag

È stata aggiunta l'opzione **:confirm** nei parametri del metodo **#submit\_tag**. Questa opzione funziona allo stesso modo del metodo **link\_to**. Si osservi l'esempio:

	submit_tag('Salva le modifiche', :confirm => "Sei sicuro?")
