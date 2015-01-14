#!/bin/sh
echo "Startup script"
cd /home/sites && git pull
cd /home/sites/lms && bundle update
exit 0
