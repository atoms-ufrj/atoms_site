#!/bin/bash
for code in $(grep 'K[0-9]\{7\}[A-Z][0-9]' people.md); do
  eval "wget -O images/$code.jpg \"http://servicosweb.cnpq.br/wspessoa/servletrecuperafoto?tipo=1&id=$code\""
done

