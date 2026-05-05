# Ollama + Open WebUI — Run LLMs on Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/TEMPLATE_CODE)

Deploy [Ollama](https://ollama.com) with [Open WebUI](https://openwebui.com) on Railway with one click. Run Llama 3, Mistral, Gemma, Phi, and 100+ other models through a ChatGPT-style interface or REST API.

## What's Included

| Service | Image | Purpose |
|---|---|---|
| **Ollama** | `ollama/ollama` | LLM inference server with REST API |
| **Open WebUI** | `ghcr.io/open-webui/open-webui` | ChatGPT-style web interface for Ollama |

## How to Deploy

1. Click the "Deploy on Railway" button
2. Railway provisions both services with persistent storage
3. Open the Open WebUI URL to access the chat interface
4. Create an account (first user becomes admin)
5. Pull a model from Settings → Models, or via API: `curl https://OLLAMA_URL/api/pull -d '{"name": "llama3.2:1b"}'`

## Environment Variables

| Service | Variable | Value | Description |
|---|---|---|---|
| Ollama | `OLLAMA_HOST` | `0.0.0.0:11434` | Bind address |
| Open WebUI | `OLLAMA_BASE_URL` | `http://ollama.railway.internal:11434` | Connects to Ollama via private network |

## Important Notes

- Models are stored on Ollama's persistent volume at `/root/.ollama` — they survive restarts
- Open WebUI data (users, chat history) persists at `/app/backend/data`
- Start with small models like `llama3.2:1b` or `phi3:mini` — larger models need more RAM
- No models are pre-loaded — pull your first model after deploy
- Open WebUI connects to Ollama via Railway's private network (no egress fees)

## Estimated Cost

~$5-10/month for both services depending on usage and model size.

## License

- Ollama: [MIT](https://github.com/ollama/ollama/blob/main/LICENSE)
- Open WebUI: [BSD-3](https://github.com/open-webui/open-webui/blob/main/LICENSE)
