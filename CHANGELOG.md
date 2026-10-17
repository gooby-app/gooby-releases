# Changelog

What changed in each version of Gooby. It's in **pre-alpha** (0.0.x) until
the first alpha, 0.1.0, for friends and family.

## Coming in the next version

### Added
- When another app already holds the default dictation shortcut, Gooby
  picks a free one (Ctrl+Alt+G, then Ctrl+Alt+Shift+Space) and tells you,
  instead of a shortcut that does nothing. A shortcut you chose is never
  changed.
- **"Gooby, …" voice commands**: start a dictation with "Gooby," to change
  things without opening Settings: "Gooby, formatting off", "switch to
  French", "switch to the Acme project", "no project", "type that", "open the
  Library". "…Gooby, cancel" at the end throws a dictation away. Anything
  Gooby doesn't know is typed as you said it. The overlay says what changed,
  and Help lists every command.
- **Notes to self**: "Gooby, note: …" or "Note to self …" keeps a dictation
  in the Library without typing it anywhere, and so does dictating while
  Gooby's window is in front with no text box selected. Notes have their own
  place in the Library and are never removed by cleanup.
- When Gooby can't type into an app, the text is copied to the clipboard and
  the overlay says so.
- **One-click setup**: first run shows the speech model and AI formatter that
  suit your computer (the formatter up to the 2.4 GB tier; bigger ones stay
  in AI formatting) and which microphone Gooby will use. One click downloads
  both, and dictation works as soon as speech is ready.
- When the system's default input can't hear a voice (S/PDIF, monitor,
  loopback), Gooby switches to a real microphone and tells you. It never
  overrides a microphone you chose, including "Default".
- **Settings → Themes**: light or dark, six two-color palettes (1-bit, Game
  Boy, Amber, Blueprint, Paper, Sakura), and text size.
- **Text size** (Small to Largest, or Ctrl/Cmd +, −, 0) scales the whole
  window and the overlay, and follows the system text size on Windows and
  GNOME.
- About → Open-source licenses lists every third-party library in the app
  with its license text: the Rust crates, npm packages, ONNX Runtime and
  what's compiled into the built-in formatter.

### Changed
- Installers, updates, release notes and bug reports live in the public
  [gooby-app/releases](https://github.com/gooby-app/releases) repo; the
  source code is private. About → "Gooby on GitHub", the privacy policy and
  help links open it.
- Everything is bigger by default: 1.25× the old size, about the body text
  of native apps. "Small" keeps the old look.
- Confirmation dialogs name their action ("Empty Recently Deleted",
  "Cancel") instead of Yes / No.
- The built-in formatter's `llama-server` no longer embeds llama.cpp's web
  chat page, which Gooby never opened (3 MB smaller).

### Fixed
- Help no longer says Gooby's code is public.
- The Library's dropdowns (sort order, project) take the theme's colors
  instead of the system's gray box, on every platform.
- A fresh install no longer greets you with "What's new… Gooby has been
  updated".
- Clicking download twice (or reloading the window) no longer starts a
  second download of the same model that fights the first.

### Security
- Updated the OpenSSL bindings used for downloads (eight advisories) and
  other libraries with known bugs (serde_with, rand, anyhow, event-listener,
  memmap2).

## 0.0.6 - 2026-10-16

The cross-platform audit: every PR is now checked on Linux, Windows and macOS,
and a pass over typing, shortcuts, data handling and the UI on all three.

### Added
- **Linux Wayland**: Gooby types and pastes into native Wayland apps on GNOME
  and KDE without extra tools (your desktop asks once), and registers its
  shortcuts with desktops that support it (KDE Plasma, GNOME 48+, Hyprland).
  Elsewhere, Settings shows how to add a system shortcut.
- Gooby has its own version numbers, starting from 0.0.1, and a changelog
  section for each version.

### Changed
- The Library keeps every recording unless you set a limit. The old default
  kept only the last 5 unorganized ones and deleted the rest; installs still on
  that default switch to keeping everything.
- The recording overlay sits clear of the Windows taskbar and Linux panels
  wherever they are.
- The tray icon shows a red dot while recording and a ring while
  transcribing; the states were hard to tell apart, and identical on macOS.
 
- Text that was too faint to read (below the WCAG AA contrast ratio) is
  darker, in both themes.
- Setting names use one capitalization style, and the same feature has one
  name: "shortcut" rather than "hotkey", "AI formatting" rather than
  "post-processing".
- The calendar marks only the days that have recordings in the view you're
  looking at, and each Library view says why it's empty.
- The recording list gets more room in a small window.
- About links to the privacy policy.
- The macOS microphone prompt says what the microphone is for.
- The `.deb` and `.rpm` recommend `wl-clipboard`, `wtype` and `xdotool` as
  fallbacks and depend on `libvulkan1`.
- The Library loads faster with a long history (indexed by date), startup no
  longer reads every transcript, and cleaning up old recordings and emptying
  Recently Deleted are batched.
- **Spoken project command** also works at the start ("For the Acme project:
  …", "Put this in Acme, …") and as "…this is for Acme" or "…this goes in
  Acme" at the end. Just mentioning a project's name doesn't file anything.
 

### Fixed
- "Didn't hear anything" now also shows when the microphone records only
  silence (a muted or wrong input), and with the overlay off it comes as a
  system notification instead of nothing at all.
- A long recording title wraps in the Library's detail pane instead of being
  cut off when the pane is narrow.
- Linux: the Shift+Insert paste method typed a "V" instead of pasting.
- Linux: dictations with several lines were cut off after the first line when
  typed with `dotool`.
- Windows: opening the microphone privacy settings no longer flashes a
  console window, and a PC without Vulkan no longer shows a missing-DLL error
  when the built-in formatter starts.
- A saved dictation file is never overwritten by another with the same name.
 
- Notices that stay on screen (such as a taken shortcut) can be closed, and
  notices use the app's font.
- Emptying a large Recently Deleted no longer reloads the Library once per
  recording.
- The window no longer flashes white at launch, and if the interface ever
  crashes it shows a Reload button instead of a blank window.
- Saving a note while a dictation was being saved could fail with "database
  is locked"; the history database now waits its turn and lets reads continue.
 
- "…add it to the list" and similar sentences were taken as a spoken project
  command and filed the recording as unsorted instead of in your project. Only
  saying "project" or "folder" with an unknown name does that now.
- Editing a long transcript in the Library no longer cuts it at 100,000
  characters.
- A spoken project command now also saves the `.txt` in that project's
  folder, matching where the Library files it.
- Your edits to the built-in Gooby Format prompt are kept after a restart.
 
- A project could not be renamed to the same name in different capitals.
 
- A dictation counted as failed when cleaning up old recordings failed, even
  though it was saved.

### Security
- On Linux, dictated text is passed to typing tools through a pipe instead of
  the command line, where other users on the computer could read it.
- On Linux, Gooby's data folder (history, recordings, settings) is private to
  your account; it was readable by other users on some distributions.
- The app window can only use what it needs: it can no longer read the
  settings file or database, change shortcuts or autostart, or restart the app
  on its own; those go through Gooby's checked commands.
- Save folders must be full paths, and project lists are checked for blank or
  duplicate names.
- API keys for cloud AI providers are kept in the system's password store
  (Windows Credential Manager, macOS Keychain, Secret Service on Linux)
  instead of the settings file; keys saved earlier move there on first launch.
 
- Patched dependencies with known advisories (rustls, h2, tar and 48 in the
  frontend); a weekly audit flags new ones.

## 0.0.5 - 2026-10-16

Gooby's own look and its built-in AI formatter.

### Added
- **Built-in AI formatter**: formatting works with nothing else installed. A
  bundled engine runs on this computer only, and Settings offers four models
  (Gemma 3 1B to 12B, Qwen 2.5 1.5B), recommending the largest one your
  graphics card or memory runs well.
- **Settings search** (Ctrl/⌘+F) finds any setting by name, description or
  everyday words like "mic" or "dark mode", and jumps to it.
- **Help page**: getting started with your actual shortcut, what Gooby can do,
  fixes for common problems, and the keyboard shortcuts.
- **What's new**, shown once after an update, and the update banner lists
  what's in the download. The same version is never offered twice.
- Recordings are named after what was said ("Grocery list") instead of the
  date; untouched date titles are renamed once.
- A warning when the selected input can't hear a voice (a digital S/PDIF
  input, a monitor or loopback device).
- macOS installers for Apple Silicon and Intel Macs.
- Privacy policy, security policy, features list, contributing guide and this
  changelog.

### Changed
- **New look**: Gooby opens on the Library, and Settings sits behind a gear
  (Ctrl/⌘+,). Body text uses Departure Mono, a pixel font with real lowercase,
  on one crisp size; Silkscreen stays for headings. Controls, menus, toggles
  and motion follow one style.
- Settings pages are General, Models, AI formatting, About and Help; Advanced
  is a collapsed section at the end of General.
- New installs format with the built-in formatter instead of Ollama. Existing
  settings are left as they are.
- Gooby is licensed under FSL-1.1-MIT (source-available, each release becomes
  MIT after two years). About → Licenses lists every license that applies.
 
- The README is written for people installing Gooby.

### Fixed
- The word highlight keeps up with the audio while a recording plays, starting
  with the first play.

## 0.0.4 - 2026-10-15

The Library.

### Added
- **Library** replaces History: an explorer with projects, nested tags,
  favorites and Recently Deleted (kept 30 days); a list grouped by day with
  search and sorting; a calendar view; and a detail pane with an editable
  title, notes that save as you type, and the recording's audio.
- Drag and drop recordings onto projects and tags, select several at once
  (Shift / Ctrl / ⌘), right-click menus, keyboard shortcuts and Undo.
- **Spoken project command**: end a dictation with "…put it in the Acme
  project" to file it there; the command is cut from the text.
- **Live transcript**: words highlight as the audio plays, click a word to
  jump there, edit the text, and "Teach Gooby" adds corrected words to your
  custom words.
- **Best for this computer**: the model list rates each model for your RAM
  and graphics memory and recommends the most accurate one that runs well
  and speaks your language.
- One-command Linux install, no sudo: `bash install-linux.sh`.
- A "Didn't hear anything" message when a recording was silent.
- The window opens at 1200×800 and remembers its size and position.
- Installers for Windows and Linux are built by GitHub Actions, and every PR
  is checked.

### Changed
- Cleaning up old recordings keeps the ones you organized (starred, in a
  project, tagged or with notes).
- On Linux X11, the recording overlay is on by default for new installs.
- The Donate button is hidden until Gooby has its own donation link.

### Fixed
- Opening the Library no longer reloads the window the first time in a
  development build.

## 0.0.3 - 2026-10-15

Updates, projects and a readability pass.

### Added
- **Background updates**, off until you say yes: signed downloads, a tray
  item, and "Restart to Update" that never interrupts a recording.
- **Projects**: named folders for your dictations; new ones save into the
  project you pick.
- Copy when done: the whole dictation goes to the clipboard once the continue
  window closes.
- Also save audio: a `.wav` next to each saved `.txt`.

### Changed
- Pixel-art look with better readability: larger text, stronger contrast,
  consistent control sizes, keyboard focus outlines, and reduced motion when
  the system asks for it.
- Custom words are now "Names & words".
- Settings pages load on demand, so Gooby starts faster.

### Security
- A strict Content Security Policy, a narrower file-access scope, and history
  audio confined to the recordings folder.
- The AI formatting client no longer follows redirects, so API keys can't be
  forwarded to another host.

## 0.0.2 - 2026-10-15

Privacy defaults and Linux fixes.

### Added
- A notice when the recording shortcut is already taken by another app.
- A Linux development setup script.

### Changed
- AI formatting stays on this computer. Cloud providers (OpenAI, Anthropic,
  Groq and others) are blocked unless you turn on **Allow cloud AI
  providers**. The default formatter is a local Ollama model.
- Saving each dictation as a `.txt` file is now opt-in, and the default folder
  moved out of Documents, which is often cloud-synced.

### Fixed
- Ctrl+C no longer pastes your last dictation instead of what you copied.
- On Windows and Linux, closing the window with no tray icon now quits
  instead of leaving Gooby running with no way back.

## 0.0.1 - 2026-10-15

The first Gooby build.

### Added
- Gooby's name, icon, pixel-art mascot and pixel font.
- Dictation sessions: press the shortcut again within 3 seconds to keep
  adding to the same text; each session is saved as a `.txt` named by when you
  started and stopped, and the overlay's save pill copies it or saves it
  somewhere else.
- AI formatting with a local model that loads while you talk, so the first
  dictation isn't slow.
- Windows scripts to build the installer and run the checks (`build.bat`,
  `check.bat`).
