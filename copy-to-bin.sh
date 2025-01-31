#!/bin/bash
echo -e "Copying scripts to /usr/bin...\n" &&
sudo cp "start.sh" "/usr/bin/deepseek-start" && sudo chmod +x "/usr/bin/deepseek-start" &&
sudo cp "stop.sh" "/usr/bin/deepseek-stop" && sudo chmod +x "/usr/bin/deepseek-stop" &&

echo -e "Done.\n"
echo "To start DeepSeek    : deepseek-start"
echo "To stop DeepSeek     : deepseek-stop"
