# Developing this container

## Git submodules

```
git submodule update --init --recursive --remote
```

Do this before you push things. dockerhub will pull exacly the same
submodules version you have in this repository.


## Dockerhub integration

- The docker-service must be added to group-repository by hand
  by the user of the automated build.
  
In docker there should be following build-settings:

| Type | Name | Dockerfile Location | Docker Tag name |
|--------|---------------|---------------------|-----------------|
| Branch | master        | /                   | testing         |
| Tag    | `/^[0-9.]+$/` | /                   | latest          |
| Tag    | `/^[0-9.]+$/` | /                   | release-{sourceref} |