#!/bin/bash
# ++++++++++++++++++++++++++
#  Green-Commit-Quote by ngzhekai
# ++++++++++++++++++++++++++ 

source=$(curl https://zenquotes.io/api/random)

# Get the quote and author
quote=$(echo $source | jq -r .[].q)
author=$(echo $source | jq -r .[].a)
# Concatenate the string
output="### Commit Quotes <br> <br> <q>${quote}</q> -<em>${author}</em>"

echo $output > README.md

git config --local user.email "ngzhekai@gmail.com"
git config --local user.name "Hatsune Miku"
git commit -am "$quote"

