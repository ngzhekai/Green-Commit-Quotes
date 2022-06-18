#!/bin/bash
source .env

SHA=$(curl \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $token" \
  https://api.github.com/repos/$owner/$repo/contents/$path | jq '.sha')

# TEXT=$(curl https://api.github.com/zen)

# CVT=$(echo -n $TEXT | base64)

curl \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $token" \
  https://api.github.com/repos/ngzhekai/Green-commit/contents/README.md \
  -d "{\"message\":\"Wise man says only fool rush in\",\"committer\":{\"name\":\"McKidKneeKaneSir\",\"email\":\"ngzhekai@gmail.com\"},\"content\":\"TWNLaWRLbmVlS2FuZVNpcg==\",\"sha\":\"$SHA\"}"

