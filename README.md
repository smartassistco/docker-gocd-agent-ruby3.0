# GoCD Agent with Ruby 3.0 Docker Image

[![dockeri.co](https://dockeri.co/image/smartassist/gocd-agent-ruby3.0)](https://hub.docker.com/r/smartassist/gocd-agent-ruby3.0)

[![Docker Build Status](https://github.com/smartassistco/docker-gocd-agent-ruby3.0/actions/workflows/docker-image.yml/badge.svg)](https://github.com/smartassistco/docker-gocd-agent-ruby3.0/actions/workflows/docker-image.yml)

[GoCD Agent on Debian 10](https://hub.docker.com/r/gocd/gocd-agent-debian-10) with the latest version of Ruby 3.0 added
to it.

## Usage

- To use in your docker-compose.yml:

```yaml
version: "3.8"

services:
  gocd-agent-ruby3.0:
    image: smartassist/gocd-agent-ruby3.0:v21.3.0
    restart: unless-stopped
    env_file: .env
```

- To modify further, reference in your Dockerfile:

```dockerfile
FROM smartassist/gocd-agent-ruby3.0:v21.3.0
```

## Contents

- [GoCD's official Debian 10 agent's Dockerfile](https://hub.docker.com/r/gocd/gocd-agent-debian-10)
- [Docker's official Ruby 3.0 Dockerfile](https://github.com/docker-library/ruby/raw/master/3.0/buster/Dockerfile)
- [Buildpack Dependencies](https://github.com/docker-library/buildpack-deps/raw/master/debian/buster/Dockerfile)

## Versions

| Runtime    | Version |
|------------|---------|
| OS      | Debian 10 (Buster)  |
| GoCD agent | 21.3.0 |
| Ruby       | 3.0.3  |
| Node       | 16.13.0  |

## Building

- Update versions in `generate.sh`
- Run `bash generate.sh`
