#!/bin/sh
#
# 01-incus-host-setup.sh
# Installation von Incus auf dem Alpine Linux Host (Thin Client)
#

echo "--- 1. Pakete aktualisieren ---"
apk update

echo "--- 2. Incus und Incus-Tools installieren ---"
# incus-vm ist für VM-Unterstützung optional, kann aber dabei sein.
apk add incus incus-vm incus-client

echo "--- 3. Incus Daemon für den Autostart registrieren und starten ---"
rc-update add incusd
service incusd start

echo "--- 4. Incus initialisieren ---"
# Führen Sie die Initialisierung interaktiv durch (Netzwerk-Bridge etc. einrichten).
# Bestätigen Sie die Standardeinstellungen für ein internes Subnetz.
incus admin init

echo "Setup abgeschlossen. Incus ist bereit."
