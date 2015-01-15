#!/bin/sh
echo "Startup script"
#cd /home/sites && git pull
cd /app/lms && bundle update
exit 0
