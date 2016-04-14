= Compiler

== Lex 
1. kompilieren
	1. flex dateiname.l
	2. gcc lex.yy.c -lfl -o output (lfl steht für die flex library, die gelinkt wird.)
	3. ./output
1. RegEx --> http://w3-o.cs.hm.edu/~ruckert/compiler/flex.html#SEC7
1. usage .start.sh regex-rules-file < data-input-file 
