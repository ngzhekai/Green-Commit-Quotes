#!/bin/bash
# ++++++++++++++++++++++++++
#  Green-Commit-Quote by ngzhekai
# ++++++++++++++++++++++++++ 

source=$(curl https://zenquotes.io/api/random)

# Get the quote and author
quote=$(echo $source | jq -r .[].q)
author=$(echo $source | jq -r .[].a)
# Concatenate the string
output="## Get Your Daily Dose of Quotes!"
output1="### <q>${quote}</q> -<em>${author}</em> <br><br>"
output2="##### NOTE: These Quotes will be updated on a frequency basis of 2-3 hours ~"

echo $output > README.md
echo $output1 >> README.md
echo $output2 >> README.md

git config --local user.email "ngzhekai@gmail.com"
git config --local user.name "Hatsune Miku"
git commit -am "$quote"

