#!/bin/bash

name=$1

echo "Refreshing project from server [$name]"

if [[ -n "$name" ]]; then
    rm -rf temp
    rm -rf unpackaged
    sfdx force:mdapi:retrieve -r ./temp -u $name -k ./package.xml
    Unzip ./temp/unpackaged.zip
    sfdx force:mdapi:convert -r unpackaged/

    echo "Project refreshed from server [$name]."
    rm -rf temp
    rm -rf unpackaged

else
    echo "Missing argument. Please enter refreshFromServer.sh <Org Alias>."
    sfdx force:org:list
fi