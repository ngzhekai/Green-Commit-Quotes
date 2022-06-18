#!/bin/bash
# ++++++++++++++++++++++++++
#  Green-commit by ngzhekai
# ++++++++++++++++++++++++++ 

# Get environment variables
source .env

# Get SHA 
SHA=$(curl \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $token" \
  https://api.github.com/repos/$owner/$repo/contents/$path | jq -r '.sha')

TEXT=$(curl https://api.github.com/zen)
CVT=$(echo -n $TEXT | base64)

curl \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $token" \
  https://api.github.com/repos/$owner/$repo/contents/$path \
  -d "{\"message\":\"Nothing\",\"committer\":{\"name\":\"Hatsune Miku\",\"email\":\"$email\"},\"content\":\"$CVT\",\"sha\":\"$SHA\"}"

