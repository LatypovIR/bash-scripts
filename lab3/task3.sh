#!/bin/bash

(crontab -l && echo "* * * * * bash /home/solt/Desktop/lab3/task1.sh") | crontab

#(crontab -l && echo "*/5 * * * 5 /home/solt/Desktop/lab3/task1.sh") | crontab

