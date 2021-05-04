#!/bin/bash

function main() {
  done=false
  page=1
  clone_directory=/opt/workspace
  while [ $done = false ]; do
    repositories=$(curl -s -u "$USER_NAME":"$USER_PASS" https://api.bitbucket.org/2.0/repositories/"$BITBUCKET_ORGANIZATION"?sort=name\&page="$page" | jq '.["values"][]["links"]["clone"][1]["href"]')
    if [ "$repositories" = '' ]; then
      done=true
    else
      echo "$repositories" | awk '{system("git -C '"$clone_directory"' clone "$1)}'
      ((page+=1))
    fi
  done
  ls -la "$clone_directory"
}

main