## change\_table

La creazione di **migrations** in Rails 2.0 era stata migliorata rispetto alle precedenti versioni, ma modificare una tabella utilizzando le **migrations** non era poi così comodo.

In Rails 2.1 modificare una tabella è diventato più semplice grazie al metodo **change\_table**. Date un'occhiata ai seguenti esempi:

	change_table :videos do |t|
	  t.timestamps # this adds columns created_at and updated_at
	  t.belongs_to :goat # this adds column goat_id (integer)
	  t.string :name, :email, :limit => 20 # this adds columns name and email
	  t.remove :name, :email # this removes columns name and email
	end

Il nuovo metodo **change\_table** funziona in modo simile al "cugino" **create\_table** ma anziché creare una nuova tabella, semplicemente modifica una tabella esistente aggiungendo o rimuovendo colonne ed indici.

	change_table :table do |t|
	  t.column # adds an ordinary column. Ex: t.column(:name, :string)
	  t.index # adds a new index.
	  t.timestamps
	  t.change # changes the column definition. Ex: t.change(:name, :string, :limit => 80)
	  t.change_default # changes the column default value.
	  t.rename # changes the name of the column.
	  t.references
	  t.belongs_to
	  t.string
	  t.text
	  t.integer
	  t.float
	  t.decimal
	  t.datetime
	  t.timestamp
	  t.time
	  t.date
	  t.binary
	  t.boolean
	  t.remove
	  t.remove_references
	  t.remove_belongs_to
	  t.remove_index
	  t.remove_timestamps
	end
