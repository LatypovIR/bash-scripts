#!/bin/bash

while true; do
    read LINE
    case "$LINE" in
       "+")
            kill -USR1 $(cat .pid)
            ;;
        "*")
            kill -USR2 $(cat .pid)
            ;;
        "TERM")
            kill -s TERM $(cat .pid)
            exit
        ;;
    esac
done
