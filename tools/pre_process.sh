#!/bin/bash

before="<table id=\"gradient-style-large\"><tr><th><\/th><th><h2>"
after="<\/h2><\/th><\/tr><tr><td><\/td><td>"
code="K[0-9]{7}[A-Z][0-9]"
link="http:\/\/buscatextual.cnpq.br\/buscatextual\/visualizacv.do?id="
attr="target=\"_blank\" title=\"Curriculum vitae\""
sed -r -e "s/\@header:(.*)/$before\1$after/g" \
       -e "s/\@end/<\/td><\/tr><\/table>\n<hr>\n/g" \
       -e "s/($code)/\@htmlonly\n<\/td><\/tr><tr><td><a href=\"$link\1\" $attr><img src=\"\1.jpg\"><\/a><\/td><td>\n\@endhtmlonly/g" $1

