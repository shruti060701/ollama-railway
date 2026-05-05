# Ollama — Run LLMs on Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/TEMPLATE_CODE)

Deploy [Ollama](https://ollama.com), the open-source local LLM runner, on Railway with one click. Run Llama 3, Mistral, Gemma, Phi, and 100+ other models via a simple API.

## What's Included

| Service | Image | Purpose |
|---|---|---|
| **Ollama** | `ollama/ollama` | LLM inference server with REST API |

## How to Deploy

1. Click the "Deploy on Railway" button
2. Railway provisions the Ollama service with persistent storage
3. Pull a model: `curl https://YOUR_URL/api/pull -d '{"name": "llama3.2:1b"}'`
4. Chat: `curl https://YOUR_URL/api/chat -d '{"model": "llama3.2:1b", "messages": [{"role": "user", "content": "Hello!"}]}'`

## Environment Variables

| Variable | Default | Description |
|---|---|---|
| `OLLAMA_HOST` | `0.0.0.0:11434` | Bind address |
| `OLLAMA_MODELS` | `/root/.ollama` | Model storage path |

## Important Notes

- Models are stored on the persistent volume at `/root/.ollama` — they survive restarts
- Railway's free tier has limited RAM — start with small models like `llama3.2:1b` or `phi3:mini`
- No models are pre-loaded — pull your first model after deploy
- The API is compatible with the OpenAI chat completions format

## Estimated Cost

~$5-10/month depending on usage and model size. Larger models need more RAM.

## License

Ollama is licensed under [MIT](https://github.com/ollama/ollama/blob/main/LICENSE).
