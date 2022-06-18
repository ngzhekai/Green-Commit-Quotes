#!/bin/bash
dir="Green-commit"
cd /home/zhekai/Projects/
if [[ ! -e $dir ]]; then
    git clone git@github.com:ngzhekai/Green-commit.git
fi
cd $dir
git pull
echo "green" >> green.txt
git add .
git commit -am "."
git push
