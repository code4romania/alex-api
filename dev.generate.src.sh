#!/bin/bash

swagger-cli validate specs/alex-api.yml\
    & swagger-cli bundle specs/alex-api.yml --outfile specs/alex-api-bundle.yml --type yaml\
    & openapi-generator-cli generate -i specs/alex-api-bundle.yml -o _build/aspnetcorestubs -g aspnetcore --additional-properties=aspnetCoreVersion=5.0,buildTarget=library,isLibrary=true,operationIsAsync=true,operationResultTask=true,useDefaultRouting=false