#!/bin/sh

# Compiling static site if required
if [ -d "/temp/src" ]; then
	echo "docker-static-roots-nginx: Static site source code found in /temp/etc"

	cd /temp/src;
	if [ ! -d "/temp/src/public" ]; then
		echo "docker-static-roots-nginx: Static site source code compilation started"

		npm install;
		roots compile;
		echo "docker-static-roots-nginx: Static site source code compilation finished"
	fi

	# Copying compiled static site to Nginx html folder
	echo "docker-static-roots-nginx: Copying compiled static site to Nginx html folder..."
	rm -rf /usr/share/nginx/html/;
	cp -r public/ /usr/share/nginx/html/;
	rm -rf /temp/src;
fi

# Starting Nginx
echo "docker-static-roots-nginx: Starting nginx..."
nginx -g "daemon off;"