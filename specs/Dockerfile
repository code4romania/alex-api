#########################################
# Docker image for ALEX-API mock server #
#########################################
FROM node:lts
RUN npm i -g open-api-mocker
EXPOSE 5000
WORKDIR /specs/
ENTRYPOINT ["open-api-mocker","-s","alex-api-bundle.yml","-w"]
#########
# USAGE #
#########
# Build: docker build -f specs/Dockerfile . -t alex-api-mock
# Run: docker run -d -p 5000:5000 --name alex-api-mock-server alex-api-mock
# Probe: http://localhost:5000/api/v1/hc