#!/bin/bash
if ! command -v /usr/local/bin/ollama 2>&1 >/dev/null
then
    echo -e "Installing Ollama...\n" &&
    curl -fsSL https://ollama.com/install.sh | sh &&
    sudo systemctl disable ollama.service
fi

echo -e "Starting ollama...\n" &&
sudo systemctl start ollama.service &&

echo -e "Creating webui...\n" &&
docker run -d --network="host" -v open-webui:/app/backend/data -e OLLAMA_API_BASE_URL=127.0.0.1:11434/api --add-host=host.docker.internal:127.0.0.1 --dns 8.8.8.8 --name open-webui ghcr.io/open-webui/open-webui:main &&

echo -e "\nWaiting...\n" &&
sleep 15 &&

echo "Done." &&
firefox http://localhost:8080
