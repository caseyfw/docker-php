# caseyfw/docker-php-alpine

Fork of k0st/alpine-apache-app.

Web root has been moved to `/code/web` and PHP upgraded to PHP7. This image is
designed to work with modern PHP frameworks like Symfony, Laravel and Drupal.

## Usage

Either copy or volume your code into `/code` when running - e.g.

```
docker run --detach --volume ${PWD}:/code caseyfw/php-alpine
```

## Web root

It is expected that there will be a `web/` directory in the root level of your
code. This is served by apache as the web root.

## Project script

You can create a `setup.sh` script in the root level of your code directory to
run commands during container start. This is a good opportunity to correct
ownership of project directories that the web server needs to write to - e.g.

```
#!/bin/sh
chown -R apache:apache /code/var/*
```
