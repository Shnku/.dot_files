#!/bin/bash
# \033[0;32m #code for green colour
# \033[1m #code for bold
# \033[0;33m #code for no change

# changing the sudo prompt
export SUDO_PROMPT="$(echo -e ' \033[0;31m \033[1m Enter your PASSWORD:\033[0m')"

# main part.........
figlet  --metal "Updating Your System" -f pagga
echo ''
sudo nala update 
sleep 1
echo ''
figlet  -t "done" -f pagga
sleep 1
