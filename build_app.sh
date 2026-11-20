#!/usr/bin/env bash
# Builds Driftwall.app from source.
#   ./build_app.sh            → build/Driftwall.app
#   ./build_app.sh --install  → also copies it to /Applications and launches it
set -euo pipefail
cd "$(dirname "$0")"

APP="Driftwall"
OUT="build/$APP.app"

if ! command -v swift >/dev/null 2>&1; then
  echo "✗ Swift not found. Install Apple's Command Line Tools first:"
  echo "    xcode-select --install"
  exit 1
fi

echo "→ Swift: $(swift --version 2>&1 | head -1)"
echo "→ Compiling (release)…"
swift build -c release
BIN_DIR="$(swift build -c release --show-bin-path)"

echo "→ Assembling $OUT"
rm -rf "$OUT"
mkdir -p "$OUT/Contents/MacOS" "$OUT/Contents/Resources"
cp "$BIN_DIR/$APP" "$OUT/Contents/MacOS/$APP"
cp Support/Info.plist "$OUT/Contents/Info.plist"
printf 'APPL????' > "$OUT/Contents/PkgInfo"

# App icon: render an SF Symbol-free gradient icon with the system tools (best effort).
if command -v sips >/dev/null && command -v iconutil >/dev/null && command -v swift >/dev/null; then
  ICONSET="build/AppIcon.iconset"
  rm -rf "$ICONSET"; mkdir -p "$ICONSET"
  if swift Support/make_icon.swift "build/icon_1024.png" >/dev/null 2>&1; then
    for s in 16 32 128 256 512; do
      sips -z $s $s "build/icon_1024.png" --out "$ICONSET/icon_${s}x${s}.png" >/dev/null
      d=$((s*2)); sips -z $d $d "build/icon_1024.png" --out "$ICONSET/icon_${s}x${s}@2x.png" >/dev/null
    done
    iconutil -c icns "$ICONSET" -o "$OUT/Contents/Resources/AppIcon.icns" || true
  fi
fi

echo "→ Signing (ad-hoc, hardened runtime)"
codesign --force --deep --options runtime --sign - "$OUT"
codesign --verify --verbose=1 "$OUT"

echo "✓ Built $OUT"

if [[ "${1:-}" == "--install" ]]; then
  echo "→ Installing to /Applications"
  osascript -e "tell application \"$APP\" to quit" >/dev/null 2>&1 || true
  sleep 1
  rm -rf "/Applications/$APP.app"
  cp -R "$OUT" "/Applications/$APP.app"
  open "/Applications/$APP.app"
  echo "✓ Installed and launched /Applications/$APP.app"
fi
