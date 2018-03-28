#!/bin/sh

# Execute project specific setup script.
if [ -e /code/setup.sh ]; then
	echo "[i] Running project setup script."
	. /code/setup.sh
fi

echo "[i] Starting apache..."
httpd -D FOREGROUND
