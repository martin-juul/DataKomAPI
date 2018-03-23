#!/usr/bin/env bash

if [ -d dist ]; then
    rm -rf dist
    mkdir dist
else
    mkdir dist
fi