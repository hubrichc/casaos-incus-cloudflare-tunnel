#!/bin/bash

# --- Konfiguration ---
# Das Zielverzeichnis auf der gemounteten USB-Platte (ext4)
BACKUP_DIR="/disk/incus_backups"

# Liste der zu sichernden Container (Hier: CasaOS und Cloudflare Tunnel)
# Passen Sie die Namen an, falls Sie weitere Container sichern möchten.
CONTAINERS=("alpine-container" "debian-container")

# Anzahl der Tage, für die Backups aufbewahrt werden sollen (hier: 7 Tage)
RETENTION_DAYS=7

# --- Ausführung ---

# 1. Sicherstellen, dass das Zielverzeichnis existiert
mkdir -p "$BACKUP_DIR"

# 2. Schleife durch alle Container
for CONTAINER_NAME in "${CONTAINERS[@]}"; do
    echo "--- Starte Backup für Container: $CONTAINER_NAME ---"

    # Erzeuge einen eindeutigen Dateinamen mit aktuellem Datum und Uhrzeit
    TIMESTAMP=$(date +%Y%m%d_%H%M)
    BACKUP_FILENAME="${CONTAINER_NAME}_${TIMESTAMP}.tar.xz"
    BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILENAME"
    
    # Exportiert den Container (Snapshot und Export in einem Schritt als komprimiertes tar.xz Archiv)
    if incus export "$CONTAINER_NAME" "$BACKUP_PATH"; then
        echo "✅ Export von $CONTAINER_NAME erfolgreich nach $BACKUP_PATH"
    else
        echo "❌ FEHLER beim Export von $CONTAINER_NAME. Prüfung erforderlich."
    fi

done

# 3. Aufräumarbeiten (alte Backups löschen)
echo "--- Starte Aufräumarbeiten ($RETENTION_DAYS Tage Retention) ---"

# Findet alle Incus Backup-Dateien (*.tar.xz) im Zielverzeichnis, die älter als RETENTION_DAYS sind, und löscht sie
find "$BACKUP_DIR" -type f -name "*.tar.xz" -mtime +$RETENTION_DAYS -delete
echo "✅ Alte Backups (älter als $RETENTION_DAYS Tage) wurden gelöscht."

echo "--- Backup-Skript beendet ---"
