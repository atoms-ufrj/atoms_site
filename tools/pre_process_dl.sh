#!/bin/bash

#this is exactly equal to "pre_process.sh" but with download on
# To Do : unify both files and conditionally download according to some cli arg flag

mkdir -p proc

#---------------------------------------------------------------------------------------------------
# people
#---------------------------------------------------------------------------------------------------
if [ $# == "0" ] || [ $1 == "people" ]; then
  address="http://servicosweb.cnpq.br/wspessoa/servletrecuperafoto?tipo=1&id="
  for code in $(grep 'lattes-K[0-9]\{7\}[A-Z][0-9]' pages/people.md | cut -d "-" -f2); do
    image="images/$code.jpg"
    options="--retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0"
    #removed --continue because of weird behavior - file size increased bud renderend picture was the same as before
    for i in $(seq 1 20); do
      echo "wget $options -O $image \"$address$code\""
      eval "wget $options -O $image \"$address$code\""
      if [ $? = 0 ]; then break; fi; # check return value, break if successful (0)
      sleep 1s;
    done;
    width=$(identify -format "%w" $image)
    if [ "$width" -gt "200" ]; then
      percent=$(echo "20000/$width" | bc)
      eval "convert -resize $percent% $image $image"
    fi
  done
  before="<table id=\"gradient-style-large\"><tr><th><\/th><th><h2>"
  after="<\/h2><\/th><\/tr><tr><td><\/td><td>"
  code="K[0-9]{7}[A-Z][0-9]"
  link="http:\/\/buscatextual.cnpq.br\/buscatextual\/visualizacv.do?id="
  attr="target=\"_blank\" title=\"Curriculum vitae\""
  pre="\@htmlonly\n<\/td><\/tr><tr><td>"
  post="<\/td><td>\n\@endhtmlonly"
  sed -r -e "s/\@header:(.*)/$before\1$after/g" \
    -e "s/\@endheader/<\/td><\/tr><\/table>\n<hr>\n/g" \
    -e "s/(Ksemfoto)/$pre<a href=\"$link\1\" $attr><img src=\"..\/images\/Ksemfoto.jpg\"><\/a>$post/g" \
    -e "s/lattes-($code)/$pre<a href=\"$link\1\" $attr><img src=\"..\/images\/\1.jpg\"><\/a>$post/g" \
  pages/people.md > proc/people.md
fi



