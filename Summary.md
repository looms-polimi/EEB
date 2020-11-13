# EEB

La Libreria Modelica **EEB** contiene modelli per la simulazione dinamica di edifici e dei relativi impianti, descritti a livello di sistema per effettuare studi di scenario volti principalmente - ma non esclusivamente - all'efficientamento energetico.

Caratteristiche peculiari della libreria, che può essere usata con il traduttore free OpenModelica in modo da massimizzarne le possibilità di diffusione e utilizzo, sono

1. la presenza sia di modelli di primo principio abbastanza dettagliati (pur se comunque orientati a studi di sistema) che di modelli semplificati in modo da essere parameterizzabili con le informazioni tipicamente disponibili in sede di progetto - appunto - di sistema;
2. una descrizione problem-specific delle sostanze coinvolte nella fisica dei componenti, per alleggerire computazionalmente i modelli di grandi dimensioni che possono rendersi necessari per il tipo di studi cui si fa riferimento;
3. la rappresentazione del controllo sia come modelli a tempo continuo con gestione di eventi, per massimizzare l'efficianza di simulazine usando per esempio solutori a passo variabile, sia come modelli a tempo discreto descriventi il codice di controllo a livello "quasi-replica", in modo da valutare la correttezza del codice medesimo; la libreria garantisce consistrnza tra i due suddetti tipi di modelli, per ognuno ovviamente nei limiti della sua espressività.

La libreria è stata scritta nel contesto del progetto di ricerca EEB (2014-2017) e in esso è stata estensivamente impiegata come strumento di supporto alle decisioni e alle scelte progettuali e di efficientamento. E' stata poi ulterioremente sviluppata e manutenuta al di là del progetto medesimo, generando anche fork specializzati a specifici problemi applicativi.

Questo repository contiene la libreria e del materiale accessorio relativo agli studi effettuati.


