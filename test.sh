#!/bin/bash
source .env

SHA=$(curl \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $token" \
  https://api.github.com/repos/$owner/$repo/contents/$path | jq '.sha')

curl \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $token" \
  https://api.github.com/repos/ngzhekai/Green-commit/contents/README.md \
  -d '{"message":"a new commit message","committer":{"name":"Gilbert Octocat","email":"ngzhekai@gmail.com"},"content":"bXkgdXBkYXRlZCBmaWxlIGNvbnRlbnRz","sha":'$SHA'}'


