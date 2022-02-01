FROM node:16-alpine3.15
RUN apk update\
    && apk add openjdk8-jre\
    && npm i -g open-api-mocker swagger-cli @openapitools/openapi-generator-cli
WORKDIR /specs/
COPY /specs/. /specs/
RUN swagger-cli bundle alex-api.yml --outfile alex-api-bundle.yml --type yaml
ENTRYPOINT ["open-api-mocker","-s","alex-api-bundle.yml","-w"]