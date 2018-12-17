# gsc-starbound

## Note

In order to build the container you must provide the following options to run properly. These are **not** retained within the container after building.

```
docker-compose build \
--build-arg S_PASSWORD='PASSWORDHERE' \
--build-arg S_USERNAME='USERNAMEHERE' \
--build-arg S_GUARD=2FAHERE
```

If type in the 2-FA code right before it changes it should remain valid long enough to build the container. Have fun.
