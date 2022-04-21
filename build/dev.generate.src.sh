#!/bin/bash

# Remove generated source code folder if exists
if [ -d "_build" ]; then
    rm -r _build
    echo 'Deleted _build folder...'
fi
# Remove bundle file if it exists.
if [ -f "specs/alex-api-bundle.yml" ]; then
    rm specs/alex-api-bundle.yml
    echo 'Deleted specs/alex-api-bundle.yml...'
fi
if [ -f "specs/alex-api-bundle.json" ]; then
    rm specs/alex-api-bundle.json
    echo 'Deleted specs/alex-api-bundle.json...'
fi

# Validate, bundle and generate
swagger-cli validate specs/alex-api.yml\
    && swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.json --type json\
    && java -jar /swagger-codegen-cli.jar generate -i specs/alex-api-bundle.json -l aspnetcore -o _build/swagger-codegen -c build/swagger-codegen.config
# swagger-cli validate specs/alex-api.yml\
#     && swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml\
#     && openapi-generator-cli generate -i specs/alex-api-bundle.yml -o _build/openapi-generator -g aspnetcore --additional-properties=aspnetCoreVersion=5.0,buildTarget=program,isLibrary=false,operationIsAsync=true,operationResultTask=true,useDefaultRouting=false