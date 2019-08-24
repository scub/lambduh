#!/bin/bash

build_name="lamduh-${RANDOM}"
docker build -t ${build_name} .
docker run --rm --mount type=bind,source="$(pwd)"/build,target=/build -it ${build_name}
#docker rmi ${build_name}
