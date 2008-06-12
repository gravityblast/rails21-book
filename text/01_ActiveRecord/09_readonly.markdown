## Relazioni readonly

Una nuova funzionalità viene aggiunta alle realzioni tra modelli. Per evitare cambiamenti dello stato di un modello ora potete utilizzare **:readonly** quando descrivete l'associazione. Date un'occhiata ai seguenti esempi:

	has_many :reports, :readonly => true

	has_one :boss, :readonly => :true

	belongs_to :project, :readonly => true

	has_and_belongs_to_many :categories, :readonly => true

In questo modo i vostri modelli associati non possono venire modificati all'interno del modello che li referenzia. Se cercate di modificarne uno, otterrete un'eccezione del tipo  **ActiveRecord::ReadOnlyRecord**.
