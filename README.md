# CasaOS und Cloudflare Zero Trust Tunnel auf Incus (Alpine Thin Client)

Dieses Repository demonstriert einen **Self-Hosting-Stack**, der auf **Zuverlässigkeit, Einfachheit und digitaler Souveränität** ausgelegt ist. Es enthält alle Befehle, um **CasaOS** über den modernen Container-Manager **Incus** zu hosten und sicher über einen **Cloudflare Zero Trust Tunnel** erreichbar zu machen.

## 💾 Der entscheidende Vorteil: Zuverlässigkeit durch Incus-Backup

Jede Self-Hosting-Instanz benötigt eine einfache und garantierte Backup-Strategie. **Incus** (der Nachfolger von LXD) ist hierfür in kleineren Setups ideal, da es komplette Container – inklusive aller Daten und Konfigurationen – **atomar und konsistent** sichert:

1.  **Einfache Sicherung:** Der Befehl `incus export <Containername>` erstellt ein vollständiges Backup-Archiv.
2.  **Automatisierung:** Ein einfacher Cronjob kann täglich oder stündlich Backups erstellen und diese per SFTP, rsync oder einem anderen Protokoll auf einen externen Server übertragen.
3.  **Schnelle Wiederherstellung:** Im Katastrophenfall kann das Backup-Archiv schnell wieder importiert und gestartet werden.
4.  **Snapshots für Updates:** Vor jedem Upgrade ist ein Snapshot mit `incus snapshot <Containername>` sofort erstellt, was sofortige Rollbacks ermöglicht.

Dieses Setup stellt sicher, dass Ihre **CasaOS** Instanz nicht nur läuft, sondern auch **produktionsreif** und **wartbar** ist.

## 🧱 Architektur

* **Fundament (Host-OS):** Alpine Linux 3.22 (minimalistischer Thin Client)
* **Container-Manager:** Incus (mit exzellenten Snapshot- und Backup-Funktionen)
* **CasaOS Container:** Debian 12 (Hostet CasaOS)
* **Cloudflare Tunnel Container:** Alpine 3.22 (Isolierter Cloudflare Tunnel Connector für **Zero Trust** Zugang)

## 🛠️ Voraussetzungen

* Ein Alpine Linux System (Thin Client, VM oder dedizierter Server) mit Internetzugang.
* Ein Cloudflare Account mit aktiviertem Zero Trust / Tunnels.

## 🚀 Setup-Schritte

Folgen Sie den nummerierten Skripten und der Anleitung im Markdown-Dokument.

1.  **`01-incus-host-setup.sh`**: Installation und Initialisierung von Incus auf dem Alpine Host.
2.  **`02-container-creation.sh`**: Erstellung des Debian- und des separaten Alpine-Containers.
3.  **`04-casaos-install.sh`**: Installation von CasaOS **im Debian-Container**.
4.  **`03-cloudflare-tunnel-setup.md`**: Schritt-für-Schritt-Anleitung für die Installation und Konfiguration des Cloudflare Tunnels **im Alpine-Container**.

---

## 💡 Erweiterungsmöglichkeiten

Dieses Setup kann leicht um weitere Services wie **Nginx Proxy Manager (NPM Plus)**, **DDClient** oder andere **Kubernetes-Dienste** erweitert werden, die Sie in eigenen Containern betreiben können.

## 📺 YouTube Video
