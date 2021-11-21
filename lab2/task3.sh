#!/bin/bash

ps -eo pid= --sort -stime | head -n1
