#!/bin/bash
# ++++++++++++++++++++++++++
#  Green-commit by ngzhekai
# ++++++++++++++++++++++++++ 

if [ -f .env ]; then
    # Load Environment Variables
    export $(cat .env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )
fi

# Get SHA 
SHA=$(curl \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $token" \
  https://api.github.com/repos/$owner/$repo/contents/$path | jq -r '.sha')

source=$(curl https://zenquotes.io/api/random)

# Get the quote and author
quote=$(echo $source | jq -r .[].q)
author=$(echo $source | jq -r .[].a)
# Concatenate the string
output="### Commit Quotes <br> <br> <q>${quote}</q> -<em>${author}</em>"

# TEXT=$(curl https://api.github.com/zen)
# Encode to base64 format
CVT=$(echo -n $output | base64 -w0)

curl \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $token" \
  https://api.github.com/repos/$owner/$repo/contents/$path \
  -d "{\"message\":\"$quote\",\"committer\":{\"name\":\"Hatsune Miku\",\"email\":\"$email\"},\"content\":\"$CVT\",\"sha\":\"$SHA\"}"

