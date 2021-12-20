#!/bin/bash
find /home/1/result -type f -exec curl -u xxx:psw --ftp-create-dirs -T {} ftp://132.232.37.251/{} \;