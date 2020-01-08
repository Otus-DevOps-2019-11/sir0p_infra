#!/bin/bash
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family reddit-full \
  --image-project=infra-264217 \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --zone us-central1-a
