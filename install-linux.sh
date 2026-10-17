#!/usr/bin/env bash
# Installs Gooby for the current user, no sudo needed:
#   - the AppImage in ~/.local/share/gooby (a fixed path, so in-app updates
#     replace it in place),
#   - a `gooby` command in ~/.local/bin,
#   - an app-menu entry with the Gooby icon.
#
#   bash install-linux.sh                    # latest release from GitHub
#   bash install-linux.sh --from Gooby.AppImage   # a file you already have
#   bash install-linux.sh --uninstall        # remove it (keeps your settings,
#                                            # models and history)
set -euo pipefail

# Installers are published to the public releases repo (the source is private).
REPO="gooby-app/releases"
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
APP_DIR="$DATA_HOME/gooby"
APPIMAGE="$APP_DIR/Gooby.AppImage"
BIN="$HOME/.local/bin/gooby"
DESKTOP="$DATA_HOME/applications/gooby.desktop"
ICON="$DATA_HOME/icons/hicolor/256x256/apps/gooby.png"

say() { printf '%s\n' "$*"; }
die() { printf 'Error: %s\n' "$*" >&2; exit 1; }

uninstall() {
  rm -f "$APPIMAGE" "$BIN" "$DESKTOP" "$ICON"
  rmdir "$APP_DIR" 2>/dev/null || true
  command -v update-desktop-database >/dev/null && update-desktop-database "$DATA_HOME/applications" 2>/dev/null || true
  say "Gooby removed. Your settings, models and history are kept in ~/.local/share/com.gooby.dictation."
}

download_latest() {
  local dest="$1" api url
  api="https://api.github.com/repos/$REPO/releases/latest"
  say "Finding the latest Gooby release..."
  local status
  status=$(curl -sL -o /dev/null -w '%{http_code}' "$api") || die "couldn't reach GitHub. Check your connection."
  case "$status" in
    200) ;;
    404) die "no Gooby release yet. If you have the AppImage, run: bash install-linux.sh --from <file>" ;;
    *) die "GitHub answered $status. Try again later, or use --from <file>." ;;
  esac
  url=$(curl -fsSL "$api" | grep -o '"browser_download_url": *"[^"]*\.AppImage"' | head -1 | cut -d'"' -f4)
  [ -n "$url" ] || die "the latest release has no AppImage. Download it yourself and use --from <file>."
  say "Downloading $(basename "$url")..."
  curl -fL --progress-bar -o "$dest" "$url" || die "download failed"
}

[ "$(uname -s)" = "Linux" ] || die "this installer is for Linux."
[ "$(uname -m)" = "x86_64" ] || die "Gooby's AppImage is built for x86_64 only (this is $(uname -m))."
[ "$(id -u)" -ne 0 ] || die "run this as your normal user, not with sudo: Gooby installs just for you."

case "${1:-}" in
  --uninstall) uninstall; exit 0 ;;
  --from) [ -f "${2:-}" ] || die "--from needs an AppImage file"; SOURCE="$2" ;;
  "") SOURCE="" ;;
  *) die "unknown option '$1' (use --from <file> or --uninstall)" ;;
esac

mkdir -p "$APP_DIR" "$(dirname "$BIN")" "$(dirname "$DESKTOP")" "$(dirname "$ICON")"

# Download or copy next to the final path, then swap in, so a failed download
# never breaks an existing install.
TMP="$APP_DIR/.Gooby.AppImage.new"
trap 'rm -f "$TMP"; rm -rf "$APP_DIR/.extract"' EXIT
if [ -n "$SOURCE" ]; then
  cp "$SOURCE" "$TMP"
else
  download_latest "$TMP"
fi
chmod +x "$TMP"
head -c 4 "$TMP" | grep -q "ELF" || die "that file isn't an AppImage."
mv -f "$TMP" "$APPIMAGE"

# AppImages mount themselves with FUSE 2, which recent Ubuntu releases don't
# install by default. Without it, extract-and-run mode works with no sudo
# (slightly slower to start).
EXTRA_ENV=""
if ! ldconfig -p 2>/dev/null | grep -q 'libfuse\.so\.2'; then
  EXTRA_ENV="APPIMAGE_EXTRACT_AND_RUN=1"
  say "Note: FUSE 2 isn't installed, so Gooby will use extract-and-run mode."
  say "      For faster startup: sudo apt install libfuse2t64   (Ubuntu 24.04+; libfuse2 on older)"
fi

# Icon from inside the AppImage.
rm -rf "$APP_DIR/.extract" && mkdir -p "$APP_DIR/.extract"
(cd "$APP_DIR/.extract" && "$APPIMAGE" --appimage-extract '*.png' >/dev/null 2>&1) || true
found_icon=$(find "$APP_DIR/.extract/squashfs-root" -maxdepth 1 -name '*.png' -print -quit 2>/dev/null || true)
[ -n "$found_icon" ] && cp "$found_icon" "$ICON"

cat > "$BIN" <<EOF
#!/bin/sh
exec env $EXTRA_ENV "$APPIMAGE" "\$@"
EOF
chmod +x "$BIN"

cat > "$DESKTOP" <<EOF
[Desktop Entry]
Type=Application
Name=Gooby
Comment=Private, on-device dictation
Exec=$BIN %U
Icon=gooby
Terminal=false
Categories=Utility;Accessibility;
Keywords=dictation;speech;transcription;voice;
StartupWMClass=gooby
EOF
command -v update-desktop-database >/dev/null && update-desktop-database "$DATA_HOME/applications" 2>/dev/null || true

say ""
say "Gooby is installed. Open it from your app menu, or run: gooby"
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) say "(~/.local/bin isn't on your PATH yet; log out and back in, or use the app menu.)" ;;
esac
say "Updates install from inside Gooby. To remove it: bash install-linux.sh --uninstall"
