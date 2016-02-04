#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "usage: doi2bib <DOI>"; exit
fi
bib=$(curl -LH "Accept: application/x-bibtex;q=1" http://dx.doi.org/$1 && echo)
if [ ${bib:0:1} == @ ]; then
  echo "$bib"
else
  echo "# Error: DOI $1 not found"; exit 0
fi

