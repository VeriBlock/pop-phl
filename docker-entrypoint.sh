#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for placehd"

  set -- placehd "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "placehd" ]; then
  mkdir -p "$DATA_DIR"
  
  if [ -z "$UID" ]; then
    UID=0;
    echo "Acting as user ${UID}.";
  else 
    echo "User $UID set.";
  fi

  if [ -z "$GID" ]; then
    GID=0;
    echo "Acting as group ${GID}.";
  else 
    echo "Group $GID set.";
  fi

  echo "$0: setting data directory to $DATA_DIR"

  set -- "$@" -datadir="$DATA_DIR"
fi

echo
dockerize \
    -template /tmp/placeh.conf.tmpl:$DATA_DIR/placeh.conf \
    "$@"