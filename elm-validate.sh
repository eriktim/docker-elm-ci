#!/bin/bash

if [ $# -ne 1 ]; then
  printf "Run as\n  elm-validate <module>\n"
  exit 1
fi

elm-make --warn $1 --output /dev/null 2>&1 | tee /tmp/elm-validate
cat /tmp/elm-validate | grep WARNINGS > /dev/null
if [ $? -eq 0 ]; then
  printf "Validation failed!\n"
  exit 1
fi
