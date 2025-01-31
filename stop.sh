#!/bin/bash
echo -e "Stopping webui docker...\n" &&
docker stop open-webui &&
echo -e "Removing webui docker...\n" &&
docker container rm open-webui &&

echo -e "Stopping Ollama...\n" &&
sudo killall ollama &&
sudo systemctl stop ollama.service &&
echo "Done."
