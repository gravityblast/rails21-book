## Testing Helpers in a simple way

Una cosa veramente noiosa da fare nelle versioni precedenti di Rails era testare gli **helpers**. Ho già sofferto molto per assicurarmi il 100% di copertura, creando test per alcuni **helpers**.

Ciò diventa molto più semplica in rails 2.1 con la classe **ActionView::TestCase**: ecco un esempio::

	module PeopleHelper
	  def title(text)
	    content_tag(:h1, text)
	  end

	  def homepage_path
	    people_path
	  end
	end

Adesso vediamo come possiamo fare la stessa cosa il Rails 2.1:

	class PeopleHelperTest < ActionView::TestCase
	  def setup
	    ActionController::Routing::Routes.draw do |map|
	      map.people 'people', :controller => 'people', :action => 'index'
	      map.connect ':controller/:action/:id'
	    end
	  end

	  def test_title
	    assert_equal "<h1>Ruby on Rails</h1>", title("Ruby on Rails")
	  end

	  def test_homepage_path
	    assert_equal "/people", homepage_path
	  end
	end
