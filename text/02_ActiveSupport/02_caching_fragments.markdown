## Fragment\_exist?

Due nuovi metodi sono stati aggiunti a **cache\_store**: **fragment\_exist?** e **exist?**.

Il metodo **fragment\_exist?** fa esattamente ciò che vi potete aspettare: verifica che un frammento di cache _informed by one_ esista.
Praticamente rimpiazza il ben noto:

	read_fragment(path).nil?

Il metodo **exist?** è stato aggiunto a **cache\_store**, mentre **fragment\_exist?** è un helper che potete utilizzare nel vostro controller.