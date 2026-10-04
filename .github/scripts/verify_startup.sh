#!/usr/bin/env bash
PORT=$1
TIMEOUT=$2
ENDPOINT=$3

echo "Verifying startup on port ${PORT}${ENDPOINT}..."
for ((i=1; i<=TIMEOUT; i++)); do
  if curl -sf "http://localhost:${PORT}${ENDPOINT}" > /dev/null; then
    echo "Service is healthy!"
    exit 0
  fi
  sleep 1
done

echo "Health check timed out."
exit 1
