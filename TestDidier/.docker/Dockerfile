FROM tomcat:9.0-jdk11-temurin-jammy AS BUILDER

# Installation de Git
RUN apt-get update && \
    apt-get install -y git-core && \
    rm -rf /var/lib/apt/lists/*

# Installation des sources Axelor
RUN mkdir -p /axelor-source && \
    cd /axelor-source && \
    git clone https://github.com/axelor/open-suite-webapp.git axelor-erp && \
    sed -e 's|git@github.com:|https://github.com/|' -i axelor-erp/.gitmodules && \
    cd axelor-erp && \
    git submodule sync && \
    git submodule init && \
    git submodule update && \
    git submodule foreach git checkout master && \
    git submodule foreach git pull origin master

# Installation module Timmy :) !
RUN cd /axelor-source/axelor-erp/modules && \
    git clone https://github.com/Timmy44119/avr-docgen.git avr-docgen

# Build du War
RUN cd /axelor-source/axelor-erp && \
    ./gradlew -x test build


FROM tomcat:9.0-jdk11-temurin-jammy

# Scripts d'init, config et WAR Applicatif
COPY --from=BUILDER /axelor-source/axelor-erp/build/libs/axelor-erp-*.war /usr/local/tomcat/webapps/ROOT.war
COPY scripts/docker-entrypoint.sh /
COPY scripts/docker-entrypoint.d/* /docker-entrypoint.d/
COPY conf/axelor-config.properties /usr/local/tomcat/axelor-config.properties

# Installation PSQL Client
RUN apt-get update && \
    apt-get install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/docker-entrypoint.sh"]
