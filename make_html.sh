#!/bin/bash
pandoc --number-sections --toc=true \
    --metadata title="Code & Sorcery: A Lua Card Game Quest" \
    -s -c style.css README.md -o html/cards.html
