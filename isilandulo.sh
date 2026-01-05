#!/bin/bash

FILENAME="ikhona_le_fayili.txt"

if [[ -f "${FILENAME}" ]]; then

    echo "${FILENAME} sele ikhona"
    exit 1

else

    touch "${FILENAME}"
fi
