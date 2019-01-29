#!/bin/bash

set -e

if [[ "$JACKRABBIT_LOG_LEVEL" ]]; then
    sed -i'' -e 's/<root level\s*=\s*".*">/<root level="'$JACKRABBIT_LOG_LEVEL'">/' /usr/local/tomcat/webapps/jackrabbit/WEB-INF/classes/logback.xml
fi

if [[ "$APACHE_LOG_LEVEL" ]]; then
    echo "" >> /usr/local/tomcat/conf/logging.properties
    echo "org.apache.level = $APACHE_LOG_LEVEL" >> /usr/local/tomcat/conf/logging.properties
fi

exec "$@"

