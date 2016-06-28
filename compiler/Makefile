
all: klx minion.ps

klx: lex.yy.c klx.tab.c klx.tab.h symtab.h symtab.c
	gcc lex.yy.c klx.tab.c symtab.c -lfl -o klx

lex.yy.c: klx.l
	flex klx.l
	
klx.tab.c: klx.y
	bison -d -v -t klx.y
	
klx.tab.h: klx.y
	bison -d -v -t klx.y
	
test.ps: klx test.klx
	./klx < test.klx > test.ps
	
minion.ps: klx minion.klx
	./klx < minion.klx > test.ps
	
lokalevariablen.ps: klx lokalevariablen.klx
	./klx < lokalevariablen.klx > test.ps
	
testat.ps: klx testat.klx
	./klx < testat.klx > test.ps
	
clean: 
	rm -f test.ps klx.tab.* lex.yy.c klx 
	rm -f *.bak *.o
