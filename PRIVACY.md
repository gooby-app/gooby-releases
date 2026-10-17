# Privacy

Gooby is built so that what you say stays on your computer. Speech
recognition runs locally, nothing is sent anywhere unless you turn it on, and
there is no account, telemetry or analytics.

## What connects to the internet

| What | When | What's sent |
|---|---|---|
| **Model downloads** | When you download a speech model (during setup or on the Models page) or a model for the built-in AI formatter | A normal download request to Hugging Face or Handy's model mirror (`blob.handy.computer`). It reveals your IP address and which model you picked. No audio or text. |
| **Update checks** | Only after you answer **yes** to "Check for updates automatically?" | A request for `latest.json` from Gooby's GitHub Releases, and the update file when you install one. It reveals your IP address and that you use Gooby. No audio or text. |
| **Cloud AI formatting** | Only if you turn on **Allow cloud AI providers** *and* pick a cloud provider | The text of each dictation (not the audio) goes to the provider you chose, under its own privacy policy. Off by default. |
| **Links you click** | When you click a link in the app | It opens in your browser. Gooby itself sends nothing. |

Nothing else talks to the network. The built-in AI formatter runs on your own
computer: Gooby starts it as a separate program that only listens on
`127.0.0.1`, with a key that changes every launch, so other programs can't use
it. Other formatters are limited to `localhost`-style addresses (such as
Ollama) and Apple Intelligence unless you opt in to cloud providers.

## What's stored on your computer

Everything is kept in Gooby's data folder:

| OS | Folder |
|---|---|
| Linux | `~/.local/share/com.gooby.dictation` |
| Windows | `%APPDATA%\com.gooby.dictation` |
| macOS | `~/Library/Application Support/com.gooby.dictation` |

- `history.db`: your dictations' text, titles, notes, tags and projects.
- `recordings/`: the audio of each dictation, kept up to the history limit
  you set in Settings. Recordings you starred, filed in a project, tagged or
  wrote notes on are kept.
- `models/`: downloaded speech models.
- `formatter-models/`: models for the built-in AI formatter.
- `settings_store.json`: your settings. API keys you enter for cloud providers
  are kept in your system's password store instead (Windows Credential
  Manager, macOS Keychain, or the Secret Service keyring on Linux); only where
  none is available, or in portable installs, are they kept in this file.
- `remote-desktop-token` (Linux on Wayland only): lets Gooby type into other
  apps without your desktop asking again. Revoke it in your desktop's privacy
  settings or delete the file.

Logs (what the app was doing, for troubleshooting) are kept in `logs/` in the
data folder on Linux, `%LOCALAPPDATA%\com.gooby.dictation\logs` on Windows,
and `~/Library/Logs/com.gooby.dictation` on macOS. They can include the text
of recent dictations, so read a log before you share it. Saved `.txt` files go to
`transcripts/` in the data folder (on Windows, in
`%LOCALAPPDATA%\com.gooby.dictation`) unless you pick another folder.

Portable installs keep all of this next to the app instead.

**Saved `.txt` files** are off by default. If you turn on saving dictations as
files, each one is also written to the folder you pick. Gooby warns you when
that folder looks cloud-synced (OneDrive, Dropbox, Google Drive, iCloud),
since the sync service would upload them.

These files are not encrypted. Anyone who can log in as you can read them;
other accounts on the computer can't (on Linux, Gooby makes its data folder
private to your account).
Uninstalling keeps them; delete the data folder to remove everything.

## Clipboard and typing

To put text into another app, Gooby either types it for you or pastes it
through the clipboard, depending on your paste setting. When pasting, it saves
what was on your clipboard, pastes, then puts the saved content back. That
saved copy stays in memory and is never stored or sent anywhere.

## Questions

Open an issue on [GitHub](https://github.com/gooby-app/releases/issues). To
report a security problem privately, see [SECURITY.md](SECURITY.md).
