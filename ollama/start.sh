#!/bin/sh
set -e

# Start Ollama server in background
ollama serve &

# Wait for server to be ready
echo "Waiting for Ollama server..."
until ollama list >/dev/null 2>&1; do
  sleep 1
done
echo "Ollama server ready."

# Pull models from PULL_MODELS env var (comma-separated)
# Note: DO NOT use OLLAMA_MODELS — that's reserved by Ollama for the model storage directory
if [ -n "$PULL_MODELS" ]; then
  echo "$PULL_MODELS" | tr ',' '\n' | while read model; do
    model=$(echo "$model" | tr -d ' ')
    if [ -n "$model" ]; then
      echo "Pulling model: $model"
      ollama pull "$model"
      echo "Done: $model"
    fi
  done
fi

# Keep server in foreground
wait
