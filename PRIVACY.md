# Gooby privacy policy

Effective 2026-10-24

Gooby is built so that what you say stays on your computer. Speech
recognition runs locally, nothing is sent anywhere unless you turn it on, and
there is no account, telemetry or analytics.

**Who we are.** Gooby is made by Itshak Chattopadhyay and Amogh Kaja ("we"), in
India. For anything about this policy or your data,
write to [hello@heygooby.com](mailto:hello@heygooby.com).

**In short:** we never receive what you dictate, your recordings, your
Library or your settings. They stay on your computer, where you control them.
The few things that can reach the internet are listed below, and the ones
that carry your text are off until you turn them on.

## What connects to the internet

| What | When | What's sent |
|---|---|---|
| **Model downloads** | When you download a speech model (during setup or on the Models page) or a model for the built-in AI formatter | A normal download request to Hugging Face or Handy's model mirror (`blob.handy.computer`). It reveals your IP address and which model you picked. No audio or text. |
| **Update checks** | Only after you answer **yes** to "Check for updates automatically?" | A request for `latest.json` from Gooby's releases on GitHub ([gooby-app/releases](https://github.com/gooby-app/releases)); when an update is found, its file is downloaded in the background right away, and installed when you restart. It reveals your IP address and that you use Gooby. No audio or text. |
| **Cloud AI formatting** | Only if you turn on **Allow cloud AI providers** *and* pick a cloud provider | The text of each dictation (not the audio) goes to the provider you chose, under its own privacy policy, with your Names & words list, the active project's words and the common terms you turned on, so names are spelled right. Off by default. An API key is never sent over plain `http://` to another computer. |
| **Cloud summaries** | Only if, on top of that, you turn on **Also with cloud providers** under AI formatting → Summaries | The text of every recording (not the audio), including notes and short dictations the formatter skips, plus the names of your projects, so it can write a title, summary, action items and suggested tags and project. Off by default. |
| **Links you click** | When you click a link in the app | It opens in your browser. Gooby itself sends nothing. |

Nothing else talks to the network. The built-in AI formatter runs on your own
computer: Gooby starts it as a separate program that only listens on
`127.0.0.1`, with a key that changes every launch, so other programs can't use
it. Other formatters are limited to `localhost`-style addresses (such as
Ollama) and Apple Intelligence unless you opt in to cloud providers. Requests
to these formatters on your computer never go through a proxy, even one set
with `HTTP_PROXY` or `ALL_PROXY`.

First-run setup offers Ollama, a separate free app, as an AI formatter. To see
whether it's installed, Gooby asks the Ollama app on your own computer
(`127.0.0.1:11434`); if you choose it, Gooby asks Ollama to download a model,
and Ollama does the downloading. Ollama's own "cloud" models would send your
text to Ollama's servers, so Gooby never offers them.

## What's stored on your computer

Everything is kept in Gooby's data folder:

| OS | Folder |
|---|---|
| Linux | `~/.local/share/com.gooby.dictation` |
| Windows | `%APPDATA%\com.gooby.dictation` |
| macOS | `~/Library/Application Support/com.gooby.dictation` |

- `history.db`: your dictations' text, titles, notes, tags and projects,
  the name of the app each was typed into ("Slack"), and the AI's summary,
  action items and suggested tags and project for each (Summaries, written
  by your AI formatter; on your computer unless you allowed a cloud
  provider for them).
- `history-before-update.db`: a copy of `history.db` made just before an
  update changes its layout, so nothing is lost if that goes wrong. Only the
  newest copy is kept; it's removed with everything else.
- `recordings/`: the audio of each dictation, as Opus files (`.opus`, about
  10 MB per hour of speech; recordings from older versions are converted from
  `.wav` in the background). Every recording is kept until
  you delete it, unless you turn on Auto-delete recordings (General →
  Advanced settings → Library); even then, notes to self and recordings you
  starred, filed in a project or tagged are kept.
- `models/`: speech models from Handy's mirror and ones you add yourself.
- `huggingface/`: speech models downloaded from Hugging Face. Earlier
  versions put them in Hugging Face's shared download cache
  (`~/.cache/huggingface/hub` on Linux and macOS,
  `%USERPROFILE%\.cache\huggingface\hub` on Windows, or under `HF_HOME` if
  you set it); Gooby moves its own models from there once. It still uses
  speech models other apps put in that cache, and deleting one in Gooby
  removes it from there.
- `formatter-models/`: models for the built-in AI formatter.
- `settings_store.json`: your settings. API keys you enter for cloud providers
  are kept in your system's password store instead (Windows Credential
  Manager, macOS Keychain, or the Secret Service keyring on Linux); only where
  none is available, or in portable installs, are they kept in this file.
  If you give your name and email at setup (optional), they're kept here as
  snippets, and nowhere else.
- `remote-desktop-token` (Linux on Wayland only): lets Gooby type into other
  apps without your desktop asking again. Revoke it in your desktop's privacy
  settings or delete the file.

Logs (what the app was doing, for troubleshooting) are kept in `logs/` in the
data folder on Linux, `%LOCALAPPDATA%\com.gooby.dictation\logs` on Windows,
and `~/Library/Logs/com.gooby.dictation` on macOS. They leave out what you
said. Developer mode's Logs panel also shows this session's dictations and
formatted text, kept in memory only and gone when Gooby quits, so read what
you copy from it before you share it. Saved `.txt` files go to
`transcripts/` in the data folder (on Windows, in
`%LOCALAPPDATA%\com.gooby.dictation`) unless you pick another folder.

The window's size and position are kept in Gooby's config folder
(`~/.config/com.gooby.dictation` on Linux), and the window's own web storage
in its cache folder (`~/.cache/com.gooby.dictation` on Linux, `EBWebView` in
`%LOCALAPPDATA%\com.gooby.dictation` on Windows, `~/Library/WebKit` and
`~/Library/Caches` on macOS). Removing everything deletes these too.

Portable installs keep all of this next to the app instead.

**Saved `.txt` files** are off by default. If you turn on saving dictations as
files, each one is also written to the folder you pick. Gooby warns you when
that folder looks cloud-synced (OneDrive, Dropbox, Google Drive, iCloud),
since the sync service would upload them.

These files are not encrypted. Anyone who can log in as you can read them;
other accounts on the computer can't (on Linux, Gooby makes its data folder
private to your account).
Uninstalling keeps them unless you choose otherwise: tick "Also delete my
recordings, settings and downloaded models" in the Windows uninstaller; on
macOS, Settings → Storage → Move Gooby to Trash asks; on Linux,
`install-linux.sh --uninstall` asks (`--purge` doesn't). Removing the `.deb`
package (`apt remove` or `purge`) never touches your home folder: use
Settings → Storage → Remove all Gooby data first. Removing everything
deletes Gooby's folders, the API keys in your system's password store and
the start-at-login entry; on macOS also what macOS keeps for the app in
`~/Library` (web view storage, cookies, preferences, window state) and its
Microphone and Accessibility permissions. Keeping your data keeps the API
keys and, on macOS, those permissions too. On Linux, start at login is
`~/.config/autostart/Gooby.desktop`; once Gooby is gone it does nothing.
Settings → Storage removes old audio, unused models, logs and caches, or
everything Gooby keeps, in one step.

Gooby also tidies up by itself each time it starts: downloads left
half-finished for a day, audio no Library entry uses, the installer a Windows
update leaves in the temp folder (`%TEMP%\Gooby-<version>-updater-…`, after a
day), and a speed test's temporary folder left by a crash. When you switch to
another speech or formatter model, it asks whether to delete the old one; it
never deletes a model on its own.

## "Hey Gooby"

Off by default. Setup offers it unticked, and Settings → General and the
tray menu ("Listen for “Hey Gooby”") turn it on or off. While it's on, Gooby
keeps your microphone open so it can hear "Hey Gooby", and its tray icon
shows a blue dot. The audio goes through a small
model on your computer, and only the last 1.44 seconds are ever held, in
memory; nothing is written to disk or sent anywhere. When it hears "Hey
Gooby", a normal dictation starts and is kept in your Library like any other.
Your system may show that the microphone is in use for as long as it's on.

## Clipboard and typing

To put text into another app, Gooby either types it for you or pastes it
through the clipboard, depending on your paste setting. When pasting, it saves
what was on your clipboard, pastes, then puts the saved content back. That
saved copy stays in memory and is never stored or sent anywhere.

To edit selected text by voice ("Gooby, make this shorter"), Gooby copies the
selection through the clipboard, sends it with your instruction to your AI
formatter (on your computer unless you chose a cloud provider), pastes the
result over it, and puts your clipboard back as it was. Nothing of it is kept.

Just before typing, Gooby asks your system which app is in front, so AI
formatting can fit it (an email, a chat, a terminal) and the Library can show
where each dictation went. Only the app's name is kept, in `history.db`. In a
browser, Gooby also reads the window title to tell a site like Gmail from
others; the title is never stored, logged or sent. If you use a cloud
formatting provider, it's told only the kind of app ("an email"), along with
the text it formats. On Wayland, Gooby can't ask, and formats as usual.

With "Don't type when there's nowhere to type; keep a note instead" on (off
by default),
Gooby also asks your system's accessibility service (AT-SPI on Linux, UI
Automation on Windows) what kind of element has focus, such as a text box or a
button, just before typing. It doesn't read the element's text, and nothing
of the answer is kept.

## The speed test

Settings → Performance records a phrase you say, times each step of a
dictation on it, and shows the result. The recording stays in memory (so the
test can be run again on the same words) until you leave the page or quit
Gooby, and nothing is typed or copied. To time saving, the test writes the
audio and a Library entry to a temporary folder of its own, which it deletes
straight away (only your account can read it, and one left by a crash is
removed the next time Gooby starts); your Library never sees them. To time tagging, it sends the
phrase to your AI provider as a summary request would be, and throws the
answer away: only if summaries are on, and for a cloud provider only if you
allowed summaries with one. If your AI formatter is a cloud provider, the
test phrase is sent to it as a dictation would be, only while AI formatting
is on. With formatting off, the test still times a formatter on this
computer (Gooby's own or Ollama), so it can show what turning it on would
cost, but never a cloud one. If it's Ollama, the test unloads the model,
loads it again and puts it back as it was found.

## The website

heygooby.com has no cookies, analytics or trackers, and loads nothing from
other companies. It's served by Cloudflare, which handles your IP address and
browser details to deliver the page and protect it from attacks, under
[Cloudflare's privacy policy](https://www.cloudflare.com/privacypolicy/). We
don't keep those logs. Downloads and this policy come from GitHub, under
[GitHub's privacy statement](https://docs.github.com/site-policy/privacy-policies/github-general-privacy-statement).

## Other services you choose

When you use something outside Gooby through it (a cloud AI provider you
picked, Ollama, Hugging Face for model downloads, GitHub for updates, our
Discord server), that service handles what it receives under its own privacy
policy, not this one.

## Your rights

Wherever you live, you have the rights that India's Digital Personal Data
Protection Act, 2023 and the EU's GDPR give: to know what personal data is
held about you, to get a copy, to correct it, to have it deleted, to object
to its use, to withdraw consent, and to complain.

Because Gooby keeps your data on your computer and we never receive it, you
exercise most of these yourself, at any time:

- **See and copy it:** everything is in the folders listed above, in
  ordinary files (the Library is an SQLite database, recordings are Opus
  audio). Settings → About shows the data folder.
- **Correct it:** edit or rename any recording in the Library.
- **Delete it:** delete recordings in the Library, or Settings → Storage →
  Remove all Gooby data, which also removes the API keys from your system's
  password store.
- **Withdraw consent:** turn off update checks, cloud AI providers or cloud
  summaries in Settings; nothing more is sent from then on.

What you sent to a cloud AI provider is held by that provider; ask them. If
you write to us (email, GitHub issues, Discord), we keep the message only as
long as we need it to answer, and you can ask us to delete it. For any
request or complaint, write to
[hello@heygooby.com](mailto:hello@heygooby.com); we answer within 30 days.
You may also complain to your data protection authority (in India, the Data
Protection Board of India).

## Children

Gooby isn't made for children under 13, and we don't knowingly receive
anyone's personal data, children's included.

## Changes to this policy

If this policy changes, the new version is published with the release that
needs it, with a new effective date, and listed in the release notes. If a
change ever means something new leaves your computer, Gooby asks you first.

## Questions

Write to [hello@heygooby.com](mailto:hello@heygooby.com), or open an issue on
[GitHub](https://github.com/gooby-app/releases/issues). To report a security
problem privately, see [SECURITY.md](SECURITY.md).

---

© 2026 Itshak Chattopadhyay and Amogh Kaja. All rights reserved. Gooby is free to use during the alpha and beta under its end-user
license ([LICENSE.md](LICENSE.md)).
