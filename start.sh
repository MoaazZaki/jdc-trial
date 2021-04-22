#!/bin/bash

node ./server/build/server.bundle.js & serve -s build && fg 
