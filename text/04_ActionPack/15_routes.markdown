## Defining the location of your routes file

In rails 2.1 è possibile specificare in che file sono salvate le route, includendo la seguente in *enviroment.rb*:

	config.routes_configuration_file

Può essere utile in uno scenario in cui si hanno due front-end separati che condividono gli stessi moduli, librerie e plugin.

Per esempio, getsatisfaction.com e api.getsatisfaction.com condividono gli stessi modelli, ma non i controller, gli helper e le view. getsatisfaction ha il proprio file delle route con ottimizzazioni per migliorare il suo SEO, dato che il file route delle API non ha bisogno di ottimizzazioni SEO.