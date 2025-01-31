#!/bin/bash
echo -e "Stopping webui docker...\n" &&
sudo docker stop open-webui &&
echo -e "Removing webui docker...\n" &&
sudo docker container rm open-webui &&

echo -e "Stopping Ollama...\n" &&
sudo killall ollama &&
sudo systemctl stop ollama.service &&
echo "Done."
