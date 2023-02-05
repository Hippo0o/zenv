```
docker build . -t zenv:latest
```

```
docker run --user root -v /var/run/docker.sock:/var/run/docker.sock -it --rm zenv
```
