# 03 - Cloudflare Tunnel Setup (im alpine-container)

Dieser Schritt verbindet den CasaOS-Dienst mit dem Internet über den sicheren Cloudflare Zero Trust Tunnel.

## 1. Cloudflare Connector (cloudflared) installieren

1.  **Wechseln Sie in den Alpine-Container:**
    ```bash
    incus exec alpine-container /bin/sh
    ```
2.  **Im Container: `cloudflared` installieren**
    ```bash
    apk update
    apk add cloudflared
    ```
3.  **Im Container: Authentifizierung**
    Führen Sie diesen Befehl aus und folgen Sie dem Browser-Link, um den Connector mit Ihrem Cloudflare-Konto zu verknüpfen:
    ```bash
    cloudflared tunnel login
    ```
4.  **Im Container: Tunnel erstellen** (ersetzen Sie `MY-CASAOS-TUNNEL` durch einen Namen Ihrer Wahl)
    ```bash
    cloudflared tunnel create MY-CASAOS-TUNNEL
    ```

## 2. Cloudflare Zero Trust Dashboard Konfiguration

1.  Gehen Sie in Ihr Cloudflare Zero Trust Dashboard.
2.  Erstellen Sie eine **Public Hostname** Route für Ihren Dienst (z.B. `casaos.ihredomain.de`).
3.  Als **Service**-URL geben Sie die interne IP-Adresse und den Port des CasaOS-Containers an:
    * **IP finden:** Führen Sie auf dem Incus Host aus: `incus ls` und notieren Sie die IPv4-Adresse von `debian-container`.
    * **Beispiel-Route:** `http://[IP-VON-DEBIAN-CONTAINER]:80`

## 3. Tunnel starten

1.  **Im Container: Tunnel ausführen**
    ```bash
    cloudflared tunnel run MY-CASAOS-TUNNEL
    ```
    Der Tunnel ist nun aktiv und verbindet Ihren Hostnamen mit CasaOS.

2.  *Optional: Autostart einrichten:* Fügen Sie `cloudflared` als Service mit `rc-update add cloudflared` hinzu, um einen automatischen Start des Tunnels nach einem Neustart des Containers zu gewährleisten.
