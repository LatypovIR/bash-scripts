#!/bin/bash

while true; do
    read LINE
    case "$LINE" in
       "KILL")
            kill -USR1 $(cat .pid)
            exit
            ;;
        "QUIT")
            kill -USR2 $(cat .pid)
            exit
            ;;
        "TERM")
            kill -s TERM $(cat .pid)
            exit
        ;;
    esac
done
