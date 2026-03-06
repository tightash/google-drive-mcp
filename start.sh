#!/bin/bash
mkdir -p /app/config
echo "$GCP_OAUTH_KEYS_JSON" > /app/config/gcp-oauth.keys.json
echo "$GOOGLE_TOKENS_JSON" > /app/config/tokens.json
GOOGLE_DRIVE_OAUTH_CREDENTIALS=/app/config/gcp-oauth.keys.json
GOOGLE_DRIVE_MCP_TOKEN_PATH=/app/config/tokens.json
node dist/index.js
