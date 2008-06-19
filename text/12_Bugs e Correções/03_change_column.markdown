##Bug fixes in change\_column

E' stato corretto un bug che si verificava quando si usava il metodo **change\_column** con **:null => true** su una colonna creata usando **:null => false**. A causa di questo bug non era possibile applicare cambiamenti usando questo metodo.
