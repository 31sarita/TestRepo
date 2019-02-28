#!/bin/bash

name=$1
pkgName=$2
checkonly=$3

echo "Deploying project from server [$name]"

if [[ -n "$name" ]]; then
    rm -rf deploy
    sfdx force:source:convert --outputdir deploy --packagename $pkgName

    if [[ -n "$checkonly" ]]; then
        sfdx force:mdapi:deploy -c -d deploy -u $name -w 10
    else 
        sfdx force:mdapi:deploy -d deploy -u $name -w 10
    fi 
    

    echo "Project deployed to server [$name]."

else
    echo "Missing argument. Please enter deploytoServer.sh <Org Alias>  <Package Name>."
fi