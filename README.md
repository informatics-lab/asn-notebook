# asn-notebook

### Build it:

`docker build . -t asn-notebook`

### Run it:

```
docker exec -d `docker run -dit -p 8888:8888 asn-notebook` jupyter notebook --no-browser --ip="*" --NotebookApp.server_extensions="['jade_utils.notebook_extentions']"



```

This runs the container in the background then `exec` the `jupyter noteboook` command.


If working on the jade_utils it might be helpful to do something like the below:

```
docker run -dit -p 8888:8888 -v <path_to_jade_utils_src>:/jade_utils \
-e AWSSECRETACCESSKEY=$AWSSECRETACCESSKEY \
-e AWSACCESSKEYID=$AWSACCESSKEYID \
-e AWS_SECRET_ACCESS_KEY=$AWSSECRETACCESSKEY \
-e AWS_ACCESS_KEY_ID=$AWSACCESSKEYID \
asn-notebook

docker exec -it <container_id> bash
pip install --upgrade /jade_utils/
jupyter notebook --no-browser --ip="*" --NotebookApp.server_extensions="['jade_utils.notebook_extentions']"
```
