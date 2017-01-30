# asn-notebook

### Build it:

`docker build . -t asn-notebook`

### Run it:

```
docker exec -d `docker run -dit -p 8888:8888 asn-notebook` jupyter notebook --no-browser --ip="*" --NotebookApp.server_extensions="['jade_utils.notebook_extentions']"
```

This runs the container in the background then `exec` the `jupyter noteboook` command.


If working on the extensions it might be helpful to do something like:

```
docker run -dit -p 8888:8888 -v <path_to_jade_utils_src>:/jade_utils asn-notebook
docker exec -it <container_id> bash
pip install --upgrade /jade_utils/
jupyter notebook --no-browser --ip="*" --NotebookApp.server_extensions="['jade_utils.notebook_extentions']"
```
