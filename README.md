## Clone all repositories from Bitbucket
```
docker run --rm -it diazdavid/clone-all-repositories bitbucket
```

### Credentials
Bitbucket api need 3 parameters:
1. USER_NAME -> bitbucket user name
2. USER_PASS -> bitbucket app pass [app-passwords](https://bitbucket.org/account/settings/app-passwords/) **need read repositories permissions**
3. BITBUCKET_ORGANIZATION -> organization which you want to clone repositories

### ssh key
You need mount dir ssh for clone repository `-v $HOME/.ssh:/root/.ssh`

### Persistent storage
Data is stored in `/opt/workspace`, which can be used with `-v /docker/host/dir:/opt/workspace`

### Example
```
docker run --rm -it \
    -e USER_NAME:<user_name> \
    -e USER_PASS:<user_pass> \
    -e BITBUCKET_ORGANIZATION:<organization> \
    -v $HOME/.ssh:/root/.ssh \
    -v /docker/host/dir:/opt/workspace \ 
    diazdavid/clone-all-repositories bitbucket
```

