# casaos-incus-cloudflare-tunnel
# CasaOS und Cloudflare Zero Trust Tunnel auf Incus (Alpine Thin Client)

Dieses Repository enthält die Befehle und Anleitungen, um die beliebte Self-Hosting-Plattform **CasaOS** sicher über einen **Cloudflare Zero Trust Tunnel** zugänglich zu machen. Die gesamte Architektur wird auf dem modernen Container-Manager **Incus** (dem Nachfolger von LXD) betrieben, welcher auf einem minimalistischen **Alpine Linux Thin Client** Host läuft.

Dieses Setup ermöglicht ein hohes Maß an **digitaler Souveränität**, da die gesamte Infrastruktur auf der eigenen Hardware betrieben wird.

## 🧱 Architektur

* **Host-OS:** Alpine Linux 3.22 (als Thin Client)
* **Container-Manager:** Incus
* **Container A (CasaOS):** Debian 12 (für CasaOS)
* **Container B (Tunnel):** Alpine 3.22 (für Cloudflare Tunnel Connector)

## 🛠️ Voraussetzungen

* Ein Alpine Linux System (Thin Client, VM oder dedizierter Server) mit Internetzugang.
* Ein Cloudflare Account mit aktiviertem Zero Trust / Tunnels.

## 🚀 Setup-Schritte

Führen Sie die Skripte nacheinander aus. Für die Installation im Container müssen Sie die `incus exec` Befehle manuell ausführen.

### Schritt 1: Incus auf dem Host installieren

Führen Sie das Skript `01-incus-host-setup.sh` auf Ihrem Alpine Host aus.

```bash
sh 01-incus-host-setup.sh
