

%x script

%%

\<head\>(.|\n)*\<\/head\> ; // Head entfernen


\<script\>  BEGIN(script); 
<script>.   ;
<script>\n  ;
<script>\<\/script\>   BEGIN(INITAL);




%%
