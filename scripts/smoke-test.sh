#!/bin/bash
set -e

URL=${1:-http://localhost:8080}

echo "Running smoke test against $URL"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL/healthz")
if [ "$STATUS" != "200" ]; then
  echo "FAIL: /healthz returned HTTP $STATUS, expected 200"
  exit 1
fi

BODY=$(curl -s "$URL/healthz")
if [ "$BODY" != "healthy" ]; then
  echo "FAIL: /healthz body was '$BODY', expected 'healthy'"
  exit 1
fi

echo "OK: /healthz returned 200 with body 'healthy'"
