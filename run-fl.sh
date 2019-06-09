#!/bin/bash
docker run --name fl1 -h fl1 -p 4444:4444  \
  --env FLUME_AGENT_NAME=a1 \
  --volume ~/projects/docker/docker-flume/config:/opt/flume/conf \
  --volume ~/projects/docker/docker-flume/config/flume.conf:/opt/flume/conf/flume.conf \
  --rm \
  my-flume-image:latest
