#!/bin/sh
# Verschlüsselt plan.json -> plan.enc.js (das wird veröffentlicht, plan.json nicht).
# Passwort: Datei .password (eine Zeile) oder Umgebungsvariable PLAN_PASSWORD.
set -e
cd "$(dirname "$0")"

python3 -m json.tool plan.json > /dev/null   # Syntax prüfen

if [ -n "$PLAN_PASSWORD" ]; then
  PASS="env:PLAN_PASSWORD"
elif [ -f .password ]; then
  PASS="file:.password"
else
  echo "Kein Passwort: .password anlegen oder PLAN_PASSWORD setzen." >&2; exit 1
fi

ENC=$(openssl enc -aes-256-cbc -pbkdf2 -iter 200000 -md sha256 -salt -pass "$PASS" -in plan.json | openssl base64 -A)
printf 'window.PLAN_ENC="%s";\n' "$ENC" > plan.enc.js
echo "plan.enc.js aktualisiert."
