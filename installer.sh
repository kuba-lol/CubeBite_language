#!/bin/bash

# Twoja sprawdzona ścieżka RAW
REPO_URL="https://raw.githubusercontent.com/kuba-lol/CubeBite_language/refs/heads/main/cube"

echo "--- Instalation of CubeBite ---"

# Pobieranie bezpośrednio do folderu binarnego
# Używamy sudo, bo /usr/local/bin jest chroniony
sudo curl -L "$REPO_URL" -o /usr/local/bin/cube

if [ $? -eq 0 ]; then
    sudo chmod +x /usr/local/bin/cube
    echo "-----------------------------------------------"
    echo "SUKCES: CubeBite installed"
    echo "Try typing in command "cube""
    echo "-----------------------------------------------"
else
    echo "ERROR: CubeBite is not installed."
    exit 1
fi
