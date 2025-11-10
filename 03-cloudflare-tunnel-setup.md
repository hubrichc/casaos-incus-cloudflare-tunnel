# 03 - Cloudflare Tunnel Setup (Docker im Alpine Incus Container)

Dieser Schritt verbindet den CasaOS-Dienst mit dem Internet über den sicheren Cloudflare Zero Trust Tunnel. Der Tunnel-Connector wird hierbei als **Docker Container** innerhalb des Incus-Containers "alpine-container" ausgeführt.

## 1. Docker im Alpine-Container installieren und vorbereiten

Der "alpine-container" muss den Docker-Daemon starten, damit der Tunnel-Container laufen kann.

1.  **Wechseln Sie in den Alpine-Container:**
    ```bash
    incus exec alpine-container /bin/sh
    ```
2.  **Im Container: Docker installieren**
    ```bash
    apk update
    apk add docker
    ```
3.  **Im Container: Docker Service für den Autostart registrieren**
    Damit Docker beim Starten des Incus-Containers automatisch läuft (via Alpine's OpenRC):
    ```bash
    rc-update add docker default
    service docker start
    ```
4.  **Wichtiger Hinweis (Nesting):** Falls Docker im Incus-Container nicht startet, müssen Sie möglicherweise auf dem Incus Host das "Nesting" (Verschachtelung) für den Container erlauben. Führen Sie ggf. auf dem **Incus Host** aus:
    ```bash
    incus config set alpine-container security.nesting true
    incus restart alpine-container
    ```
5.  **Verlassen Sie den Container:**
    ```bash
    exit
    ```

## 2. Tunnel über die Cloudflare Zero Trust Console erstellen

1.  Gehen Sie in Ihr **Cloudflare Zero Trust Dashboard** und erstellen Sie einen neuen Tunnel.
2.  Wählen Sie im Schritt **"Wählen Sie Ihre Umgebung"** die Option "Docker".
3.  Kopieren Sie den dort bereitgestellten **fertigen `docker run` Befehl**.
4.  **Führen Sie den Befehl im Alpine-Container aus und fügen Sie die Restart Policy hinzu:**

    Der kopierte Befehl muss um die Option **`--restart=unless-stopped`** ergänzt werden, um den "Always Restart"-Effekt zu erzielen. Ersetzen Sie `<...>` durch den von Cloudflare kopierten Teil:

    ```bash
    incus exec alpine-container -- sh -c 'docker run --restart=unless-stopped <HIER DEN KOMPLETTEN CLOUDFLARE DOCKER RUN BEFEHL EINFÜGEN>'
    ```
    *Der Schalter `--restart=unless-stopped` sorgt dafür, dass der Tunnel-Container automatisch startet, wenn der Docker-Daemon im Incus-Container hochfährt – dies erreicht den gewünschten "Always"-Effekt.*

## 3. Hostname Route konfigurieren

1.  Im Cloudflare Dashboard erstellen Sie eine **Public Hostname** Route für Ihren Dienst (z.B. `casaos.ihredomain.de`).
2.  Als **Service**-URL geben Sie die interne IP-Adresse und den Port des CasaOS-Containers an:
    * **IP finden:** Führen Sie auf dem Incus Host aus: `incus ls` und notieren Sie die IPv4-Adresse von `debian-container`.
    * **Beispiel-Route:** `http://[IP-VON-DEBIAN-CONTAINER]:80`

---

Mit diesen Schritten ist Ihr GitHub-Repository nun präzise und spiegelt Ihre Architektur korrekt wider.
