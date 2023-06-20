FROM tomcat:9.0-jdk11-temurin-jammy

# Mise à jour des paquets et installation de Git
RUN apt-get update \
 && apt-get install -y git-core \
 && apt-get install -y postgresql-client

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

RUN mkdir -p /axelor-source \
 && cd /axelor-source \
 && git clone https://github.com/axelor/open-suite-webapp.git axelor-erp \
 && sed -e 's|git@github.com:|https://github.com/|' -i axelor-erp/.gitmodules
# && cd axelor-erp \
# && git submodule sync \
# && git submodule init \
# && git submodule update \
# && git submodule foreach git checkout master \
# && git submodule foreach git pull origin master \

RUN cd /axelor-source/axelor-erp/modules \
 && git clone https://github.com/Timmy44119/avr-docgen.git avr-docgen
# && ./gradlew -x test build \
# && cp /axelor-source/axelor-erp/build/libs/axelor-erp-*.war /usr/local/tomcat/webapps/ROOT.war \
