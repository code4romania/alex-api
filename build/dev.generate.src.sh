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

# Validate, bundle and generate
swagger-cli validate specs/alex-api.yml \
    && swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml \
    && openapi-generator-cli generate -i specs/alex-api-bundle.yml -o _build/aspnetcorestubs -g aspnetcore --additional-properties=aspnetCoreVersion=5.0,buildTarget=library,isLibrary=true,operationIsAsync=true,operationResultTask=true,useDefaultRouting=false
