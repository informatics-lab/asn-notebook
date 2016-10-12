# asn-notebook

### Build it:

`docker build . -t asn-notebook`

### Run it:

```
docker exec -d `docker run -dit -p 8888:8888 asn-notebook` jupyter notebook --no-browser --ip="*"
```

This runs the container in the background then `exec` the `jupyter noteboook` command.