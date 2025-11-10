#!/bin/sh
#
# 04-casaos-install.sh
# Installation von CasaOS im Debian Container
#

echo "--- 1. Wechsel in den Debian-Container ---"
# Führen Sie die folgenden Befehle MANUELL im Container aus:
incus exec debian-container /bin/sh << EOF
    echo "--- 2. Updates und curl/wget installieren ---"
    apt update && apt install -y curl wget

    echo "--- 3. CasaOS installieren ---"
    # Die Installation beginnt automatisch und ist sehr einfach.
    curl -fsSL https://get.casaos.io | sudo bash
EOF

echo "--- CasaOS Installation im Container gestartet. ---"
echo "--- Prüfen Sie den Status mit 'incus exec debian-container /bin/sh' und danach 'ps aux | grep casaos' ---"
