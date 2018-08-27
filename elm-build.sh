#!/bin/sh

set -e

if [ "$#" -ne 2 ] || [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: elm-build <src> <dst>"
  echo "Turn your Elm code in a small JavaScript asset by optimizing and uglifying."
  echo ""
  echo "  src   main Elm module, e.g. 'src/Main.elm'"
  echo "  dst   JavaScript file, e.g. 'dist/app.js'"
  exit 1
fi

src="$1"
js=/tmp/elm.js
min="$2"

elm make --optimize --output=$js $src

uglifyjs $js --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | uglifyjs --mangle --output=$min

echo "Compiled size:$(cat $js | wc -c) bytes  ($js)"
echo "Minified size:$(cat $min | wc -c) bytes  ($min)"
echo "Gzipped size: $(cat $min | gzip -c | wc -c) bytes"
