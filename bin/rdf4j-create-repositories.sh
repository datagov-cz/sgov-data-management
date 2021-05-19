#!/bin/bash

RDF4J_SERVER=http://localhost:8888/rdf4j-server
APP_REPOSITORY_NAME=ofn-record-manager-app
FORMGEN_REPOSITORY_NAME=ofn-record-manager-formgen
CONTENT_TYPE='text/turtle'

curl $RDF4J_SERVER/repositories/$FORMGEN_REPOSITORY_NAME -X PUT -d @./rdf4j/formgen-config.ttl -H "Content-Type: $CONTENT_TYPE"
curl $RDF4J_SERVER/repositories/$APP_REPOSITORY_NAME -X PUT -d @./rdf4j/app-config.ttl -H "Content-Type: $CONTENT_TYPE"
