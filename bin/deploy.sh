#!/bin/bash

ssh $1@$2 << EOF
	cd /opt/tomcat/webapps
	rm -rf mono
	git clone https://github.com/Clivern/Mono.git mono
	sudo chown -R tomcat:tomcat mono
	sudo chmod -R 775 mono
	javac mono/src/com/clivern/*.java -classpath "/opt/tomcat/lib/servlet-api.jar" -d mono/WEB-INF/classes
EOF