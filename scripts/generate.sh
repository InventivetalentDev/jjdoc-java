#!/bin/sh

### sudo apt-get install openjdk-8-source

### First "git clone https://github.com/InventivetalentDev/jjdoc-java.git"
### cd scripts


DOCLET_VERSION="1.0.0"
JAVA_VERSION="8"

# Create temp directory & cd into it
mkdir temp
cd temp

# Copy src.zip to temp directory
cp /usr/lib/jvm/openjdk-$JAVA_VERSION/src.zip .

# Unzip to ./src
unzip src.zip -d src

# Download the JSON doclet
wget https://github.com/InventivetalentDev/jsondoclet/releases/download/v$DOCLET_VERSION/json-doclet-$DOCLET_VERSION-SNAPSHOT-jar-with-dependencies.jar

# cd back out of the temp directory
cd ..

# Run Doclet
javadoc -docletpath ./temp/json-doclet-$DOCLET_VERSION-SNAPSHOT-jar-with-dependencies.jar -doclet org.inventivetalent.jsondoclet.JsonDoclet -outfile ../jjdoc/jdk$JAVA_VERSION/ -sourcepath ./temp/src/ -public -subpackages java -exclude java.awt:java.applet:java.rmi:java.sql:java.beans


## Final cleanup
rm -Rf temp

### Then cd ..
### git add jjdoc && git commit && git push