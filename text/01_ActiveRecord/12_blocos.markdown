## ActiveRecord::Base.create accetta i blocchi

Abbiamo già utilizzato i blocchi con il metodo **ActiveRecord::Base.new**. Adesso possiamo fare la stessa cosa con il metodo **create**:

	# Crea un oggetto e gli passa un blocco che ne descrive gli attributi
	User.create(:first_name => 'Jamie') do |u|
	  u.is_admin = false
	end

Possiamo anche utilizzare lo stesso metodo per creare più oggetti in una volta sola:

	# Crea un array di nuovi oggetti utilizzando un blocco
	# Il blocco viene eseguito per ogni oggetto creato.
	User.create([{:first_name => 'Jamie'}, {:first_name => 'Jeremy'}]) do |u|
	  u.is_admin = false
	end

E funziona anche con le associazioni:

	author.posts.create!(:title => "New on Edge") {|p| p.body = "More cool stuff!"}

	# oppure

	author.posts.create!(:title => "New on Edge") do |p|
	  p.body = "More cool stuff!"
	end
