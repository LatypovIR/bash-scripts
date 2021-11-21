#!/bin/bash

echo -e "1.nano\n2.vi\n3.links\n4.exit (default)"
read O
case $O in
1 )
nano
;;
2 )
vi
;;
3 )
links
;;
esac
