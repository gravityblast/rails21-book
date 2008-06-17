## ActionController::Caching::Sweeping

Nelle precedenti versioni di rails, quando si dichiarava uno **sweeper**, dovevamo informare la classe usando i simboli:

	class ListsController < ApplicationController
	  caches_action :index, :show, :public, :feed
	  cache_sweeper :list_sweeper,
	                :only => [ :edit, :destroy, :share ]
	end

Ora è possibile dichiarare una classe invece di usare un simbolo. Questo è necessario, per esempio, se il proprio **sweeper** è dentro un modulo. Sebbene si possano ancora usare i simboli per altri casi, da adesso è possibile farlo anche in questo modo:

	class ListsController < ApplicationController
	  caches_action :index, :show, :public, :feed
	  cache_sweeper OpenBar::Sweeper,
	                :only => [ :edit, :destroy, :share ]
	end
