#!/bin/bash

# DESCRIPTION
# The purpose of this script is to fire off the setup script and then keep the Docker container running until it is stopped.
# Listening for the shutdown event in Powershell is way more complicated than in Bash, so this wrapper was created.

# Function to handle termination signals
term_handler() {
  echo "Shutdown called, stopping"
  # Your cleanup code here, if any
  exit 0
}

# Trap termination signals
trap 'term_handler' SIGTERM SIGINT

# Start the PowerShell script
pwsh -File "/scripts/Setup-Service.ps1"

# Sleep loop to keep the script running
while true; do

  # Make sure cron is running
  if ! pgrep -x "cron" > /dev/null
  then
    echo "Starting cron"
    cron -L 15
  fi
  
  sleep 5000 &
  wait $!
done
