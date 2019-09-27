#!/bin/bash

echo "Starting to build site..."
URLS=$(find pdfs/ -name *.pdf | sed 's:\./::' | sed 's|.*|<li><a href="https://gitlab.com/clovis-ai/enseirb-info/-/jobs/artifacts/master/raw/&?job=pdf">&</a></li>|')

echo $URLS

cat html/index-header.html > public/index.html
echo $URLS >> public/index.html
cat html/index-footer.html >> public/index.html
