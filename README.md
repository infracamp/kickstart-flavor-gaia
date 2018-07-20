
# kickstart-flavor gaia :: Apache2, PHP7.2 development container

see (http://github.com/infracamp/kickstart) for more information.

Document Index:

- [Development Guide for this flavor](DEVELOPMENT.md)
- [Dockerhub page](https://hub.docker.com/r/infracamp/kickstart-flavor-gaia/)
    - [Tags available](https://hub.docker.com/r/infracamp/kickstart-flavor-gaia/tags/)
    - [Build details](https://hub.docker.com/r/infracamp/kickstart-flavor-gaia/builds/)

## About this project

This Repo delivers the tools used by any kickstart flavor container.
It is included by Git submodule.


## Container specific `.kick.yml`-directives

| Key | Default | Description |
|----------------|----------------|---------------------|
| `http_port`                  | `80`          | The internal port, apache listens on |
| `apache_www_root`            | `/opt/www`    | The document root |
| `apache_fallback_resource`   | `null`        | All requests will be redirected to this script. |

## Installed Software



