## Migrations con timestamp

Quanto iniziate ad utilizzare Rails oppure a sviluppare qualcosa per conto vostro, le **migrations** sembrano essere la migliore soluzione a tutti i vostri problemi. Nonostante ciò, con un team di più sviluppatori sullo stesso progetto, troverete (se già non vi è successo) che diventa leggermente più complicato gestire le "dipendenze" (race condition) tra le migrations. Le nuove migrations con timestamp presenti in Rails 2.1 vengono in aiuto.

Prima dell'introduzione delle **timestamped migrations**, ogni nuova migration creata aveva un numero progressivo nel suo nome. Se due migrations vengono generate da due sviluppatori e non vengono notificate immediatamente (nel repository comune), poteva succedere di avere due migrazioni differenti con stesso numero progressivo, beché aventi contenuto differente. A questo punto il vostro schema_info non era aggiornato e avevate un'inconsistenza nella vostra applicazione.

Esistevano diverse soluzioni a questo problema. Diversi plugin sono stati creati per risolvere questo problema con differenti approcci. Nonostante i plugin disponibili una cosa era chiara: la vecchia maniera era semplicemene inadatta.

Se stavate usando Git allora avreste potuto avere problemi più pesanti, in quanto il vostro team probabilmente aveva una coppia di branches e delle **migrations** inconsistenti in ognuna di esse. Avreste avuto seri problemi di conflitti durante il merging dei branches.

Per risolvere questo grave problema il core team ha cambiato il modo in cui le **migrations** operano in Rails. Anziché anteporre ad ogni nome di file delle migrazioni un numero progressivo (corrispondente al valore corrente di schema_count), adesso si utilizza una stringa basata sul tempo **UTC** e corrispondente al formato YYYYMMDDHHMMSS.

Inoltre, è stata introdotta una nova tabella chiamata **schema_migrations** che tiene traccia di quali **migrations** sono già state eseguite. In questo modo, se qualcuno crea una **migration** con un numero "più piccolo", Rails esegue un **rollback** delle migration fino alla versione precedente e quindi riesegue le migrations fino alla versione corrente.

Apparentemente questo risolve il problema del conflitto nelle **migrations**.

Ci sono anche nuovi task rake per "attraversare" le **migrations**:

	rake db:migrate:up
	rake db:migrate:down
