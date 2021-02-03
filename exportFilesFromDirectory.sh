#!/bin/bash

currentPath=${PWD}

dictory=$1

dictoryPath=$currentPath/$dictory

filesNamesArray=($dictoryPath/*.ts)

for fileName in "${filesNamesArray[@]}"; do
    IFS='.' read -r -a pathsArray <<< $fileName
    IFS='/' read -r -a nameArray <<< ${pathsArray[0]}

    name=${nameArray[-1]}

    echo "export * from './"$name"'" >> $dictoryPath'/index.ts'
done
