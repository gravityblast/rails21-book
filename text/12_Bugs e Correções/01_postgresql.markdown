## Aggiungere colonne in PostgreSQL

C'era un bug usando **PostgreSQL**. Il problema si presentava quando si voleva creare una migration per aggiungere una colonna ad una tabella esistente. Osservate l'esempio:

File: *db/migrate/002\_add\_cost.rb*

	class AddCost < ActiveRecord::Migration
	  def self.up
	    add_column :items, :cost, :decimal, :precision => 6, 
	   :scale => 2
	  end

	  def self.down
	    remove_column :items, :cost
	  end
	end

Notate che stiamo creando una colonna con **:precision => 6** e **:scale => 2**. Ora lanciamo **rake db:migrate**  e vediamo come si presenta la tabella nel database:

<table border="1" cellspacing="0" cellpadding="5">
	<tr>
		<td><strong>Column</strong></td>
		<td><strong>Type</strong></td>
		<td><strong>Modifiers</strong></td>
	</tr>
	<tr>
		<td>id</td>
		<td>integer</td>
		<td>not null</td>
	</tr>
	<tr>
		<td>descr</td>
		<td>character varying(255)</td>
		<td></td>
	</tr>
	<tr>
		<td>price</td>
		<td>numeric(5,2)</td>
		<td></td>
	</tr>
	<tr>
		<td>cost</td>
		<td>numeric</td>
		<td></td>
	</tr>
</table>

Guardate la colonna "cost" che abbiamo appena creato. E' semplicemente **numeric**, mentre volevamo ottenere una colonna simile a "price", che come possiamo vedere sopra è un **numeric(6,2)**. Con Rails 2.1 questo errore non c'è più, e la colonna verrà creata correttamente.   
