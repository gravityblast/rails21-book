## Conditional in the caches\_page method
    
Il metodo **caches\_page** ha ora l'opzione condizionale (**:if**). Vediamo un esempio:

	# The Rails 2.0 way
	caches_page :index

	# In Rails 2.1 è possibile usare l'opzione :if.
	caches_page :index, :if => Proc.new { |c| !c.request.format.json? }
