#!/bin/bash

JDK_NAME="openlogic-openjdk-11.0.25+9-linux-x64"
JDK_ZIP="${JDK_NAME}.tar.gz"
JDK_DIR="jdk/linux"
JDK_HOME="${JDK_DIR}/openjdk-11"
JDK_BIN="${JDK_HOME}/bin"

if [ ! -d $JDK_HOME ]; then
	wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/11.0.25+9/$JDK_ZIP
	tar -xvf $JDK_ZIP -C $JDK_DIR
	mv $JDK_DIR/$JDK_NAME $JDK_HOME
	rm -f $JDK_ZIP
fi

${JDK_BIN}/javac -cp "lib/*" -d out src/io/github/tnas/app/Application.java
${JDK_BIN}/java -cp out:lib/* io.github.tnas.app.Application