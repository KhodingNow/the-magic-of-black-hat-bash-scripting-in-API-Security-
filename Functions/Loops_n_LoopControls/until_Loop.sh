#!/bin/bash

FILE="output.txt"

touch "${file}"
until [[ -s "${FILE}" ]]; do
    echo "${FILE} is empty..."
    echo "Checking agin in 2 seconds..."
    sleep 2
done

    echo "${FILE} appears appears to have some content in it"
