#!/bin/sh

# Execute project specific setup script.
if [ -e /code/setup.sh ]; then
	echo "[i] Running project setup script."
	. /code/setup.sh
fi

echo "[i] Starting apache..."
# Run apache httpd daemon.
httpd -D FOREGROUND
