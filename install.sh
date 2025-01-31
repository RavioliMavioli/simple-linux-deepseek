#!/bin/bash

Docker(){
    echo -e "Checking for docker...\n"
    if ! command -v /usr/bin/docker 2>&1 >/dev/null
    then
        echo -e "Oops, seems like docker is not installed yet." &&
        echo -e "Install docker: https://docs.docker.com/desktop/setup/install/linux/" &&
        exit 1
    fi

    # Pull webui
    sudo docker pull ghcr.io/open-webui/open-webui:main
}

Ollama(){
    echo -e "Checking for Ollama...\n"
    if ! command -v /usr/local/bin/ollama 2>&1 >/dev/null
    then
        echo -e "Installing Ollama...\n" &&
        curl -fsSL https://ollama.com/install.sh | sh &&
        sleep 1 &&
        sudo systemctl disable ollama.service
    fi
    echo -e "Ollama installed.\n" &&
    sudo systemctl start ollama.service &&
    sleep 3 &&
    echo -e "Installing DeepSeek 1.5b.\n" &&
    ollama pull deepseek-r1:1.5b &&
    echo -e "DeepSeek installed.\n" &&
    sudo systemctl stop ollama.service
}

Copy(){
    echo -e "Copying script to /usr/bin...\n"
    cd script/ &&
    chmod +x start.sh && chmod +x stop.sh &&
    sudo cp start.sh "/usr/bin/deepseek-start" && sudo cp stop.sh "/usr/bin/deepseek-stop" &&

    echo -e "Done.\n"
    echo "To start DeepSeek    : deepseek-start"
    echo "To stop DeepSeek     : deepseek-stop"
}

Docker && Ollama && Copy
