# Umbau Sprungstrasse – Handwerkerplan

Statische Seite (GitHub Pages). Die Termine liegen verschlüsselt in `plan.enc.js`.

- Termine pflegen: `plan.json` bearbeiten (nicht im Git), dann `./build.sh`
- Passwort: Datei `.password` (nicht im Git)
- Lokal testen: `python3 -m http.server` und http://localhost:8000 öffnen
- Veröffentlichen: `git add -A && git commit -m "Plan aktualisiert" && git push`
