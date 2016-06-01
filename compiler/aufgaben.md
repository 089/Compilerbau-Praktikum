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
