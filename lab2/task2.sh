#!/bin/bash

ps -eo pid,command | grep "/sbin/" | awk '{print $1}' > out2.txt
