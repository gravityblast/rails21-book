## Nuovi metodi per la classe DateTime

Per mantenere la compatibilità (duck-typing) come la classe Time, tre nuovi metodi sono stati aggiunti alla classe DateTime. I metodi in questione sono, #utc, #utc? e #utc_offset. Vediamo un esempio d'uso per ognuno di essi:

	>> date = DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24))
	#=> Mon, 21 Feb 2005 10:11:12 -0600

	>> date.utc
	#=> Mon, 21 Feb 2005 16:11:12 +0000

	>> DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24)).utc?
	#=> false

	>> DateTime.civil(2005, 2, 21, 10, 11, 12, 0).utc?
	#=> true

	>> DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24)).utc_offset
	#=> -21600
