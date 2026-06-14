#!/bin/bash

if ["$1"="build_generator"]; then
    docker build -t generator ./generator
elif ["$1"="run_generator"]; then
    docker run --rm -v "$(pwd)/data:/data" generator
elif ["$1"="create_local_data"]; then
    mkdir -p local_data
    python3 generator/generate.py local_data
elif ["$1"="build_reporter"]; then
    docker build -t reporter ./reporter
elif [ "$1" = "run_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" reporter
elif [ "$1" = "structure" ]; then
    find . -not -path './.git/*' | sort
elif [ "$1" = "clear_data" ]; then
    rm -f data/*.csv data/*.html
elif [ "$1" = "inside_generator" ]; then
    docker run --rm -v "$(pwd)/data:/data" generator ls /data
elif [ "$1" = "inside_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" reporter ls /data
fi