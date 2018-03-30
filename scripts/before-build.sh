#!/usr/bin/env bash

if [ -d dist ]; then
    echo "Cleaning up..."
    rm -rf dist
    mkdir dist
else
    mkdir dist
fi