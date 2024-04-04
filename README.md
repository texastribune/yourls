> _🕸 Archive note: This app is no longer hosted nor maintained. See corresponding Decision Doc in wiki_

# yourls

Simple Docker container for [YOURLS](https://yourls.org/).

## Usage

Available on Docker Hub as [texastribune/yourls](https://hub.docker.com/r/texastribune/yourls).

    $ docker run \
        -e YOURLS_DB_USER=root \
        -e YOURLS_DB_PASS=supersecureyo \
        -e YOURLS_DB_NAME=yourls \
        -e YOURLS_DB_HOST=localhost \
        -e YOURLS_DB_PREFIX=yourls_ \
        -e YOURLS_SITE=http://pvlv.io \
        -e YOURLS_COOKIEKEY=evenmoresecure \
        -e YOURLS_USERS=adminusername:adminpassword \
        -it texastribune/yourls

The server will be listening on port 80. You'll need to set up a MariaDB/MySQL instance before getting started. Check out [config.php](https://github.com/texastribune/yourls/blob/master/config.php) for a few more configuration options. Define a `/root` short-link to set the root redirect.

## Development

    $ make build
    $ make push

## License & Acknowledgements

YOURLS is released under the [MIT license](https://github.com/YOURLS/YOURLS/blob/master/LICENSE.md). This Docker image is released under the [BSD 3-Clause license](https://github.com/texastribune/yourls/blob/master/LICENSE).

This image is inspired by [pavlov/docker-yourls] https://github.com/texastribune/yourls.git) Thanks for being awesome. :)
