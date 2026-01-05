#!/bin/bash

FILENAME="ulawulo_ngo_if.txt"

if [[ -f "${FILENAME}" ]]; then

    echo "${FILENAME} already exist"
    exit 1

else
    touch "${FILENAME}"
fi


