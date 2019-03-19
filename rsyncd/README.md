# rsyncd container

## build it

```shell
podman build -t rsyncd .
```

## run it

```shell
cp podman-rsyncd.service /etc/systemd/system/
mkdir -p /etc/podman.d
cat > /etc/podman.d <<EOF
IMAGE_NAME=rsyncd
PODMAN_RUN_ARGS=" -it --rm -v /mnt/data/mydata-rsyncd.conf:/etc/rsyncd.conf:ro -v /mnt/data/mydata/:/data:ro -p 873:873 "
EOF
systemctl enable --now podman-rsyncd.service
```


