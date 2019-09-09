[tomcat@evfed312qaa ~]$ more restart-service.sh
#!/bin/sh

TOMCAT=tomcat
APACHE=httpd

echo "stopping apache and tomcat"
sudo /bin/systemctl stop $APACHE
returnval=$?
sleep 10

if [ "$returnval" -eq 0 ]; then
    echo "Apache is successfully shutdown"
else
        echo "Apache is not stopped normally"
        exit 1
fi

sudo /bin/systemctl stop $TOMCAT
tomcatval=$?
sleep 10
echo ""

if [ "$tomcatval" -eq 0 ]; then
    echo "Tomcat is successfully shutdown"
else
        echo "Tomcat is not stopped normally"
        exit 2
fi

echo "starting up tomcat and apache"
sudo /bin/systemctl start $TOMCAT
tomcatval=$?
sleep 30

if [ "$tomcatval" -eq 0 ]; then
    echo "Tomcat is successfully startup"
else
        echo "Tomcat is not started normally"
        exit 3
fi

sudo /bin/systemctl start $APACHE
apacheval=$?
sleep 10

if [ "$apacheval" -eq 0 ]; then
    echo "Apache is successfully startup"
else
        echo "Apache is not started normally"
        exit 4
fi

echo "tomcat/apache has started successfully"

