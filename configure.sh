#!/bin/bash
mkdir ~/.screen && chmod 700 ~/.screen
export SCREENDIR=$HOME/.screen
/usr/bin/ttyd -p $PORT -c admin:z0123456 bash
