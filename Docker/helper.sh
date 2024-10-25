#!/bin/bash

sayHello() {
    timestamp=$(date +%s)
    echo "Hello from helper.sh at $timestamp"
}
while true; do sayHello; sleep 2; done