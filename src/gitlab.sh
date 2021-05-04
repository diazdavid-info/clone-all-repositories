#!/bin/bash

function main() {
  done=false
  page=1
  clone_directory=/opt/workspace
  while [ $done = false ]; do
    repositories=$(curl -s https://"$GITLAB_DOMAIN"/api/v4/projects?page="$page"\&private_token="$GITLAB_TOKEN" | jq '.[]["ssh_url_to_repo"]')
    if [ "$repositories" = '' ]; then
      done=true
    else
      echo "$repositories" | awk '{system("git -C '"$clone_directory"' clone "$1)}'
      ((page += 1))
    fi
  done
  ls -la "$clone_directory"
}

main
