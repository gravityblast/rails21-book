## ActiveRecord::Base.create accetta i blocchi

Abbiamo già utilizzato i blocchi con il metodo **ActiveRecord::Base.new**. Adesso possiamo fare la stessa cosa con il metodo **create**:

	# Creating an object and passing it a block describing its attributes
	User.create(:first_name => 'Jamie') do |u|
	  u.is_admin = false
	end

Possiamo anche utilizzare lo stesso metodo per creare più oggetti in una volta sola:

	# Creating an array of new objects using a block.
	# The block is executed once for each of object that is created.
	User.create([{:first_name => 'Jamie'}, {:first_name => 'Jeremy'}]) do |u|
	  u.is_admin = false
	end

E funziona anche con le associazioni:

	author.posts.create!(:title => "New on Edge") {|p| p.body = "More cool stuff!"}

	# or

	author.posts.create!(:title => "New on Edge") do |p|
	  p.body = "More cool stuff!"
	end
