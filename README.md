# Datomic Free Edition

[![Docker Pulls](https://img.shields.io/docker/pulls/akiel/datomic-free.svg)](https://hub.docker.com/r/akiel/datomic-free/)
[![Image Layers](https://images.microbadger.com/badges/image/akiel/datomic-free.svg)](https://microbadger.com/images/akiel/datomic-free)

Non-official Docker image for [Datomic Free Edition][1] based on the official
[Java Image][2].

The use of Datomic Free Edition is governed by the terms of the Datomic Free 
Edition License which you can find [here][3]. By using this Docker image, you 
are agreeing to those terms.

## Usage

To start a container with Docker running at localhost, the following command
is sufficient

    docker run -d -e ADMIN_PASSWORD="admin" -e DATOMIC_PASSWORD="datomic" -p 4334-4336:4334-4336 --name datomic-free akiel/datomic-free

You can access your databases through this URIs

    datomic:free://localhost:4334/<DB_NAME>?password=datomic

If your Docker host differs from localhost, you have to specify the hostname or
IP through the environment variable ALT_HOST

    docker run -d -e ADMIN_PASSWORD="admin" -e DATOMIC_PASSWORD="datomic" -p 4334-4336:4334-4336 -e ALT_HOST=<DOCKER_HOST> --name datomic-free akiel/datomic-free

and access your databases through the URIs

    datomic:free://<DOCKER_HOST>:4334/<DB_NAME>?password=datomic

The image exposes two volumes, one `/data` and one `/log` volume. If you give
your containers names like in the commands above, you don't have to bind 
something to the `/data` volume. Your data will be preserved over container
restarts. But it is recommended to use a volume container or host directory as
described in [Managing Data in Containers][4].

To change the passwords you can do it through the environment variables `ADMIN_PASSWORD_OLD` and `DATOMIC_PASSWORD_OLD`

    docker run -d -e ADMIN_PASSWORD_OLD="admin" -e ADMIN_PASSWORD="admin-new" -e DATOMIC_PASSWORD_OLD="datomic" -e DATOMIC_PASSWORD="datomic-new" -p 4334-4336:4334-4336 --name datomic-free akiel/datomic-free

In order to disable SSL  between the peers and the transactor, set `ENCRYPT_CHANNEL` to `false`.

In order to change the default memory settings of `-Xms1g` and `-Xmx1g`, use the environment variables `XMS` and `XMX`. You can also use `JAVA_OPTS` to set other Java options.

## Specific Versions

To run a specific version of Datomic, you can use tags. The following images are
available:

* akiel/datomic-free:0.9.5703-3 (#16, updated OpenJDK base image)
* akiel/datomic-free:0.9.5703-2 (updated OpenJDK base image)
* akiel/datomic-free:0.9.5703-1 (fixes [remote access][6] and [volumes][5])
* akiel/datomic-free:0.9.5703 (broken remote access)
* akiel/datomic-free:0.9.5697
* akiel/datomic-free:0.9.5656
* akiel/datomic-free:0.9.5651
* akiel/datomic-free:0.9.5561.62
* akiel/datomic-free:0.9.5561.59
* akiel/datomic-free:0.9.5561.56
* akiel/datomic-free:0.9.5561.54
* akiel/datomic-free:0.9.5561.50
* akiel/datomic-free:0.9.5561
* akiel/datomic-free:0.9.5554
* akiel/datomic-free:0.9.5544
* akiel/datomic-free:0.9.5530
* akiel/datomic-free:0.9.5407
* akiel/datomic-free:0.9.5404
* akiel/datomic-free:0.9.5394
* akiel/datomic-free:0.9.5390
* akiel/datomic-free:0.9.5385
* akiel/datomic-free:0.9.5372
* akiel/datomic-free:0.9.5359
* akiel/datomic-free:0.9.5350
* akiel/datomic-free:0.9.5344
* akiel/datomic-free:0.9.5327
* akiel/datomic-free:0.9.5302
* akiel/datomic-free:0.9.5206
* akiel/datomic-free:0.9.5201
* akiel/datomic-free:0.9.5198
* akiel/datomic-free:0.9.5186
* akiel/datomic-free:0.9.5173
* akiel/datomic-free:0.8.3814

[1]: <https://my.datomic.com/downloads/free>
[2]: <https://registry.hub.docker.com/u/library/java/>
[3]: <https://www.datomic.com/datomic-free-edition-license.html>
[4]: <https://docs.docker.com/userguide/dockervolumes/#volume>
[5]: <https://github.com/alexanderkiel/datomic-free/issues/10>
[6]: <https://github.com/alexanderkiel/datomic-free/issues/5>
