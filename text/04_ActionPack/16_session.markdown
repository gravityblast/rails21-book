## session(:on)

Forse non lo sai, ma in Rails è poissibile disattivare le sessioni:

	class ApplicationController < ActionController::Base
	  session :off
	end

Nota che nel mio esempio. sto disattivando le sessioni per tutti i controller (**ApplicationController**), ma posso farlo anche solo per un singolo controller.

E se volessi solo un controller con le sessioni attivate ? In rails 2.1, il metodo accetta l'opzione **:on**, in questo modo:

	class UsersController < ApplicationController
	  session :on
	end
