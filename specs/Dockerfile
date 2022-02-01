#########################################
# Docker image for ALEX-API mock server #
#########################################
FROM node:16-alpine3.15
RUN npm i -g open-api-mocker swagger-cli 
EXPOSE 5000
WORKDIR /specs/
COPY /specs/. /specs/
RUN swagger-cli bundle alex-api.yml --outfile alex-api-bundle.yml --type yaml
ENTRYPOINT ["open-api-mocker","-s","alex-api-bundle.yml","-w"]
#########
# USAGE #
#########
# Build: docker build -f specs/Dockerfile . -t alex-api-mock-server
# Run: docker run -d -p 5000:5000 --name alex-api-mock-server alex-api-mock-server
# Probe: http://localhost:5000/api/v1/hc