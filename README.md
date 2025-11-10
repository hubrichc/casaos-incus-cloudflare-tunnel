# CasaOS und Cloudflare Zero Trust Tunnel auf Incus (Die optimale Self-Hosting-Lösung für wenig Invest)

Dieses Repository demonstriert einen **Self-Hosting-Stack**, der auf **Zuverlässigkeit, Kosteneffizienz und digitaler Souveränität** ausgelegt ist.

Die Lösung wurde erfolgreich auf einem **Wyse D10D Thin Client (4GB RAM / 120GB SSD)** auf ihre Minimalanforderungen getestet und läuft als **performante Hauptinstanz** ideal auf einem gebrauchten **Lifebook A55G Laptop (16 GB RAM / 1 TB SSD)**.

## 🚀 Der unschlagbare Mehrwert dieses Setups

| Feature | Vorteil | Beschreibung |
| :--- | :--- | :--- |
| **Effizienz & Kosten** | **Preis-Leistung unschlagbar** | Läuft stabil auf **sehr schwacher, alter Hardware**, wird aber zur performanten Lösung auf gebrauchten Laptops (Lifebook o.ä.), die oft für wenig Geld erhältlich sind. |
| **Zuverlässigkeit** | **Integrierte USV (UPS)** | Durch die Nutzung eines Laptops dient der eingebaute **Akku als Notstromversorgung** – ein kostenloser und sofort verfügbarer Schutz vor kurzfristigen Stromausfällen. |
| **Wartbarkeit** | **Garantierte Datensicherheit** | Das Setup bietet eine einfache, aber professionelle **Backup-Strategie** mit Incus Export auf externe Speichermedien (USB-Platte) via Cronjob. |
| **Architektur** | **Isoliert & Sicher** | Kombination aus **CasaOS** (Nutzerfreundlichkeit) und dem Container-Manager **Incus** (Isolation, Snapshots) mit **Cloudflare Zero Trust** (Zero-Trust-Zugriff ohne Portfreigaben). |

## 🧱 Architektur

* **Fundament (Host-OS):** Alpine Linux (Minimalistisch, ideal für Thin Clients/Laptops)
* **Container-Manager:** Incus (LXD-Nachfolger)
* **debian-container:** Hostet CasaOS
* **alpine-container:** Hostet den Cloudflare Tunnel Connector

---

Dieses Repository zeigt, dass **performantes und zuverlässiges Self-Hosting** kein teures, neues Gerät erfordert, sondern von einer durchdachten Software-Architektur lebt.


## [📺](https://www.youtube.com/watch?v=stuXqnhpHzA) YouTube Video
