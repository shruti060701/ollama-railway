# Deploy and Host Ollama-self-hosted on Railway

Ollama lets you run large language models through a single binary. It wraps models like Llama 3, Mistral, Gemma, and Phi behind a REST API that's compatible with the OpenAI chat format. This template pairs it with Open WebUI — a ChatGPT-style interface where you can chat with models, manage conversations, and switch between LLMs from a browser. Llama 3.2 (1B) auto-downloads on first deploy, so you can start chatting within minutes.

## About Hosting Ollama-self-hosted

Running LLMs on your laptop works until you need uptime. Your machine sleeps, your IP changes, your teammates can't reach your endpoint. Self-hosting Ollama on Railway solves that — you get a persistent URL, automatic restarts, and a volume that keeps your downloaded models across deploys. Open WebUI gives your team a familiar chat interface without building one yourself. Railway terminates SSL at the edge, so your API calls are encrypted without touching Nginx configs. The two services talk over Railway's private network — no egress fees, no exposed ports. Llama 3.2:1b auto-pulls on first startup via the `OLLAMA_MODELS` env var. Want a different model? Change the variable to any model from [Ollama's library](https://ollama.com/library) — comma-separate for multiple models. Total cost runs ~$5-10/month depending on which models you load and how often you hit the API.

## Common Use Cases

- **Team AI chat without SaaS fees** — Open WebUI gives everyone a ChatGPT-style interface backed by open-source models. No per-seat pricing, no usage caps, no data leaving your infra
- **RAG pipeline backend** — Feed your documents into a retrieval pipeline and use Ollama as the generation layer. Keeps your data off third-party servers entirely
- **AI prototyping without API costs** — Test prompts, fine-tune system messages, and iterate on agent workflows without burning through OpenAI or Anthropic credits. Switch models with one click in the UI
- **CI/CD code review** — Hook Ollama into your deployment pipeline to review PRs, generate commit summaries, or flag security issues. Runs on your infra, so proprietary code never leaves your network
- **Private AI for regulated industries** — Healthcare, legal, and finance teams that can't send data to external LLM providers. Self-hosted Ollama keeps everything inside your infrastructure boundary

## Dependencies for Ollama-self-hosted Hosting

- **Persistent Volume (Ollama)** — Stores downloaded model files at `/root/.ollama`. Without it, you'd re-download ~1.3GB of model data on every deploy. Railway provisions this automatically
- **Persistent Volume (Open WebUI)** — Stores user accounts, chat history, and settings at `/app/backend/data`

### Deployment Dependencies

- [Ollama Official Website](https://ollama.com)
- [Ollama API Documentation](https://github.com/ollama/ollama/blob/main/docs/api.md)
- [Ollama Model Library](https://ollama.com/library)
- [Open WebUI Documentation](https://docs.openwebui.com)
- [Open WebUI GitHub Repository](https://github.com/open-webui/open-webui)

### Implementation Details

This template deploys two services that communicate over Railway's private network:

```
# Ollama LLM Server
Image: ollama/ollama:latest
Port: 11434
Volume: /root/.ollama (model storage)
Auto-pulls: llama3.2:1b on first startup (configurable via OLLAMA_MODELS env var)

# Open WebUI (ChatGPT-style interface)
Image: ghcr.io/open-webui/open-webui:latest
Port: 8080
Volume: /app/backend/data (users, chat history)
Connects to: http://ollama.railway.internal:11434
```

A custom startup script launches the Ollama server, waits for it to be ready, then pulls models listed in the `OLLAMA_MODELS` environment variable (comma-separated). The default is `llama3.2:1b` (~1.3GB) — the smallest Llama model that works well within Railway's RAM limits. Change it to `phi3:mini`, `gemma2:2b`, or `mistral:7b` for different capabilities. After deploy, open the Open WebUI URL and create your first account — the first user automatically becomes admin.

## Why Deploy Ollama-self-hosted on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Ollama-self-hosted on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
