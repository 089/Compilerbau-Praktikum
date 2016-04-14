

%x script
%x noscript
%x comments

%%

\<head\>(.|\n)*\<\/head\> ; // Head entfernen

\<!DOCTYPE\ html\> ; 

\<script  BEGIN(script); 
<script>.   ;
<script>\n  ;
<script>(\<\/script\>) BEGIN(0);

\<noscript  BEGIN(script); 
<noscript>.   ;
<noscript>\n  ;
<noscript>(\<\/noscript\>) BEGIN(0);

\<!--  BEGIN(comments); 
<comments>.   ;
<comments>\n  ;
<comments>--\> BEGIN(0);



%%

