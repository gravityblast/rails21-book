## Dettagli

Il focus principale dei cambiamenti in Rails riguardano Ruby 1.9, persino i minori dettagli sono stati analizzati per incrementare la compatibilità con la nuova versione di Ruby. I dettagli come i cambiamenti da File.exists? a File.exist? non sono stati tralasciati.

In Ruby 1.9, il modulo Base64 (base64.rb) è stato rimosso, e per questo tutti i riferimenti ad esso sono stati sostituiti da ActiveSupport::Base64.
