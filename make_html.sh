#!/bin/bash
pandoc --number-sections --toc=true --toc-depth=2\
    -s -c style.css README.md -o docs/index.html
