#!/bin/bash
file=$(mktemp)
for i in .git pages tools layout proc Makefile Doxyfile README.md; do
  echo $i
done > $file
rsync -rvplatz --progress --rsh="ssh -p 4556" --exclude-from "$file" \
    ./ wwwatoms@atoms.peq.coppe.ufrj.br:/home/wwwatoms/

