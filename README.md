# docker-images
various builds for docker images


## building

```bash
make
```

## bash functions

These `*-dev` images are primarily used as shell wrappers for testing on
various linuxes.

```bash
function fedora() {
  if [ ${#SSH_AUTH_SOCK} -gt 0 ] ; then
    local vsock="-v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK"
  fi
  if [ ${#XAUTHORITY} -gt 0 ] ; then
    local vxauth="-v $XAUTHORITY:$XAUTHORITY"
  fi
  docker run \
    --rm \
    -i -t \
    --hostname=$(hostname -s)-fedora \
    -v $HOME:$HOME \
    ${vxauth} \
    -v /tmp/.ICE-unix/:/tmp/.ICE-unix/ \
    ${vsock} \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/bin/docker:/usr/bin/docker:ro \
    --env HOME \
    --env XAUTHORITY \
    --env SESSION_MANAGER \
    --env DISPLAY \
    --user $USER \
    --env SSH_AUTH_SOCK \
    --env PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin \
    --privileged \
    --workdir $(pwd) \
    ${1+"$@"} \
    docker.usersys/${USER}/fedora-dev
}

function ubuntu() {
  if [ ${#SSH_AUTH_SOCK} -gt 0 ] ; then
    local sock="-v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK"
  fi
  docker run \
    --rm \
    -i -t \
    --hostname=$(hostname -s)-ubuntu \
    -v $HOME:$HOME \
    ${sock} \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/bin/docker:/usr/bin/docker:ro \
    --env HOME \
    --user $USER \
    --env SSH_AUTH_SOCK \
    --env PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin \
    --privileged \
    -w $(pwd) \
    ${1+"$@"} \
    docker.usersys/${USER}/ubuntu-dev
}

```
