## Metodi add\_timestamps e remove\_timestamps       

Adesso disponiamo di due nuovi metodi: **add\_timestamps** e **remove\_timestamps**. Essi aggiungono e rimuovono, rispettivamente, colonne **timestamp**. Date un'occhiata al seguente esempio:

	def self.up
	  add_timestamps :feeds
	  add_timestamps :urls
	end

	def self.down
	  remove_timestamps :urls
	  remove_timestamps :feeds
	end
