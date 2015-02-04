#!/bin/sh

if [ -z "$CONFLUENCE_INSTALL_DIR" ]; then
	echo Missing CONFLUENCE_INSTALL_DIR env
	exit 1
fi

if [ -z "$CONFLUENCE_HOME" ]; then
	echo Missing CONFLUENCE_HOME env
	exit 1
fi

if [ -n "$CONNECTOR_PROXYNAME" ]; then
	xmlstarlet ed --inplace --delete "/Server/Service/Connector/@proxyName" $CONFLUENCE_INSTALL_DIR/conf/server.xml
	xmlstarlet ed --inplace --insert "/Server/Service/Connector" --type attr -n proxyName -v $CONNECTOR_PROXYNAME $CONFLUENCE_INSTALL_DIR/conf/server.xml
fi

if [ -n "$CONNECTOR_PROXYPORT" ]; then
	xmlstarlet ed --inplace --delete "/Server/Service/Connector/@proxyPort" $CONFLUENCE_INSTALL_DIR/conf/server.xml
	xmlstarlet ed --inplace --insert "/Server/Service/Connector" --type attr -n proxyPort -v $CONNECTOR_PROXYPORT $CONFLUENCE_INSTALL_DIR/conf/server.xml
fi

if [ -n "$CONNECTOR_SECURE" ]; then
	xmlstarlet ed --inplace --delete "/Server/Service/Connector/@secure" $CONFLUENCE_INSTALL_DIR/conf/server.xml
	xmlstarlet ed --inplace --insert "/Server/Service/Connector" --type attr -n secure -v $CONNECTOR_SECURE $CONFLUENCE_INSTALL_DIR/conf/server.xml
fi

if [ -n "$CONNECTOR_SCHEME" ]; then
	xmlstarlet ed --inplace --delete "/Server/Service/Connector/@scheme" $CONFLUENCE_INSTALL_DIR/conf/server.xml
	xmlstarlet ed --inplace --insert "/Server/Service/Connector" --type attr -n scheme -v $CONNECTOR_SCHEME $CONFLUENCE_INSTALL_DIR/conf/server.xml
fi

if [ -n "$CONTEXT_PATH" ]; then
	if [ "$CONTEXT_PATH" = "/" ]; then
		CONTEXT_PATH=""
	fi

	xmlstarlet ed --inplace --delete "/Server/Service/Engine/Host/Context/@path" $CONFLUENCE_INSTALL_DIR/conf/server.xml
	xmlstarlet ed --inplace --insert "/Server/Service/Engine/Host/Context" --type attr -n path -v "$CONTEXT_PATH" $CONFLUENCE_INSTALL_DIR/conf/server.xml
fi
	
exec "$@"

