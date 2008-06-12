## Metodo table_exists?

Nuovo metodo per la classe **AbstractAdapter**: **table\_exists**. E' molto semplice da utilizzare:

	>> ActiveRecord::Base.connection.table_exists?("users")
	=> true
