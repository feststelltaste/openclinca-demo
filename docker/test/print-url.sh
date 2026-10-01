#!/usr/bin/env bash
set -euo pipefail

if [[ -n "${CODESPACE_NAME:-}" ]]; then
    echo "Open https://${CODESPACE_NAME}-8080.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:-app.github.dev}/OpenClinica/MainMenu"
else
    echo "Open http://127.0.0.1:8080/OpenClinica/MainMenu"
fi
echo "Sign in with root / 12345678"
