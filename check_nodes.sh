#!/bin/bash

declare -A SERVERS
declare -A APPS

# Dumb trick to retain order in an associate array
ENV_LIST=(Dev Test Stage1 Stage2 Prod1 Prod2)
PORT_LIST=(3000 3001 3002 3003 3004 3005)

# Server list
SERVERS=(
  ["Dev"]="dev_hostname"
  ["Test"]="test_hostname"
  ["Stage1"]="stage1_hostname"
  ["Stage2"]="stage2_hostname"
  ["Prod1"]="prod1_hostname"
  ["Prod2"]="prod2_hostname"
)

# App list
APPS=(
  [3000]="App Name 1"
  [3001]="App Name 2"
  [3002]="App Name 3"
  [3003]="App Name 4"
  [3004]="App Name 5"
  [3005]="App Name 6"
)

echo
echo "####"
echo "#### Checking application servers..."
echo "####"

for ENVIRONMENT in ${ENV_LIST[@]}; do
  echo
  echo "$ENVIRONMENT (${SERVERS[$ENVIRONMENT]})"
  echo ---------------------
  for PORT in ${PORT_LIST[@]}; do
    RSLT=$(nc -w4 -vz ${SERVERS[$ENVIRONMENT]} $PORT 2>&1)
    if [ $? = 0 ]; then
      printf "%-25s %s\n" "${APPS[$PORT]}" " on $PORT is UP"
    else
      echo "$RSLT"
    fi
  done
done