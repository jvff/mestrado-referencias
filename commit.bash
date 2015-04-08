#!/bin/bash

title="$(sed -ne 's/\ttitle={\(.*\)},\?$/\1/p' ref.bib | tail -n 1)"
ref="$(sed -ne '/^--*$/{g;s/:$//;p};h' ref.txt  | tail -n 1)"
file="$(mktemp)"

cat > "$file" << EOF
Resumo da referência $ref

- $title
EOF

vim "$file"

git commit -a -F "$file"

rm "$file"
