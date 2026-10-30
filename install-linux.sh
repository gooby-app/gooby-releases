#!/usr/bin/env bash
# Installs Gooby for the current user, no sudo needed:
#   - the AppImage in ~/.local/share/gooby (a fixed path, so in-app updates
#     replace it in place),
#   - a `gooby` command in ~/.local/bin,
#   - an app-menu entry with the Gooby icon.
#
#   bash install-linux.sh                    # latest release from GitHub
#   bash install-linux.sh --from Gooby.AppImage   # a file you already have
#   bash install-linux.sh --uninstall        # remove it; asks whether to keep
#                                            # your recordings, settings and models
#   bash install-linux.sh --purge            # remove it and all of that, no question
set -euo pipefail

# Installers are published to the public releases repo (the source is private).
REPO="gooby-app/gooby-releases"
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
APP_DIR="$DATA_HOME/gooby"
APPIMAGE="$APP_DIR/Gooby.AppImage"
BIN="$HOME/.local/bin/gooby"
DESKTOP="$DATA_HOME/applications/gooby.desktop"
ICON="$DATA_HOME/icons/hicolor/256x256/apps/gooby.png"
AUTOSTART="${XDG_CONFIG_HOME:-$HOME/.config}/autostart/Gooby.desktop"
# What Gooby keeps (Tauri's folders for its identifier).
ID="com.gooby.dictation"
DATA_DIRS=("$DATA_HOME/$ID" "${XDG_CONFIG_HOME:-$HOME/.config}/$ID" "${XDG_CACHE_HOME:-$HOME/.cache}/$ID")

say() { printf '%s\n' "$*"; }
die() { printf 'Error: %s\n' "$*" >&2; exit 1; }

# $1: "purge" removes the data too; otherwise ask (when there's someone to ask).
uninstall() {
  if pgrep -x gooby >/dev/null 2>&1; then
    die "Gooby is running. Quit it first (tray icon → Quit), then run this again."
  fi
  local remove_data="no"
  if [ "${1:-}" = "purge" ]; then
    remove_data="yes"
  elif { : </dev/tty; } 2>/dev/null; then
    # Read from the terminal: with `curl … | bash`, stdin is this script.
    printf 'Also delete your recordings, notes, settings and downloaded models? This cannot be undone. [y/N] '
    local answer=""
    read -r answer </dev/tty || true
    case "$answer" in [yY]*) remove_data="yes" ;; esac
  fi
  local keys_cleared="no"
  if [ "$remove_data" = "yes" ] && [ -x "$APPIMAGE" ]; then
    # API keys Gooby put in the system keyring, while it's still here to do it.
    if "$BIN" --forget-keys 2>/dev/null || APPIMAGE_EXTRACT_AND_RUN=1 "$APPIMAGE" --forget-keys 2>/dev/null; then
      keys_cleared="yes"
    fi
  fi
  if [ "$remove_data" = "yes" ] && command -v secret-tool >/dev/null; then
    secret-tool clear service "$ID" 2>/dev/null || true
    keys_cleared="yes"
  fi
  # The 128 px icon is the one Gooby adds itself when it's started as a plain
  # AppImage (linux_desktop_entry.rs).
  rm -f "$APPIMAGE" "$BIN" "$DESKTOP" "$ICON" "$AUTOSTART" "$DATA_HOME/icons/hicolor/128x128/apps/gooby.png"
  rmdir "$APP_DIR" 2>/dev/null || true
  command -v update-desktop-database >/dev/null && update-desktop-database "$DATA_HOME/applications" 2>/dev/null || true
  if [ "$remove_data" = "yes" ]; then
    rm -rf "${DATA_DIRS[@]}"
    say "Gooby and everything it kept are removed."
    if [ "$keys_cleared" = "no" ]; then
      say "API keys you saved may still be in your keyring (Passwords and Keys, under $ID)."
    fi
  else
    say "Gooby removed. Your recordings, settings and models are kept in $DATA_HOME/$ID;"
    say "to remove them too: bash install-linux.sh --purge"
  fi
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
  --purge) uninstall purge; exit 0 ;;
  --from) [ -f "${2:-}" ] || die "--from needs an AppImage file"; SOURCE="$2" ;;
  "") SOURCE="" ;;
  *) die "unknown option '$1' (use --from <file>, --uninstall or --purge)" ;;
esac

# The AppImage is built on Ubuntu 24.04 and needs its glibc (2.38) or newer.
# Older systems get the .deb instead. Skipped if the version can't be read.
glibc=$(getconf GNU_LIBC_VERSION 2>/dev/null | awk '{print $2}') || glibc=""
if [ -n "$glibc" ]; then
  major=${glibc%%.*}; minor=${glibc#*.}; minor=${minor%%.*}
  if [ "$major" -lt 2 ] || { [ "$major" -eq 2 ] && [ "$minor" -lt 38 ]; }; then
    die "Gooby's AppImage needs glibc 2.38 or newer (Ubuntu 24.04, Debian 13, Fedora 39), and this system has $glibc. On Ubuntu 22.04 or Debian 12, install the .deb from https://github.com/gooby-app/gooby-releases/releases/latest instead."
  fi
fi

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

# The AppImage mounts itself with FUSE. Its runtime is built in (no libfuse2
# needed) but calls fusermount, which desktop systems have (fuse3). Without
# it, extract-and-run mode works with no sudo (slightly slower to start); Gooby
# keeps it for its start-at-login entry.
EXTRA_ENV=""
if ! command -v fusermount3 >/dev/null && ! command -v fusermount >/dev/null; then
  EXTRA_ENV="APPIMAGE_EXTRACT_AND_RUN=1"
  say "Note: FUSE isn't installed, so Gooby will use extract-and-run mode."
  say "      For faster startup: sudo apt install fuse3"
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
# Some desktops only see a new icon once the icon cache knows it.
command -v gtk-update-icon-cache >/dev/null && gtk-update-icon-cache -q -t "$DATA_HOME/icons/hicolor" 2>/dev/null || true

say ""
say "Gooby is installed. Open it from your app menu, or run: gooby"
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) say "(~/.local/bin isn't on your PATH yet; log out and back in, or use the app menu.)" ;;
esac
say "Updates install from inside Gooby. To remove it: bash install-linux.sh --uninstall"
