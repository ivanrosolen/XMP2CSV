#!/bin/bash

touch csv_ninja.csv

find -E . -regex '.*\.(psd|gif|png|jpeg)' | while read file; do

    xmp=$(exiftool -xmp -b "${file}" | egrep 'xwnv:(.+)=(.+)"$' | cut -d : -f 2- | tr "\n" ";")

    filename=$(basename "${file}")

    echo "${file};${filename};${xmp%?}" >> csv_ninja.csv

    echo "Extracting: ${file}"

done