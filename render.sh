#!/bin/sh

# Convert Jupyter notebooks into HTML pages, tack on an index, and
# then push to the gh-pages branch on remote.

# git checkout gh-pages
mkdir -p docs

jupyter nbconvert --to html --template classic --output-dir=docs *.ipynb
