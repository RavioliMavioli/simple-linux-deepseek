#!/bin/bash

### STOP DEEPSEEK IF ANY
deepseek-stop;

### CLEAN DELETE OLLAMA
sudo systemctl stop ollama;
sudo systemctl disable ollama;
sudo rm /etc/systemd/system/ollama.service &&
sudo rm $(which ollama) &&
sudo rm -r /usr/share/ollama &&
sudo userdel ollama &&
sudo groupdel ollama

### DELETE DOCKER
sudo docker container rm open-webui;
sudo docker image rm open-webui;


### DELETE SCRIPT
sudo rm /usr/bin/deepseek-start &&
sudo rm /usr/bin/deepseek-stop
