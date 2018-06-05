# caseyfw/php

Fork of k0st/alpine-apache-app.

Web root has been moved to `/code/web` and PHP upgraded to PHP7. This image is
designed to work with modern PHP frameworks like Symfony, Laravel and Drupal.

## Usage

Either copy or volume your code into `/code` when running - e.g.

```
docker run --volume ${PWD}:/code --publish 80:8080 caseyfw/php
```

## Web root

It is expected that there will be a `web/` directory in the root level of your
code. This is served by apache as the web root.

If you want to put your code straight into the webroot, just volume it into the
`/web` directory - e.g.

```
docker run -v ${PWD}:/web -p 80:8080 caseyfw/php
```

This is useful for frameworks using legacy scaffolds like Drupal and Wordpress.

## Changing the web path

The `$WEB_PATH` environment variable can be used to set the sub-path your
web root is served from. This should start with a slash - e.g. `/foo/bar`.

```
docker run -v ${PWD}:/code -p 80:8080 -e "WEB_PATH=/foo/bar" caseyfw/php
```

This will result in your content being served at http://localhost/foo/bar/.

## Project script

You can create a `setup.sh` script in the root level of your code directory to
run commands during container start. This is a good opportunity to correct
ownership of project directories that the web server needs to write to - e.g.

```
#!/bin/sh
chown -R apache:apache /code/var/*
```

## Running as unprivileged user
Note that this image uses port 8080 by default, allowing it to be run by a
non-root user.

```
docker run -v ${PWD}:/code -p 80:8080 -u 1000 caseyfw/php
```

