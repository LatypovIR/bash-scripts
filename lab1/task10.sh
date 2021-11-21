#!/bin/bash

#(echo $(man bash)) | sed 's/[^a-zA-Z-]/ /g' | sed '/^[[:space:]]*$/d'| tr '[:upper:]' '[:lower:]'
(echo $(man bash)) | tr ' ' '\n' | tr -c -d '[:alpha:]|-|\n'| tr '[:upper:]' '[:lower:]' | grep -E '[a-z-][a-z-][a-z-][a-z-]+'| sort | uniq -c | sort -g | tail -3 | awk '{print $2}'
