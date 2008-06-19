## Smallint, int oppure bigint in MySQL?

Ora l'adapter **MySQL** per **ActiveRecord** è più intelligente quando creiamo o modifichiamo le colonne nel database utilizzando i tipi interi. Conformemente all'opzione  **:limit**, viene stabilito il tipo della colonna come **smallint**, **int** oppure **bigint**. Date un'occhiata ai seguenti esempi:

	case limit
	when 0..3
	  "smallint(#{limit})"
	when 4..8
	  "int(#{limit})"
	when 9..20
	  "bigint(#{limit})"
	else
	  'int(11)'
	end

Adesso mappiamolo in un file **migration** e vediamo quali tipi vengono impostati per ogni colonna creata:

	create_table :table_name, :force => true do |t|

	  # 0 - 3: smallint
	  t.integer :column_one, :limit => 2 # smallint(2)

	  # 4 - 8: int
	  t.integer :column_two, :limit => 6 # int(6)

	  # 9 - 20: bigint
	  t.integer :column_three, :limit => 15 # bigint(15)

	  # if :limit is not informed: int(11)
	  t.integer :column_four # int(11)
	end

L'adapter **PostgreSQL** disponeva già di questa feature, quello **MySQL** è stato semplicemente allineato.
