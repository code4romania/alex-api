# OpenAPI specifications

This folder is reserved for OpenAPI specifications. Also, check [devcontainer readme](../.devcontainer/README.md) for dev environment related options.

## Building documentation

If using [devcontainers](../.devcontainer/README.md), just run ```./dev.generate.src.sh``` to
validate, bundle and generate source code in one line 
(should work locally if all dependencies are installed).

Alternatively, use ```swagger-cli bundle``` to build specs:

```Bash
npm install -g swagger-cli
swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml 
```

Find an [OpenAPI build sample here](https://gist.github.com/andreifloroiu/bbbcadc3a8de4df43f93be4d7b85e175).

Bundle from repo without local cloning:

```bash
swagger-cli bundle https://raw.githubusercontent.com/code4romania/alex-api/main/specs/alex-api.yml --outfile alex-api-bundle.yml --type yaml
```

### Validate specs

Use ```swagger-cli validate``` to validate specs:

```Bash
swagger-cli validate specs/alex-api.yml
```

Validate remote:

```bash
swagger-cli validate https://raw.githubusercontent.com/code4romania/alex-api/main/specs/alex-api.yml
```
## Generate code

Using [this tool](https://openapi-generator.tech/).

First, must have JRE on your machine:

```Bash
# On Ubuntu
sudo apt install default-jre
```

Now, install ```npm``` wrapper package:

```Bash
npm install @openapitools/openapi-generator-cli -g
```

See generator list [here](https://openapi-generator.tech/docs/generators/).

### Generate server stubs (ASP.NET Core)

[ASP.NET Core server stubs here](https://openapi-generator.tech/docs/generators/aspnetcore/)
and run (for library):

```Bash
swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml
openapi-generator-cli generate -i specs/alex-api-bundle.yml -o _build/aspnetcorestubs -g aspnetcore\
    --additional-properties=aspnetCoreVersion=5.0,buildTarget=library,isLibrary=true,operationIsAsync=true,operationResultTask=true,useDefaultRouting=false
```

For program, run:

```Bash
swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml
openapi-generator-cli generate -i specs/alex-api-bundle.yml -o _build/aspnetcorestubs -g aspnetcore\
    --additional-properties=aspnetCoreVersion=5.0,buildTarget=program,isLibrary=false,operationIsAsync=true,operationResultTask=true,useDefaultRouting=false
```

### Generate client code - axios

[Axios here](https://openapi-generator.tech/docs/generators/typescript-axios).

```Bash
swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml
openapi-generator-cli generate -i specs/alex-api-bundle.yml -o _build/ts-axios -g typescript-axios
```

### Generate client code - Postman

Found these steps [here](https://github.com/postmanlabs/postman-app-support/issues/8663) and adapted them bellow.

1. Create a new workspace
1. (in Postman) Go to 'APIs'
1. Click on 'New API'
1. Enter API details: Name and Version
1. Choose Schema type: OpenAPI 3.0
1. Choose Schema format: YAML
1. Import API schema (can't be in _devcontainter_ unless you do some ```docker cp <container-id>:/workspaces/alex-api/specs/alex-api-bundle.yml /mnt/d/tmp/alex-api-bundle.yml``` magic) - find container ID with ```docker ps```
1. Go to newly imported API
1. Click on 'Generate Collection'
1. Name your collection
1. Choose 'Test the API'
1. Click on 'Generate Collection'
1. Switch to Collections
1. Choose newly generated collection
1. Choose 'Edit collection'
1. Check 'Authorization' type configured
1. Instead of 'API Key' I can see 'No Auth'

## Useful resources

* [Code Generators](https://github.com/OpenAPITools/openapi-generator#overview) - includes code generators for both client and server stubs
* [OpenAPI Tool List](https://openapi.tools/) - tools recommended by OpenAPI
* [OpenAPI Best Practices](https://oai.github.io/Documentation/best-practices.html)
* [OpenAPI/Swagger specs specs :)](https://swagger.io/docs/specification/about/)