#!/bin/bash

# --- KONFIGURACJA ---
# Wklej poniżej bezpośredni link do surowego pliku (Raw) z Twojego repozytorium GitHub
REPO_URL="https://raw.githubusercontent.com/TWOJA_NAZWA_UZYTKOWNIKA/TWOJE_REPO/main/cube"
# --------------------

echo "--- Instalator CubeBite dla Linux & macOS ---"

# 1. Sprawdzenie uprawnień (potrzebne do zapisu w /usr/local/bin)
if [ "$EUID" -ne 0 ]; then 
  echo "BŁĄD: Uruchom instalator z sudo: sudo bash install.sh"
  exit 1
fi

# 2. Sprawdzenie zależności (czy jest g++)
if ! command -v g++ &> /dev/null; then
    echo "OSTRZEŻENIE: g++ nie został znaleziony. CubeBite wymaga kompilatora C++ do działania."
fi

# 3. Pobieranie pliku
echo "Pobieranie silnika z repozytorium..."
curl -s -L "$REPO_URL" -o /usr/local/bin/cube

if [ $? -eq 0 ]; then
    # 4. Nadawanie uprawnień do wykonywania
    chmod +x /usr/local/bin/cube
    echo "-----------------------------------------------"
    echo "SUKCES: CubeBite został zainstalowany pomyślnie!"
    echo "Możesz teraz używać komendy: cube twój_plik.cbs"
    echo "-----------------------------------------------"
else
    echo "BŁĄD: Nie udało się pobrać pliku. Sprawdź połączenie lub adres URL."
    exit 1
fi
