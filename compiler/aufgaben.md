* 13.04.2016
	1. Default-Aktion von Lex, wenn kein Match: stdin > stdout 
        ==> Fehlermeldung für unbekannte Tokens (aber nicht bei Leerzeichen, Tabs, etc.)
	1. Einen weiteren Klecks. 
* 20.04.2016
	1. Optionen hinzufügen
* 27.04.2016
	1. Circle, Square, Triangle, 
	1. Optionen: Position, Drehung, Skalieren (scale 50 %, scale 30% 70%)
	1. Farben rgb, hue, namen

* 11.05.2016
	1. floating point numbers --> atomic
	1. double atof(const char *nprt) --> string to double --> %f
	1. define before use policy; z.B. VAR x; --> neues stmt: ID ECCL; $1->defined = 1;
		- if $1->defined dann ...
		- --> zusätzliche int initialized in symtab.h
* 25.05.2016
	1. debugging mit 
		1. flex -d
		1. bison -v, erzeugt klx.output
		1. bison -t macht tracing mit yydebug=1; kann man das ein- bzw. aussschalten, auch mitten im Code, z.B. `product: product { yydebug=1; } MUL exponent { yydebug=0; } { printf("mul "); };`
* 01.06.2016
	1. Kontrollstrukturen (if, else, while)
	1. <, >, ==, !=, &&, ||, not, (), geht analog zur Arithmetik --> AND = MUL, OR = PLUS/MINUS, NOT = prefix
	1. Schleifen
		1. while do begin
			1. gibt es in PS nicht
			1. ==> { { not exit} if \n code ... } loop wiederholt ewig
			1. nur bei bestimmter Bedingung: exit
	1. if-else 
	1. (optional) repeat aus PS
	1. (optional) for loop (loop exit)
* 08.06.2016, Weiterparsen trotz Fehlermeldungen
    1. Error-Recovery-Regeln an sinnvollen Stellen einbauen
    1. Überblick 
        1. Kommende Woche: lokale Variablen
        1. Übernächste Woche: Prozeduren (Parametrisierte Objekte)
        1. Dann: Testat; "Wie gehen Sie aktiv mit ihrem Compiler um?"
* 15.06.2016
    1. Aktuell geht: if (x < 5) then Dekla 5 ==> Deklarationen nicht mehr als stmt ermöglichen. ==> dekl und dekllists (z.B. nicht hinter einem THEN) 
    1. Fehlermeldungen schreiben zur Compilezeit (nach mgl. nicht zur Laufzeit.
    1. Testfälle ...
    1. Wo erlaubt man Deklarationen usw. 
* 22.06.2016
    1. Deklaration nicht mehr stmt
    1. Deklaration -> Prozeduren
    1. Prozeduren
        1. Einschränken: Wo Deklarationen und welche
        1. Prüfen, ob Variablen in Prozeduren funzen
        1. Rekursion sollte funktionieren
        1. Zugriff auf lokale und globale Variablen
        1. Compile Time Errors statt Runtime Warnings (z.B. dot()=0, x(4), x=dot())
        1. (Funktionen; sind atomare Aufrufe)
