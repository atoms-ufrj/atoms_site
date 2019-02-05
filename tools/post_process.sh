#!/bin/bash

#---------------------------------------------------------------------------------------------------
# people
#---------------------------------------------------------------------------------------------------
sed -i -e 's/<p.*>//g' \
       -e 's/<\/p>//g' \
  en/people.html

#---------------------------------------------------------------------------------------------------
# publications
#---------------------------------------------------------------------------------------------------
sed -i -e 's/<p>//g' -e 's/<\/p>//g' \
       -e 's/(document)/\$(document)/' \
  en/publications.html

#---------------------------------------------------------------------------------------------------
# counter
#---------------------------------------------------------------------------------------------------
rm en/pages.html
for file in en/*.html; do
  base=$(basename $file .html)
  sed -i "s/\$currpagename/$base/" $file
  if [ ! -f "counter/logs/$base.txt" ]; then
    echo 0 > counter/logs/$base.txt
    chmod 666 counter/logs/$base.txt
  fi
done

#---------------------------------------------------------------------------------------------------
# workaround to fix layout of index (by Santos TJP & Segtovich ISV)
#---------------------------------------------------------------------------------------------------

sed -i "/class=\"headertitle\">/d" en/index.html
sed -i "/class=\"title\">Applied Thermodynamics and Molecular Simulation/d" en/index.html
cp ./layout/search.css ./en/search/search.css
