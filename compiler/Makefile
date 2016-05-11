
all: klx test.ps

klx: lex.yy.c klx.tab.c klx.tab.h symtab.h symtab.c
	gcc lex.yy.c klx.tab.c symtab.c -lfl -o klx

lex.yy.c: klx.l
	flex klx.l
	
klx.tab.c: klx.y
	bison -d klx.y
	
klx.tab.h: klx.y
	bison -d klx.y
	
test.ps: klx test.klx
	./klx < test.klx > test.ps
	
clean: 
	rm -f test.ps klx.tab.* lex.yy.c klx 
	rm -f *.bak *.o
