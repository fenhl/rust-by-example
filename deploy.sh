#!/bin/bash

rev=$(git rev-parse --short HEAD)

cd stage/_book

git init
git config user.name "Steve Klabnik"
git config user.email "steve@steveklabnik.com"
git remote add upstream "https://$GH_TOKEN@github.com/rust-lang/rust-by-example.git"
git fetch upstream && git reset --hard upstream/gh-pages

touch .

git add .

git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
