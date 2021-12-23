#!/bin/sh

mkdir -p /data

if [ ! -z "$CONFIG" ]; then
  echo "$CONFIG" > config.json
else
  echo '{ "data": "/data", "security_type": "friends" }' > config.json
fi

npm run start --config config.json
