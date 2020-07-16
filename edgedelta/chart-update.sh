#!/usr/bin/env bash

# This script updates helm chart yaml app and chart version as given tag parameter
tag=$1
if [ -z "$tag" ]; then
  echo "Tag parameter not given, exiting"
  exit 2
fi

# App version will be in vX.Y.Z format and refer to docker image in public repo
# Cart version requires strict semver2 so drop v but use X.Y.Z, so we use (almost) same chart and application version for simplicty.
cat Chart.yaml.tmpl | sed "s/{APPVERSION}/$tag/g" | sed "s/{VERSION}/${tag#v}/g" > Chart.yaml
