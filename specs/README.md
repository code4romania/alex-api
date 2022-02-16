# OpenAPI specifications

This folder is reserved for OpenAPI specifications.

## Building documentation

Use ```swagger-cli``` to build these specs.

```Bash
npm install -g swagger-cli
swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml 
```

Find an [OpenAPI build sample here](https://gist.github.com/andreifloroiu/bbbcadc3a8de4df43f93be4d7b85e175).

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
    --additional-properties=aspnetCoreVersion=6.0,buildTarget=program,isLibrary=false,operationIsAsync=true,operationResultTask=true,useDefaultRouting=false
```

### Generate client code (axios)

[Axios here](https://openapi-generator.tech/docs/generators/typescript-axios).

```Bash
swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml
openapi-generator-cli generate -i specs/alex-api-bundle.yml -o _build/ts-axios -g typescript-axios
```

## Useful resources

* [Code Generators](https://github.com/OpenAPITools/openapi-generator#overview) - includes code generators for both client and server stubs
* [OpenAPI Tool List](https://openapi.tools/) - tools recommended by OpenAPI
* [OpenAPI Best Practices](https://oai.github.io/Documentation/best-practices.html)
* [OpenAPI/Swagger specs specs :)](https://swagger.io/docs/specification/about/)