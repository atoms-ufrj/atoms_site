#!/bin/bash

#this script gets a DOI as cli arg and then accesses dx.doi site with curl to get the bib string
#and then echos it to stdout (terminal or pipe)

if [ "$#" -ne 1 ]; then
  echo "usage: doi2bib <DOI>"; exit
fi
bib=$(curl -LH "Accept: application/x-bibtex;q=1" http://dx.doi.org/$1 && echo)
if [ ${bib:0:1} == @ ]; then
  echo "$bib"
else
  echo "# Error: DOI $1 not found"; exit 0
fi

