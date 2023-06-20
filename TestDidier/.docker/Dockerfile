FROM tomcat:9.0-jdk11-temurin-jammy

COPY scripts/docker-entrypoint.sh /
COPY scripts/docker-entrypoint.d/* /docker-entrypoint.d/

# Mise à jour des paquets et installation de Git
RUN apt-get update && \
    apt-get install -y git-core postgresql-client && \
    mkdir -p /axelor-source && \
    cd /axelor-source && \
    git clone https://github.com/axelor/open-suite-webapp.git axelor-erp && \
    sed -e 's|git@github.com:|https://github.com/|' -i axelor-erp/.gitmodules && \
    cd /axelor-source/axelor-erp/modules && \
    git clone https://github.com/Timmy44119/avr-docgen.git avr-docgen

ENTRYPOINT ["/docker-entrypoint.sh"]
