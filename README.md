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
3. Open the **Open WebUI** URL to access the chat interface
4. Create an account (first user becomes admin)

## Loading Your First Model

No models are pre-loaded — you need to pull one before chatting:

1. In Open WebUI, go to **Settings** (gear icon) → **Models**
2. In the "Pull a model from Ollama.com" field, type `llama3.2:1b`
3. Click the download button (↓) and wait for it to finish (~1.3GB)
4. Close the modal, go back to the chat screen
5. Select **llama3.2:1b** from the model dropdown at the top
6. Start chatting!

### Recommended Models for Railway

| Model | Size | Best For |
|---|---|---|
| `llama3.2:1b` | 1.3 GB | Fast responses, low RAM usage |
| `phi3:mini` | 2.3 GB | Strong reasoning for its size |
| `gemma2:2b` | 1.6 GB | Google's compact model |
| `qwen2.5:1.5b` | 1.1 GB | Multilingual support |
| `mistral:7b` | 4.1 GB | Higher quality, needs more RAM |

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
