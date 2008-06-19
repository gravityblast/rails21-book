## Named_scope
              
La gemma *has\_finder* è stata aggiunta a Rails con un nome differente: **named\_scope**.

Per comprendere pienamente cosa porta a Rails questa aggiunta osserviamo gli esempi seguenti:

	class Article < ActiveRecord::Base
	  named_scope :published, :conditions => {:published => true}
	  named_scope :containing_the_letter_a, :conditions => "body LIKE '%a%’"
	end 

	Article.published.paginate(:page => 1)
	Article.published.containing_the_letter_a.count
	Article.containing_the_letter_a.find(:first)
	Article.containing_the_letter_a.find(:all, :conditions => {…})

Anziché creare un nuovo metodo **published** che restituisca tutti i post pubblicati, utilizziamo un **named\_scope** che lo faccia per noi. Ma fa ben più di questo. Osserviamo un ulteriore esempio su come possa essere utilizzato:
 
	named_scope :written_before, lambda { |time|
	  { :conditions => ['written_on < ?', time] }
	}

	named_scope :anonymous_extension do
	  def one
	    1
	  end
	end

	named_scope :named_extension, :extend => NamedExtension 

	named_scope :multiple_extensions, 
		:extend => [MultipleExtensionTwo, MultipleExtensionOne]

## Testare named\_scope con proxy\_options 

I **named scopes** sono una nuova feature molto interessante per Rails 2.1, ma dopo averli usati per un po' potreste avere difficoltà nello scrivere dei test in contesti più complessi.

Osserviamo un esempio:                                                           

		class Shirt < ActiveRecord::Base
		  named_scope :colored, lambda { |color|
		    { :conditions => { :color => color } }
		  }
		end

Come scriviamo un test che valida la corretta generazione dello scope ?

Per risolvere questo problema è stato introdotto il metodo **proxy\_options**. Esso ci permette di esaminare le opzioni utilizzate in **named_scope**. Per testare il precedente codice potremmo scrivere:

		class ShirtTest < Test::Unit
		  def test_colored_scope
		    red_scope = { :conditions => { :colored => 'red' } }
		    blue_scope = { :conditions => { :colored => 'blue' } }
		    assert_equal red_scope, Shirt.colored('red').scope_options
		    assert_equal blue_scope, Shirt.colored('blue').scope_options
		  end
		end
