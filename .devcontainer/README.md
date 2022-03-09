# _devcontainer_

A few words about dev environment.

## Run mock server in devcontainer

Open _terminal_ and run:

```
swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml && open-api-mocker -s specs/alex-api-bundle.yml -w
```

Or just build of _yaml_ file for situations where _alex-nginx_ routes to _alex-api-mock_ service:

```
swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml
```

## Extracting _alex-api-bundle.yml_ from _devcontainer_

After building ```specs/alex-api-bundle.yml```, use something like ```docker cp f477097d0bb9:/workspaces/alex-api/specs/alex-api-bundle.yml ~/tmp/alex-api-bundle.yml```, where ```f477097d0bb9``` container ID can be found out using ```docker ps``` in ```CONTAINER ID``` column at the ```vsc-alex-api-cff2296e...``` image.

## DEV environment options

### ASP.NET Core dev environment

Use _devcontainer_ as-is provided in repo.

### Mock server opetion

Change in [docker-compose.devcontainer.yml](docker-compose.devcontainer.yml), under _alex-nginx_ service, under _volumes_, the following line:

```
- ./nginx.dev.conf:/etc/nginx/conf.d/nginx.conf
```

to this line:

```
- ./nginx.mock.conf:/etc/nginx/conf.d/nginx.conf
```

Then ```CTRL+SHIFT+P``` and choose _Remote-Containers: Rebuild Container_.

## Roadmap

Lacking _alex-client_ in these _devcontainer_.

Include a running version [alex-client](https://github.com/code4romania/alex-client) repo in _devcontainer_.