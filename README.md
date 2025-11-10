
# CasaOS und Cloudflare Zero Trust Tunnel auf Incus (Die optimale Self-Hosting-Lösung für wenig Invest und hohe Flexibilität)

Dieses Repository demonstriert einen **Self-Hosting-Stack**, der auf **Zuverlässigkeit, Kosteneffizienz und digitaler Souveränität** ausgelegt ist. Der Ansatz nutzt die Effizienz von Containern und VMs, um **performantes Self-Hosting** auf **kostengünstiger, gebrauchter Hardware** zu ermöglichen.

## 💻 Hardware-Kompatibilität & Preis-Leistung

Das Setup ist extrem flexibel und skaliert von minimal bis performant:

* **Machbarkeitsbeweis (Minimal):** Läuft stabil auf **Wyse D10D Thin Clients** (4GB RAM) und beweist die geringen Mindestanforderungen.
* **Ideale Basis (Performant & Kostengünstig):** Hervorragend geeignet für gebrauchte **Laptops oder Mini PCs** (z.B. N100, AMD Ryzen 4-Kern/8-Thread oder Intel Core i5/i7 der 5. bis 8. Generation) mit **8–16 GB RAM** und einer SSD (auch NVMe M.2), die oft günstig erhältlich sind.
    * **Integrierte USV (UPS):** Bei Laptops dient der eingebaute **Akku als Notstromversorgung** – ein kostenloser und sofort verfügbarer Schutz vor kurzfristigen Stromausfällen.

Diese Lösung bietet eine **hohe Performance** und **volle Kontrolle** bei minimaler Investition.

## 🧱 Architektur und Vorteile

| Feature | Vorteil | Beschreibung |
| :--- | :--- | :--- |
| **Wartbarkeit** | **Garantierte Datensicherheit** | Das Setup bietet eine einfache, aber professionelle **Backup-Strategie** mit Incus Export auf externe Speichermedien (USB-Platte) via Cronjob. |
| **Basis-Setup** | **Isoliert & Sicher** | Kombination aus **CasaOS** (Nutzerfreundlichkeit) und dem Container-Manager **Incus** (Isolation, Snapshots) mit **Cloudflare Zero Trust** (Zero-Trust-Zugriff ohne Portfreigaben). |
| **Fundament** | **Alpine Linux & Incus** | Minimalistisches Host-System für maximale Ressourceneffizienz. |

* **debian-container:** Hostet CasaOS
* **alpine-container:** Hostet den Cloudflare Tunnel Connector

---

Dieses Repository zeigt, dass **performantes und zuverlässiges Self-Hosting** von einer durchdachten Software-Architektur lebt und auf fast jeder gängigen Gebraucht-Hardware realisiert werden kann.

## [📺](https://www.youtube.com/watch?v=stuXqnhpHzA) YouTube Video
