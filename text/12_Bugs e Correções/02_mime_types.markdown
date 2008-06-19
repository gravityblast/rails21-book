##Mime Types

E' stato corretto un bug che non permetteva di assegnare l'attributo **request.format** usando un simbolo. Ora possiamo utilizzare il seguente codice:

	request.format = :iphone
	assert_equal :iphone, request.format
