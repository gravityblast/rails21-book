## flash.now now works in tests

Chi non ha avuto mal di testa per questo ? Il problema era che durante i test non potevamo mai confermare se un messaggio era salvato in flash, perchè veniva cancellato da Rila prima di accedere al tuo test.

In rails 2.1 il problema è stato risolto. Ora è possibile includere codice come questo nei test:

	assert_equal '>value_now<', flash['test_now']
