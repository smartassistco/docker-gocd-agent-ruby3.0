#!/bin/bash

echo "Creating workspace"

mkdir -p tmp output

echo "Downloading source files"

wget -q -O tmp/curl.dockerfile "https://github.com/docker-library/buildpack-deps/raw/master/debian/buster/curl/Dockerfile"
wget -q -O tmp/scm.dockerfile "https://github.com/docker-library/buildpack-deps/raw/master/debian/buster/scm/Dockerfile"
wget -q -O tmp/buildpack-deps.dockerfile "https://github.com/docker-library/buildpack-deps/raw/master/debian/buster/Dockerfile"
wget -q -O tmp/ruby.dockerfile "https://github.com/docker-library/ruby/raw/master/$RUBY_VERSION_MAJOR/buster/Dockerfile"

echo "Creating Dockerfile"

# Creating ruby.dockerfile
{
  echo -e "## DO NOT MODIFY DIRECTLY. GENERATED WITH generate.sh ##\\n"

  echo "FROM gocd/gocd-agent-debian-10:v$GOCD_AGENT_VERSION"

  echo -e "\\n# Become root"
  echo -e "USER root\\n"

  echo -e "\\n#\\n# Buildpack Deps\\n#\\n"
  sed "/^FROM.*/d" tmp/curl.dockerfile
  sed "/^FROM.*/d" tmp/scm.dockerfile
  sed "/^FROM.*/d" tmp/buildpack-deps.dockerfile

  echo -e "\\n#\\n# Ruby\\n#\\n"
  sed "/^FROM.*/d; /^CMD.*/d" tmp/ruby.dockerfile

  echo -e "\\n# Change user back to go"
  echo "USER go"

} >output/Dockerfile

echo "Dockerfile generated"

echo "Updating README"

envsubst <templates/README.md >output/README.md

echo "README generated"
