#!/usr/bin/env bash

#get the model name from the Dockerfile ENV
llamaFile="$(basename $modelURL)"

#set the startup Opts
netOPTS="--host 0.0.0.0 --port 8080"
otherOPTS="--nobrowser"

/data/${llamaFile} $netOPTS $otherOPTS