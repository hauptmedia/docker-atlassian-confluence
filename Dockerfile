FROM		atlassian/confluence-server:6.10.1
MAINTAINER	Julian Haupt <julian.haupt@hauptmedia.de>


ENV		MYSQL_CONNECTOR_J_VERSION 5.1.45

# integrate mysql connector j library
RUN		curl -L --silent http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_CONNECTOR_J_VERSION}.tar.gz | tar -xz --strip=1 -C /tmp && \
		cp /tmp/mysql-connector-java-${MYSQL_CONNECTOR_J_VERSION}-bin.jar ${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/lib && \
		rm -rf /tmp/*

