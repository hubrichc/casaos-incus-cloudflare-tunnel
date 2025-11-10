# 03 - Cloudflare Tunnel Setup (im alpine-container)

Dieser Schritt verbindet den CasaOS-Dienst mit dem Internet über den sicheren Cloudflare Zero Trust Tunnel.

## 1. Cloudflare Connector (cloudflared) vorab installieren

Bevor Sie den Startbefehl aus der Cloudflare-Konsole verwenden können, muss das Tool im Container verfügbar sein.

1.  **Wechseln Sie in den Alpine-Container:**
    ```bash
    incus exec alpine-container /bin/sh
    ```
2.  **Im Container: `cloudflared` installieren**
    ```bash
    apk update
    apk add cloudflared
    ```
3.  **Verlassen Sie den Container vorerst:**
    ```bash
    exit
    ```

## 2. Tunnel über die Cloudflare Zero Trust Console erstellen (Empfohlen)

Dies ist der einfachste Weg, da Cloudflare die notwendigen Token automatisch bereitstellt.

1.  Gehen Sie in Ihr **Cloudflare Zero Trust Dashboard** und erstellen Sie einen neuen Tunnel.
2.  Folgen Sie den Anweisungen. Im Schritt **"Wählen Sie Ihre Umgebung"** wählen Sie "Linux" oder "Docker".
3.  Die Konsole gibt Ihnen einen **fertigen `cloudflared tunnel run <UUID>` Befehl** aus, der das Authentifizierungs-Token enthält.
4.  **Führen Sie diesen Befehl im Alpine-Container aus:**
    ```bash
    incus exec alpine-container -- cloudflared tunnel run <IHR-TUNNEL-NAME-ODER-UUID>
    ```

## 3. Hostname Route konfigurieren

1.  Im Cloudflare Dashboard erstellen Sie eine **Public Hostname** Route für Ihren Dienst (z.B. `casaos.ihredomain.de`).
2.  Als **Service**-URL geben Sie die interne IP-Adresse und den Port des CasaOS-Containers an:
    * **IP finden:** Führen Sie auf dem Incus Host aus: `incus ls` und notieren Sie die IPv4-Adresse von `debian-container`.
    * **Beispiel-Route:** `http://[IP-VON-DEBIAN-CONTAINER]:80`

## 4. Dauerhafter Betrieb und Autostart

Für den produktiven Betrieb muss der Tunnel auch nach einem Neustart des Containers automatisch starten. Da Alpine Linux **OpenRC** verwendet, kann der `cloudflared` Dienst als Hintergrundprozess oder als OpenRC-Service eingerichtet werden.

**Option A: Einfacher Start im Hintergrund (manuell, bis zum Container-Neustart)**

Wenn Sie den Tunnel nur schnell starten wollen, können Sie das Kommando mit einem **Kaufmanns-Und (&)** in den Hintergrund schicken:

```bash
incus exec alpine-container -- cloudflared tunnel run <IHR-TUNNEL-NAME> &
Option B: Setup als OpenRC Service (Empfohlen für den Autostart)

Da die Konfiguration (UUID/Token) über die Cloudflare Console erfolgt, ist der robusteste Weg, den cloudflared Dienst als OpenRC Service im Alpine Container einzurichten. Details hierzu finden Sie in der offiziellen cloudflared Dokumentation für Linux/OpenRC. Dies stellt sicher, dass der Dienst beim Hochfahren des Containers automatisch gestartet wird.

Bash

# Im Container (Alpine):
# Hier müssten die Konfigurationsdateien (meist in /etc/cloudflared/config.yml) 
# und der Startskript-Link für OpenRC erstellt werden, 
# damit der Tunnel automatisch über 'rc-update add cloudflared default' startet.
# Dies ist die sauberste Lösung für den Dauerbetrieb.
