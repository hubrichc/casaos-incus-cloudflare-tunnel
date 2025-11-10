
# CasaOS und Cloudflare Zero Trust Tunnel auf Incus (Die optimale Self-Hosting-Lösung für wenig Invest und hohe Flexibilität)

Dieses Repository demonstriert einen **Self-Hosting-Stack**, der auf **Zuverlässigkeit, Kosteneffizienz und digitaler Souveränität** ausgelegt ist. Der Ansatz nutzt die Effizienz von Containern und VMs, um **performantes Self-Hosting** auf **kostengünstiger, gebrauchter Hardware** zu ermöglichen.

## 💻 Hardware-Kompatibilität & Preis-Leistung

Das Setup ist extrem flexibel und skaliert von minimal bis performant:

* **Machbarkeitsbeweis (Minimal):** Läuft stabil auf **Wyse D10D Thin Clients** (4GB RAM) und beweist die geringen Mindestanforderungen.
* **Ideale Basis (Performant & Kostengünstig):** Hervorragend geeignet für gebrauchte **Laptops oder Mini PCs** (z.B. N100, AMD Ryzen 4-Kern/8-Thread oder Intel Core i5/i7 der 5. bis 8. Generation) mit **8–16 GB RAM** und einer SSD (auch NVMe M.2), die oft günstig erhältlich sind.
    * **Integrierte USV (UPS):** Bei Laptops dient der eingebaute **Akku als Notstromversorgung** – ein kostenloser und sofort verfügbarer Schutz vor kurzfristigen Stromausfällen.

## 🧱 Architektur und Vorteile

| Feature | Vorteil | Beschreibung |
| :--- | :--- | :--- |
| **Wartbarkeit** | **Garantierte Datensicherheit** | Das Setup bietet eine einfache, aber professionelle **Backup-Strategie** mit Incus Export auf externe Speichermedien (USB-Platte) via Cronjob. |
| **Basis-Setup** | **Isoliert & Sicher** | Kombination aus **CasaOS** (Nutzerfreundlichkeit) und dem Container-Manager **Incus** (Isolation, Snapshots) mit **Cloudflare Zero Trust** (Zero-Trust-Zugriff ohne Portfreigaben). |
| **Fundament** | **Alpine Linux & Incus** | Minimalistisches Host-System für maximale Ressourceneffizienz. |

* **debian-container:** Hostet CasaOS
* **alpine-container:** Hostet den Cloudflare Tunnel Connector (als Docker Container)

---

## 🛠️ Voraussetzungen

* Ein Alpine Linux System (Host)
* Ein Cloudflare Account mit aktiviertem Zero Trust / Tunnels.
* Die Skripte `01-incus-host-setup.sh`, `02-container-creation.sh`, `04-casaos-install.sh` und die Anleitung `03-cloudflare-tunnel-setup.md` müssen auf dem Host vorhanden sein.

## 🚀 Setup-Schritte (Anleitung)

### Schritt 1: Incus auf dem Host installieren und initialisieren

Führen Sie das Skript `01-incus-host-setup.sh` auf Ihrem Alpine Host aus.

```bash
# 01-incus-host-setup.sh Inhalt:
apk update
apk add incus incus-vm incus-client
rc-update add incusd
service incusd start
incus admin init # Interaktive Initialisierung
Schritt 2: Container erstellen
Führen Sie das Skript 02-container-creation.sh aus, um die beiden spezialisierten Container zu starten.

Bash

# 02-container-creation.sh Inhalt:
incus launch images:debian/12 debian-container
incus launch images:alpine/3.22 alpine-container
incus ls # IP-Adressen notieren!
Schritt 3: CasaOS installieren (im debian-container)
Folgen Sie den Anweisungen in 04-casaos-install.sh. Dies muss manuell im Debian-Container ausgeführt werden.

Bash

incus exec debian-container /bin/sh
# Im Container:
apt update && apt install -y curl wget
curl -fsSL [https://get.casaos.io](https://get.casaos.io) | sudo bash
Schritt 4: Cloudflare Tunnel konfigurieren (im alpine-container mit Docker)
Dieser Schritt erfordert die Installation von Docker im Alpine-Container und die Nutzung der Zero Trust Console.

Docker installieren und starten (im Container):

Bash

incus exec alpine-container /bin/sh
# Im Container:
apk update
apk add docker
rc-update add docker default
service docker start
exit
Wichtig: Bei Problemen mit Docker im Container muss auf dem Incus Host incus config set alpine-container security.nesting true ausgeführt werden.

Tunnel erstellen und starten:

Gehen Sie in die Cloudflare Zero Trust Console, erstellen Sie den Tunnel und kopieren Sie den docker run Befehl.

Führen Sie den Befehl im Alpine-Container aus und fügen Sie die always Neustart-Policy hinzu:

Bash

incus exec alpine-container -- sh -c 'docker run --restart=always <HIER DEN KOMPLETTEN CLOUDFLARE DOCKER RUN BEFEHL EINFÜGEN>'
Routing konfigurieren: Im Cloudflare Dashboard die Public Hostname Route einrichten (z.B. http://[IP-VON-DEBIAN-CONTAINER]:80).

💾 Backup-Strategie (Cronjob Beispiel)
Für die tägliche Sicherung der Container auf z.B. /disk (USB-Platte) nutzen Sie das Skript incus_backup.sh und den Cronjob:

Bash

# In der Root-Crontab (sudo crontab -e):
0 22 * * * /usr/local/bin/incus_backup.sh > /var/log/incus_backup.log 2>&1
## [📺](https://www.youtube.com/watch?v=stuXqnhpHzA) YouTube Video
