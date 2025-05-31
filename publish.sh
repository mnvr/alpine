#!/bin/sh

# Convert Jupyter notebooks into HTML pages, tack on an index, and
# then push to the gh-pages branch on remote.

set -o xtrace
set -o errexit

git branch -D gh-pages
git checkout -b gh-pages
mkdir -p docs

jupyter nbconvert --to html --template classic --output-dir=docs *.ipynb
sed "s#<time></time>#<time>`date '+%b %d, %Y'`</time>#" index.html >docs/index.html

git add docs
git commit -m render
git push --force origin gh-pages
git checkout main
git push
