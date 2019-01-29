#!/bin/bash

JACKRABBIT_URL="https://archive.apache.org/dist/jackrabbit/$VERSION/jackrabbit-webapp-$VERSION.war"
JACKRABBIT_MD5="$MD5"
JCR_URL="http://central.maven.org/maven2/javax/jcr/jcr/2.0/jcr-2.0.jar"
JCR_MD5="ede5e78b16c8ed298ce0b6d296584ebd"
echo Welcome to Jackrabbit Installer

cd /tmp
wget $JACKRABBIT_URL
wget $JCR_URL

DOWNLOAD_JACKRABBIT_MD5=`md5sum /tmp/jackrabbit-webapp-$VERSION.war | cut -d" " -f1`
DOWNLOAD_JCR_MD5=`md5sum /tmp/jcr-2.0.jar | cut -d" " -f1`

if [ $JACKRABBIT_MD5 != $DOWNLOAD_JACKRABBIT_MD5 ]; then
    echo The downloaded jackrabbit version has an incorrect MD5 hash
    echo Expected MD5 = $JACKRABBIT_MD5
    echo MD5 of download = $DOWNLOAD_JACKRABBIT_MD5
    exit 1
fi

if [ $JCR_MD5 != $DOWNLOAD_JCR_MD5 ]; then
    echo The downloaded jcr library version has an incorrect MD5 hash
    echo Expected MD5 = $JACKRABBIT_MD5
    echo MD5 of download = $DOWNLOAD_JCR_MD5
    exit 1
fi

echo Jackrabbit successfully installed
exit 0