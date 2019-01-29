FROM tomcat:7

COPY src/installer.sh /tmp/
RUN chmod +x /tmp/installer.sh

ENV VERSION="2.6.3"
ENV MD5="957c17e82e8d5731521e23e5dbe03f1b"

RUN /tmp/installer.sh
RUN mv /tmp/jcr-2.0.jar /usr/local/tomcat/lib

RUN unzip /tmp/jackrabbit-webapp-${VERSION}.war -d /usr/local/tomcat/webapps/jackrabbit && \
    rm -Rf /tmp

COPY src/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

CMD ["catalina.sh", "run"]
