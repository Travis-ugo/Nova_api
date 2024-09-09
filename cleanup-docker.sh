#!/bin/bash

ENV=$1
if [ -z "$ENV" ]; then
  echo "Please specify the environment."
  exit 1
fi

ENV_FILE="$ENV"
if [ ! -f $ENV_FILE ]; then
  echo "Environment file $ENV_FILE does not exist."
  exit 1
fi

# Export the ENV_FILE variable for docker-compose to pick up
export ENV_FILE

# Run docker-compose with the specified .env file
docker-compose --env-file "$ENV_FILE" rm