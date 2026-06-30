#!/usr/bin/env bash
set -euo pipefail

VERSION="${CESMRUN_VERSION:-0.9.0}"
BINARY="${CESMRUN_BINARY:-cesmrun-linux-x86_64}"
INSTALL_DIR="${CESMRUN_INSTALL_DIR:-$HOME/.local/bin}"
BASE_URL="https://github.com/Mrxun-JN/cesmrun-release/releases/download/v${VERSION}"
TMPDIR="${TMPDIR:-/tmp}/cesmrun-install-${VERSION}-$$"

mkdir -p "${TMPDIR}" "${INSTALL_DIR}"
cd "${TMPDIR}"

download() {
  local url="$1"
  local output="$2"
  if command -v curl >/dev/null 2>&1; then
    curl -L --fail -o "${output}" "${url}"
  elif command -v wget >/dev/null 2>&1; then
    wget -O "${output}" "${url}"
  else
    echo "ERROR: curl or wget is required to download release assets." >&2
    exit 1
  fi
}

echo "Downloading ${BINARY}"
download "${BASE_URL}/${BINARY}" "${BINARY}"

echo "Downloading SHA256SUMS"
download "${BASE_URL}/SHA256SUMS" "SHA256SUMS"

if command -v sha256sum >/dev/null 2>&1; then
  sha256sum -c SHA256SUMS
else
  echo "WARNING: sha256sum is not available; skipping checksum verification." >&2
fi

install -m 0755 "${BINARY}" "${INSTALL_DIR}/cesmrun"

echo
"${INSTALL_DIR}/cesmrun" --version
echo "Installed to ${INSTALL_DIR}/cesmrun"
echo "Make sure ${INSTALL_DIR} is in your PATH."
