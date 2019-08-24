#!/bin/bash

for func in $(find /functions -maxdepth 1 -mindepth 1 -type d -print); do
    echo "Building... ${func}"
    pip3 install -r ${func}/requirements.txt -t ${func}/
    pushd ${func}
    zip -q -r9 ${func}.zip .
    popd
    ls -lisa ${func}.zip
    mv ${func}.zip /build/
done
