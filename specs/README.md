# OpenAPI specifications

This folder is reserved for OpenAPI specifications.

## Building documentation

Use ```swagger-cli``` to build these specs.

```Bash
npm install -g swagger-cli
swagger-cli bundle openapi.yml --outfile _build/openapi.yml --type yaml --dereference
```

## Useful resources

* [Code Generators](https://github.com/OpenAPITools/openapi-generator#overview) - includes code generators for both client and server stubs
* [OpenAPI Tool List](https://openapi.tools/) - tools recommended by OpenAPI
* [OpenAPI Best Practices](https://oai.github.io/Documentation/best-practices.html)
* [OpenAPI/Swagger specs specs :)](https://swagger.io/docs/specification/about/)