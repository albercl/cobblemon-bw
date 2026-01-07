#!/bin/bash

rm -f client.mrpack

# Files in server directory to root in zip
cd client
zip -r ../client.mrpack *