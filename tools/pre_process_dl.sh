#!/bin/bash

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

fi



