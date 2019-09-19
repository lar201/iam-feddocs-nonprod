#!/bin/sh
  
SERVERS='chfed312uata.ci.northwestern.edu'
#SERVERS=$1 
RESTARTSERVICE=/home/tomcat/restart-service.sh
WORKINGDIR=/home/tomcat/iam-feddocs-nonprod/uat/metadata/
WORKINGDIRSUB=/home/tomcat/iam-feddocs-nonprod/uat/idp-v3/
METADIR=/usr/local/shibboleth-idpv3/metadata
CONFDIR=/usr/local/shibboleth-idpv3/conf

echo "servers=$SERVERS"
if [ -z "$SERVERS" ]; then 
    echo "no remote server is specified"
fi

for server in $SERVERS
do
        echo ""
        echo "Deploying on remote server $server"

	echo "copy the directory $WORKINGDIR to $METADIR"
	scp $WORKINGDIR/* tomcat@$server:$METADIR

	echo "copy the directory $WORKINGDIRSUB to $CONFDIR"
	scp $WORKINGDIRSUB/* tomcat@$server:$CONFDIR

	echo "restart services on $server"
	ssh -t tomcat@$server "$RESTARTSERVICE"
done
