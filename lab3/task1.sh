#!/bin/bash

DATE=$(date +"%c")
mkdir /home/test && (echo "catalog test was created successfully" >> ~/report ; mkdir /home/test/"$DATE" )
ping www.net_nikogo.ru || (echo $(date +"%D %T") "Error in ping site: www.net_nikogo.ru" >> ~/report )
