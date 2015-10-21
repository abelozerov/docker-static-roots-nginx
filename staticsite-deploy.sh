#!/bin/sh

# Compiling static site if required
cd /temp/src;
if [ ! -d "/temp/src/public" ]; then
	npm install;
	roots compile;
fi

# Copying static site to Nginx html folder
rm -rf /usr/share/nginx/html/;
cp -r public/ /usr/share/nginx/html/;
rm -rf /temp/src;

# Starting Nginx
nginx -g "daemon off;"