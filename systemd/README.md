# systemd container

Building on this is easy as:

```Dockerfile
FROM systemd
RUN dnf -y install httpd; dnf clean all; systemctl enable httpd.service
EXPOSE 80
```

```shell
podman build -t httpd .
podman run -it --rm --systemd -P httpd
```
