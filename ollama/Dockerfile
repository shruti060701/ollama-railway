FROM ollama/ollama:latest

USER root

ENV OLLAMA_HOST=0.0.0.0:11434
ENV PORT=11434
ENV OLLAMA_MODELS=llama3.2:1b

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 11434

ENTRYPOINT []
CMD ["/bin/sh", "/start.sh"]
