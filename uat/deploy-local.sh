#!/bin/sh
  
RESTARTSERVICE=/home/tomcat/restart-service.sh
WORKINGDIR=/home/tomcat/iam-feddocs-nonprod/uat/metadata/
WORKINGDIRSUB=/home/tomcat/iam-feddocs-nonprod/uat/idp-v3/
METADIR=/usr/local/shibboleth-idpv3/metadata
CONFDIR=/usr/local/shibboleth-idpv3/conf

echo ""
echo "Deploying shibboleth update on the local server"


#copy all the needed directory files to the working directory
cp $WORKINGDIR/* $METADIR
cp $WORKINGDIRSUB/* $CONFDIR

$RESTARTSERVICE

echo "done on local server"

