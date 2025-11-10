#!/bin/sh
#
# 02-container-creation.sh
# Erstellung der beiden spezialisierten Container
#

echo "--- 1. Container für CasaOS (Debian 12) erstellen ---"
incus launch images:debian/12 debian-container

echo "--- 2. Container für Cloudflare Tunnel (Alpine 3.22) erstellen ---"
incus launch images:alpine/3.22 alpine-container

echo "--- 3. Status der Container prüfen (IP-Adressen notieren!) ---"
# Notieren Sie die IPv4-Adresse von 'debian-container' für den Cloudflare Tunnel.
incus ls

echo "Container erstellt. Weiter mit CasaOS Installation und Cloudflare Setup."
