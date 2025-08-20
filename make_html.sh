#!/bin/bash
pandoc --number-sections --toc=true --toc-depth=2\
    --metadata title="Code & Sorcery: A Lua Card Game Quest" \
    -s -c style.css README.md -o docs/index.html
