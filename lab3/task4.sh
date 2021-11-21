#!/bin/bash

cpulimit -l 10 -- bash looper.sh & bash looper.sh & bash looper.sh & kill $!
