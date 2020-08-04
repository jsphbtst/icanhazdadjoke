#!/bin/bash

command=$1
if [[ $command == 'dev' ]]; then
  printf 'Setting up dev environment hold up...\n'
  docker-compose up

elif [[ $command == 'build' ]]; then
  printf 'Building dev environment... Remember to run start after.\n'
  docker-compose up --build

elif [[ $command == 'start' ]]; then
  printf 'Starting dev environment from latest build...\n'
  docker-compose start

elif [[ $command == 'stop' ]]; then
  printf 'Stopping instances...\n'
  docker-compose down

elif [[ $command == 'fullstop' ]]; then
  printf 'Slow computer, huh? Ok, full stop incoming...\n'
  docker-compose down
  docker stop $(docker ps -aq)

elif [[ $command == 'prune' ]]; then
  printf 'Removing dangling images...\n'
  docker image rm $(docker images -f "dangling=true")

fi
