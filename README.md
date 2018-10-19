
# kickstart-flavor gaia :: Apache2, PHP7.2 development container

see (http://github.com/infracamp/kickstart) for more information.

Document Index:

- [Development Guide for this flavor](DEVELOPMENT.md)
- [Dockerhub page](https://hub.docker.com/r/infracamp/kickstart-flavor-gaia/)
    - [Tags available](https://hub.docker.com/r/infracamp/kickstart-flavor-gaia/tags/)
    - [Build details](https://hub.docker.com/r/infracamp/kickstart-flavor-gaia/builds/)


## Container specific `.kick.yml`-directives

| Key | Default | Description |
|----------------|----------------|---------------------|
| `http_port`                  | `80`          | The internal port, apache listens on |
| `apache_www_root`            | `/opt/www`    | The document root |
| `apache_fallback_resource`   | `null`        | All requests will be redirected to this script. |

## Installed Software


### Using XDebug Remote Debug with PhpStorm 

Activate remote debugging in **Settings**:

![Settings](doc/xdebug-config1.png)

(Kickstart will send your hosts ip to the container.)

**The idekey and serverName is the name of your project!**


### Debugging via browser

To start debugging via browser open:
```
http://localhost/?XDEBUG_SESSION_START=project123-name
```

### CLI debugging

