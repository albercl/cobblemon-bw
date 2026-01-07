#!/bin/bash

rm -f server.mrpack

# Files in server directory to root in zip
cd server
zip -r ../server.mrpack *