##Eager Loading

Per illustrare questa nuova funzionalità osserviamo il seguente codice:

	Author.find(:all, :include => [:posts, :comments])

Sto cercando nella tabella **authors**, includendo anche le tabelle **posts** e **commenti**, attraverso la colonna **author\_id**, la quale è il nome di default in accordo con le convenzioni di Rails per i nomi delle foreign\_key.

La query risultante è simile alla seguente:	

	SELECT
	  authors."id"          AS t0_r0,
	  authors."created_at"  AS t0_r1,
	  authors."updated_at"  AS t0_r2,
	  posts."id"            AS t1_r0,
	  posts."author_id"     AS t1_r1,
	  posts."created_at"    AS t1_r2,
	  posts."updated_at"    AS t1_r3,
	  comments."id"         AS t2_r0,
	  comments."author_id"  AS t2_r1,
	  comments."created_at" AS t2_r2,
	  comments."updated_at" AS t2_r3
	FROM
	  authors
	  LEFT OUTER JOIN posts ON posts.author_id = authors.id
	  LEFT OUTER JOIN comments ON comments.author_id = authors.id

Esattamente una lunga query SQL con **joins** tra le tabelle **authors**, **posts** e **comments**. Questo si chiama un **prodotto cartesiano**.

Questo tipo di query non sempre esprime delle buone performance, per questo è stata cambiata in Rails 2.1. La stessa query per la class **Author** ora utilizza un approccio diverso per recuperare le informazioni da tutte e tre le tabelle. Anziché usare una query SQL con le tre tabelle, ora Rails usa tre query distinte - una per ogni tabella - le quali sono più brevi rispetto alla soluzione precedente. Il risultato può essere visto nel log dopo aver eseguito il precedente codice ruby on rails:

	SELECT * FROM "authors"
	SELECT posts.* FROM "posts" WHERE (posts.author_id IN (1))
	SELECT comments.* FROM "comments" WHERE (comments.author_id IN (1))

In **molti casi** tre query semplici vengono eseguite più velocemente rispetto ad un'unica lunga query.
