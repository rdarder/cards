#!/bin/bash
rm -rf docs/*

pandoc \
    --number-sections \
    --toc=true --toc-depth=2 \
    -s -c style.css \
    -t chunkedhtml \
    --data-dir=pandoc/ \
    README.md \
    -o docs/book.zip

unzip -d docs docs/book.zip
cp style.css docs
rm docs/book.zip
