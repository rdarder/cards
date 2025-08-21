#!/bin/bash
set -e

rm -rf docs
mkdir -p docs

FILES=$(ls -1 *.md)

echo "$FILES"

pandoc \
    --number-sections \
    --toc=true --toc-depth=2 \
    -s -c style.css \
    -t chunkedhtml \
    --data-dir=pandoc/ \
    $FILES \
    -o docs/book.zip

unzip -q -d docs docs/book.zip
cp style.css docs
rm docs/book.zip
