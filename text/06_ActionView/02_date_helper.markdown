## ActionView::Helpers::DateHelper

Ora, tutti questi metodi del moduli che trattano le date (**date\_select**, **time\_select**, **select\_datetime**, ecc.) accettano le opzioni **HTML**. Osservare l'esempio che usa **date\_select**

	<%= date_select 'item','happening', :order => [:day], :class => 'foobar'%>
	
### date\_helper

Il metodo **date\_helper** è stato modificato per usare **Date.current** per poter definire i suoi valori predefiniti.
