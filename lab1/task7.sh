#!/bin/bash

echo $(grep -hroIE "([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}" /etc) | sed "s/ /, /g" > emails.lst
