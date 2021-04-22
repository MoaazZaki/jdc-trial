#!/bin/bash

serve -s ./client/build & node ./server/build/server.bundle.js && fg 
