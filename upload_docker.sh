#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

  export username="mohmagdy1016"
	 export path=fintest
	 export version=0.1
	 export dockerpath=$username/$path;
	imageId=$(docker images -q $dockerpath:latest)
	docker tag $imageId $dockerpath:$version
	docker push $dockerpath
