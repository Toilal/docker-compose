# Docker Compose

[![Docker Automated buil](https://img.shields.io/docker/automated/toilal/docker-compose-ci-runner.svg)](https://hub.docker.com/r/toilal/docker-compose-ci-runner/)
[![Docker Pulls](https://img.shields.io/docker/pulls/toilal/docker-compose-ci-runner.svg)](https://hub.docker.com/r/toilal/docker-compose-ci-runner/)
[![GitHub issues](https://img.shields.io/github/issues/toilal/docker-compose-ci-runner.svg)](https://github.com/toilal/docker-compose-ci-runner/issues)
[![GitHub stars](https://img.shields.io/github/stars/toilal/docker-compose-ci-runner.svg?style=social&label=Star)](https://github.com/toilal/docker-compose-ci-runner)

This docker image installs docker-compose and bash on top of the `docker` image.
This is very usefull for CI pipelines, which leverage "Docker in Docker".

## Docker versions supported

There are versions based on different docker versions, e.g. `latest`, `17.06`, `17.03` and `1.13`.

Please open an issue or a pull request (preferred) [at GitHub](https://github.com/toilal/docker-compose-ci-runner), if a version is missing.

## Usage instructions for Jenkins CI

You may use it like this in your `.gitlab-ci.yml` file.

```groovy
pipeline {
    agent {
        docker {
            image 'toilal/docker-compose-ci-runner'
            args '-v /var/run/docker.sock:/var/run/docker.sock --user root:root'
        }
    }
    stages {
        stage('versions') {
            steps {
                sh 'docker info'
                sh 'docker-compose --version'
            }
        }
        stage('build') {
            steps {
                sh 'docker-compose build'
            }
        }
    }
}
```

## Usage instructions for GitLab CI

You may use it like this in your `.gitlab-ci.yml` file.

```yaml
image: toilal/docker-compose-ci-runner:latest

services:
  - docker:dind

before_script:
  - docker info
  - docker-compose --version

build image:
  stage: build
  script:
    - docker-compose build
```

## Contributing

- Make changes in `Dockerfile.template`.

- Run `./render.sh`.

- Run `./build.sh` to build images locally.

## Author

This is a fork of image provided by [Tobias L. Maier](http://tobiasmaier.info) for [BauCloud GmbH](https://www.baucloud.com).
