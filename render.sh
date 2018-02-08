#!/bin/bash

render() {
    sedStr="
      s!%%DOCKER_VERSION%%!$version!g;
    "
    
    sed -r "$sedStr" $1
}

versions=(stable latest rc test 1.12 1.13 17 17.03 17.06 17.09 17.12 18.01)
for version in ${versions[*]}; do
  mkdir -p $version
  echo "Rendering $version/Dockerfile"
  render Dockerfile.template > $version/Dockerfile
done
echo "Render done."