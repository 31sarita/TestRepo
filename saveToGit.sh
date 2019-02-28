#!/bin/bash

branch=$1
message=$2

echo "Saving project to git branch[$branch]"


if [ -z "$1" ] && [ -z "$2" ]; then 
    echo "Missing argument. Please enter saveToGit.sh <Branch Name>  <Commit message>."
else     
    git add .
	git commit -m "$message"
    git push origin $branch  

    echo "Project save to git branch [$branch]."
fi
