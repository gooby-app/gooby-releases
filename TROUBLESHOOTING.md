# Troubleshooting

Known issues, fixes and command-line flags for Gooby.

## Known Issues & Current Limitations

This project is actively being developed and has some [known issues](https://github.com/gooby-app/releases/issues). We believe in transparency about the current state:

### Bluetooth Headset Microphones (macOS)

Using a Bluetooth headset microphone on macOS may temporarily reduce playback quality or volume while recording because Bluetooth switches to bidirectional audio. Keep your headphones as the output device and select your Mac's built-in or an external microphone in Gooby to avoid this.

### fn and Globe Key Shortcuts (macOS)

Shortcuts that include the `fn` (Globe) key **only work on Apple keyboards** — your Mac's built-in keyboard or an Apple external keyboard. They will never trigger on a third-party keyboard, even while it is connected to the same Mac.

This is a hardware limitation rather than a Gooby bug. `fn` is not part of the standard USB HID keyboard specification: Apple reports it through a vendor-specific usage that macOS honors only from Apple devices, while third-party keyboards handle their `Fn` key entirely in firmware and send nothing to the computer. There is no event for Gooby to listen for.

If you switch between a MacBook keyboard and an external one, pick a shortcut built from standard modifiers (`ctrl`, `option`, `shift`, `command`) or a regular key instead.

### Linux Notes

**Typing into other apps:**

Gooby types and pastes without any extra tools on X11, and on GNOME and KDE
Wayland through the desktop's remote-desktop permission: the first time Gooby
types, your desktop asks once whether to allow it. On other Wayland compositors
(Sway, Hyprland and other wlroots-based ones) Gooby uses one of these, which
the `.deb` and `.rpm` packages pull in as recommended packages:

| Tool                 | Install                         | Notes                                           |
| -------------------- | ------------------------------- | ----------------------------------------------- |
| `wtype`              | `sudo apt install wtype`        | wlroots compositors                             |
| `wl-clipboard`       | `sudo apt install wl-clipboard` | clipboard on Wayland                            |
| `xdotool`            | `sudo apt install xdotool`      | X11 (optional; Gooby works without it)          |
| `dotool` / `ydotool` | see their docs                  | any session; need the `input` group or a daemon |

**Shortcuts on Wayland:**

Wayland doesn't let apps listen for keys. Where the desktop supports it (KDE
Plasma, GNOME 48 and later, Hyprland), Gooby registers its shortcuts with the
desktop, which asks you to confirm them once. On older desktops (such as GNOME
46 on Ubuntu 24.04), add a custom shortcut that runs `gooby --toggle-transcription`
(steps below); Settings shows the same hint.

**Other Notes:**

- **Runtime library dependency (`libgtk-layer-shell.so.0`)**:
  - Gooby links `gtk-layer-shell` on Linux. If startup fails with `error while loading shared libraries: libgtk-layer-shell.so.0`, install the runtime package for your distro:

    | Distro        | Package to install    | Example command                        |
    | ------------- | --------------------- | -------------------------------------- |
    | Ubuntu/Debian | `libgtk-layer-shell0` | `sudo apt install libgtk-layer-shell0` |
    | Fedora/RHEL   | `gtk-layer-shell`     | `sudo dnf install gtk-layer-shell`     |
    | Arch Linux    | `gtk-layer-shell`     | `sudo pacman -S gtk-layer-shell`       |

  - For building from source on Ubuntu/Debian, you may also need `libgtk-layer-shell-dev`.

- The recording overlay is disabled by default on Linux (`Overlay Position: None`) because certain compositors treat it as the active window. When the overlay is visible it can steal focus, which prevents Gooby from pasting back into the application that triggered transcription. If you enable the overlay anyway, be aware that clipboard-based pasting might fail or end up in the wrong window.
- Gooby disables the WebKit DMA-BUF renderer by default on Linux, but preserves explicit `WEBKIT_DISABLE_DMABUF_RENDERER` values. For rendering workarounds, see [Troubleshooting → Linux Startup Crashes or Instability](#linux-startup-crashes-or-instability).
- If Gooby fails to start reliably on Linux, see [Troubleshooting → Linux Startup Crashes or Instability](#linux-startup-crashes-or-instability).
- **Global keyboard shortcuts (Wayland, older desktops):** where the desktop has no shortcuts portal, set a system-level shortcut in your desktop environment or window manager. Use the [CLI flags](#command-line-flags) as the command for your custom shortcut.

  **GNOME:**
  1. Open **Settings > Keyboard > Keyboard Shortcuts > Custom Shortcuts**
  2. Click the **+** button to add a new shortcut
  3. Set the **Name** to `Toggle Gooby Transcription`
  4. Set the **Command** to `gooby --toggle-transcription`
  5. Click **Set Shortcut** and press your desired key combination (e.g., `Super+O`)

  **KDE Plasma:**
  1. Open **System Settings > Shortcuts > Custom Shortcuts**
  2. Click **Edit > New > Global Shortcut > Command/URL**
  3. Name it `Toggle Gooby Transcription`
  4. In the **Trigger** tab, set your desired key combination
  5. In the **Action** tab, set the command to `gooby --toggle-transcription`

  **Sway / i3:**

  Add to your config file (`~/.config/sway/config` or `~/.config/i3/config`):

  ```ini
  bindsym $mod+o exec gooby --toggle-transcription
  ```

  **Hyprland:**

  Add to your config file (`~/.config/hypr/hyprland.conf`):

  ```ini
  bind = $mainMod, O, exec, gooby --toggle-transcription
  ```

- You can also trigger Gooby externally via Unix signals or the CLI flags, which lets Wayland window managers or other hotkey daemons keep ownership of keybindings:

  | Action                                    | Trigger                                                  |
  | ----------------------------------------- | -------------------------------------------------------- |
  | Toggle transcription                      | `pkill -USR2 -n gooby` or `gooby --toggle-transcription` |
  | Toggle transcription with post-processing | `gooby --toggle-post-process`                            |

  Example Sway config:

  ```ini
  bindsym $mod+o exec pkill -USR2 -n gooby
  bindsym $mod+p exec gooby --toggle-post-process
  ```

  `pkill` here simply delivers the signal—it does not terminate the process.

  > **Behavior change:** older releases also accepted `SIGUSR1` for toggling transcription with post-processing. WebKitGTK — the webview engine embedded in Gooby on Linux — uses SIGUSR1 internally to coordinate JavaScript garbage collection, so listening for it caused phantom recordings and interrupted dictations every few minutes. Gooby no longer listens for SIGUSR1 on Linux; the post-processing toggle is still available via `gooby --toggle-post-process`. **Remove any `pkill -USR1` bindings**: the signal is now delivered straight to WebKit's internal handler and can crash the app.

**Overlay & Pasting Issues (Linux):**

- The recording overlay window can interfere with pasting transcribed text into target applications on Linux (X11)
- **Solution:** Open **Settings > Advanced** and set **"Overlay Position"** to **"None"** to disable the overlay
- Enable **"Audio Feedback"** (also in Advanced) if you still want audible confirmation of recording state
- Users who upgrade from older versions or import settings from other platforms may need to manually apply this change

## Troubleshooting

### Previous Clipboard Content Is Pasted Instead of the Transcription

If the transcription is correct in the **Library** but Gooby inserts text you copied earlier: with the standard clipboard paste method, Gooby restores your previous clipboard after a fixed delay. Under load, the receiving application may read the clipboard only after that restoration.

1. Open Gooby's settings window and press `Cmd+Shift+D` (macOS) or `Ctrl+Shift+D` (Windows/Linux) to reveal **Debug**.
2. On **macOS and Windows**, try **Reliable Paste (Beta)** in Debug with a clipboard paste method selected. It uses clipboard read notifications to delay restoration instead of relying on the standard fixed delay. Test it in the application where the problem occurs; it is still experimental.
3. If Reliable Paste is disabled or unavailable, increase **Paste Delay (After)** in Debug and test again. This controls the wait before restoring your previous clipboard. **Paste Delay (Before)** controls the wait before sending the paste keystroke and addresses a different part of the operation. These delay settings apply to the standard paste path, not Reliable Paste.

If the problem persists, [open an issue](https://github.com/gooby-app/releases/issues) with your Gooby version, operating system, receiving application, paste method, Reliable Paste setting, and before/after delays. Redact private dictated text before sharing logs.

### Shortcuts Stop Working on macOS (Secure Input)

macOS Secure Input stops other apps from seeing key presses while it is on, so
Gooby's shortcut can't fire. Password fields turn it on briefly, but some apps
leave it on: Terminal and iTerm2 with **Secure Keyboard Entry** enabled, password
managers, or a stuck login window. Gooby shows a warning while it stays on.

1. Close or leave any password field, and turn off **Secure Keyboard Entry** in
   your terminal's menu.
2. To find the app holding it, run
   `ioreg -l -w 0 | grep kCGSSessionSecureInputPID` and look up the process ID
   in Activity Monitor; quit that app.
3. If nothing obvious holds it, lock the screen and unlock it again, or log out
   and back in.

### Manual Model Installation (For Proxy Users or Network Restrictions)

If you're behind a proxy, firewall, or in a restricted network environment where Gooby cannot download models automatically, you can manually download and install them. The URLs are publicly accessible from any browser.

#### Step 1: Find Your App Data Directory

1. Open Gooby settings
2. Navigate to the **About** section
3. Copy the "App Data Directory" path shown there, or use the shortcuts:
   - **macOS**: `Cmd+Shift+D` to open debug menu
   - **Windows/Linux**: `Ctrl+Shift+D` to open debug menu

The typical paths are:

- **macOS**: `~/Library/Application Support/com.gooby.dictation/`
- **Windows**: `C:\Users\{username}\AppData\Roaming\com.gooby.dictation\`
- **Linux**: `~/.local/share/com.gooby.dictation/`

#### Step 2: Create Models Directory

Inside your app data directory, create a `models` folder if it doesn't already exist:

```bash
# macOS/Linux
mkdir -p ~/Library/Application\ Support/com.gooby.dictation/models

# Windows (PowerShell)
New-Item -ItemType Directory -Force -Path "$env:APPDATA\com.gooby.dictation\models"
```

#### Step 3: Download Model Files

Download the models you want from below

**Whisper Models (single .bin files):**

- Small (487 MB): `https://blob.handy.computer/ggml-small.bin`
- Medium (492 MB): `https://blob.handy.computer/whisper-medium-q4_1.bin`
- Turbo (1600 MB): `https://blob.handy.computer/ggml-large-v3-turbo.bin`
- Large (1100 MB): `https://blob.handy.computer/ggml-large-v3-q5_0.bin`

**Parakeet Unified EN 0.6B (single `.gguf` file, recommended):**

- Q8_0 (731 MB): `https://huggingface.co/handy-computer/parakeet-unified-en-0.6b-gguf/resolve/main/parakeet-unified-en-0.6b-Q8_0.gguf`

#### Step 4: Install Models

**For Whisper Models (.bin files):**

Simply place the `.bin` file directly into the `models` directory:

```
{app_data_dir}/models/
├── ggml-small.bin
├── whisper-medium-q4_1.bin
├── ggml-large-v3-turbo.bin
└── ggml-large-v3-q5_0.bin
```

**For GGUF Models (.gguf files):**

Place the `.gguf` file directly into the `models` directory, exactly like the Whisper `.bin` files above. Gooby also picks up models already present in the shared Hugging Face cache (`~/.cache/huggingface/hub`), so a copy downloaded by another tool works without being moved.

**Important Notes:**

- Do not rename the `.bin` or `.gguf` files—use the exact filenames from the download URLs
- After placing the files, restart Gooby to detect the new models

#### Step 5: Verify Installation

1. Restart Gooby
2. Open Settings → Models
3. Your manually installed models should now appear as "Downloaded"
4. Select the model you want to use and test transcription

### Custom Whisper Models

Gooby can auto-discover custom Whisper GGML models placed in the `models` directory. This is useful for users who want to use fine-tuned or community models not included in the default model list.

**How to use:**

1. Obtain a Whisper model in GGML `.bin` format (e.g., from [Hugging Face](https://huggingface.co/models?search=whisper%20ggml))
2. Place the `.bin` file in your `models` directory (see paths above)
3. Restart Gooby to discover the new model
4. The model will appear in the "Custom Models" section of the Models settings page

**Important:**

- Community models are user-provided and may not receive troubleshooting assistance
- The model must be a valid Whisper GGML format (`.bin` file)
- Model name is derived from the filename (e.g., `my-custom-model.bin` → "My Custom Model")

### Linux Startup Crashes or Instability

If Gooby fails to start reliably on Linux — for example, it crashes shortly after launch, never shows its window, or reports a Wayland protocol error — try the steps below in order.

**1. Install (or reinstall) `gtk-layer-shell`**

Gooby uses `gtk-layer-shell` for its recording overlay and links against it at runtime. A missing or broken installation is the most common cause of startup failures and can manifest as a crash or a hang well before any window is shown. Make sure the runtime package is installed for your distro:

| Distro        | Package to install    | Example command                        |
| ------------- | --------------------- | -------------------------------------- |
| Ubuntu/Debian | `libgtk-layer-shell0` | `sudo apt install libgtk-layer-shell0` |
| Fedora/RHEL   | `gtk-layer-shell`     | `sudo dnf install gtk-layer-shell`     |
| Arch Linux    | `gtk-layer-shell`     | `sudo pacman -S gtk-layer-shell`       |

If it is already installed and you still see startup problems, try reinstalling it (e.g. `sudo pacman -S gtk-layer-shell` again) in case the library files were corrupted by a partial upgrade.

**2. Disable the GTK layer shell overlay (`GOOBY_NO_GTK_LAYER_SHELL`)**

If installing the library does not help, you can skip `gtk-layer-shell` initialization entirely as a workaround. On some compositors (notably KDE Plasma under Wayland) it has been reported to interact poorly with the recording overlay. With this variable set, the overlay falls back to a regular always-on-top window:

```bash
GOOBY_NO_GTK_LAYER_SHELL=1 gooby
```

**3. Configure WebKit DMA-BUF rendering (`WEBKIT_DISABLE_DMABUF_RENDERER`)**

Gooby disables the WebKitGTK DMA-BUF renderer by default on Linux because it can cause blank windows or crashes on some GPU/driver combinations. Explicit environment-variable values are preserved, including in the Nix package. To explicitly keep the renderer disabled:

```bash
WEBKIT_DISABLE_DMABUF_RENDERER=1 gooby
```

Some users on WebKitGTK 2.54 report a flickering or partially drawn recording overlay with the renderer disabled. If affected, try opting out of the default workaround:

```bash
WEBKIT_DISABLE_DMABUF_RENDERER=0 gooby
```

This allows WebKit to use the renderer when supported, but can reintroduce the GPU/driver-specific crashes described above. Remove the override or use `=1` if that happens.

Fully quit Gooby, including its tray instance, before testing either value. Running a second instance with `--toggle-transcription` does not change the running process's environment.

**Making a workaround permanent**

Set the variable in the environment of the launcher that actually starts Gooby. Shell profile exports may not apply to desktop-menu or autostart launches. If you launch Gooby from a `.desktop` file, you can prefix the `Exec=` line, e.g.:

```ini
Exec=env GOOBY_NO_GTK_LAYER_SHELL=1 gooby
```

Gooby's built-in autostart rewrites its generated desktop entry, so editing that entry is not a durable workaround. For autostart, use an appropriate session/service environment, or disable Gooby's built-in autostart and manage your own startup entry with the required variable.

If a workaround helps you, please [open an issue](https://github.com/gooby-app/releases/issues) describing your distro, desktop environment, and session type — that information helps us narrow down the underlying bug.

### Empty recording overlay on Hyprland / Omarchy

If the recording overlay is empty or bordered, fully quit Gooby and launch a
native installation with Wayland enabled:

```bash
env -u GOOBY_NO_GTK_LAYER_SHELL GDK_BACKEND=wayland gooby
```

If this works, apply `GDK_BACKEND=wayland` only to Gooby's launcher.

### Vulkan Overlays and Capture Tools on Windows (`GOOBY_KEEP_VULKAN_IMPLICIT_LAYERS`)

On Windows, Gooby asks the Vulkan loader to skip implicit layers to avoid crashes caused by overlay and capture hooks. GPU acceleration remains enabled; this does not change system-wide settings.

To opt out for GPU selection or debugging tools, fully quit Gooby (including the tray icon), then run both commands in the same PowerShell window:

```powershell
$env:GOOBY_KEEP_VULKAN_IMPLICIT_LAYERS = "1"
& "$env:ProgramFiles\Gooby\gooby.exe"
```

Adjust the executable path if needed. This override only applies to apps launched from that PowerShell session, not the Start menu. Gooby also preserves any existing `VK_LOADER_LAYERS_DISABLE` value.

## Command-line flags

Gooby supports command-line flags for controlling a running instance and customizing startup behavior. These work on all platforms (macOS, Windows, Linux). Largely this is a beta feature.

**Remote control flags** (sent to an already-running instance via the single-instance plugin):

```bash
gooby --toggle-transcription    # Toggle recording on/off
gooby --toggle-post-process     # Toggle recording with post-processing on/off
gooby --cancel                  # Cancel the current operation
```

**Startup flags:**

```bash
gooby --start-hidden            # Start without showing the main window
gooby --no-tray                 # Start without the system tray icon
gooby --debug                   # Enable debug mode with verbose logging
gooby --help                    # Show all available flags
```

Flags can be combined for autostart scenarios:

```bash
gooby --start-hidden --no-tray
```

> **macOS tip:** When Gooby is installed as an app bundle, invoke the binary directly:
>
> ```bash
> /Applications/Gooby.app/Contents/MacOS/Gooby --toggle-transcription
> ```
