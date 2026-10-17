# Gooby features

Gooby turns your voice into text in any app, entirely on your computer. It
runs on Linux, Windows and macOS.

![A real dictation: Gooby types a numbered list into an email](screenshots/demo.gif)

## Dictation

- **One-click setup**: the first screen shows the speech model and AI
  formatter that suit your computer and the microphone Gooby will use; one
  click downloads them and you're dictating as soon as speech is ready.
- **Finds your microphone**: if the system's default input can't hear a
  voice (a digital S/PDIF input, a loopback), Gooby switches to a real
  microphone, and says so when there isn't one. Your own choice always wins.
- **Press a shortcut, speak, and the text appears** where your cursor is.
  The default shortcut is Ctrl+Alt+Space; push-to-talk or press-to-toggle.
  If another app already holds the default, Gooby picks a free one
  (Ctrl+Alt+G) and tells you; a shortcut you chose is never changed. If the text
  can't be typed, it's copied to the clipboard instead.
- **Voice commands**: start with "Gooby," to change things by voice:
  "formatting off", "switch to French", "switch to the Acme project", "type
  that", "open the Library", or "…Gooby, cancel" at the end to throw a
  dictation away. Anything else is typed as said.
- **Local speech recognition** with a choice of Whisper, Parakeet, Moonshine,
  SenseVoice and other models, using your graphics card where it can.
- **Best for this computer**: each model is rated for your RAM and graphics
  memory (great, may be slow, too large), and Gooby recommends the most
  accurate one that runs well and speaks your language.
- **Custom words** for names and jargon the model keeps getting wrong.
- **AI formatting** (optional) tidies punctuation and lists with a local model
  built into Gooby. Cloud providers are blocked unless you allow them.
- **Recording overlay** shows when Gooby is listening, and says so when it
  didn't hear anything.
- **Copy when done** puts each dictation on the clipboard as well.
- **Save as files** (off by default) also writes each dictation as a `.txt`
  file to a folder you choose.

![What you say, and what Gooby types after AI formatting](screenshots/formatting.png)

## Library

Every dictation is kept in the Library, with its audio.

- **Projects, nested tags (`work/acme`) and favorites**, plus Unsorted and
  Recently Deleted (kept 30 days).
- **Drag and drop** recordings onto a project or tag, select several at once
  (Shift / Ctrl / ⌘), use right-click menus, and undo mistakes.
- **Notes to self**: "Gooby, note: …" (or "Note to self …") keeps a
  dictation in the Library without typing it, as does dictating while Gooby
  is in front with no text box selected. They're listed under Notes to self.
- **Say where it goes**: start with "For the Acme project: …" or end with
  "…put it in Acme" and it's filed there, with the command cut from the text.
- **List or calendar**: recordings grouped by day, with search across titles,
  transcripts and notes; the calendar marks the days you recorded.
- **Live transcript**: words highlight while the audio plays, click a word to
  jump there, fix mistakes in place, and "Teach Gooby" adds the corrected
  words to your custom words.
- **Notes** on each recording that save as you type.
- **Cleanup** (off by default; every recording is kept) can remove old
  recordings past a limit you set, but keeps notes and the ones you
  organized.

![The Library: projects, tags and a recording with its transcript](screenshots/library.png)

## Around the app

- **Themes**: light or dark (or follow the system), in six two-color
  palettes: 1-bit, Game Boy, Amber, Blueprint, Paper and Sakura.
- **Text size** from Small to Largest (Ctrl/Cmd + and −), scaling text,
  icons and spacing together, overlay included. It follows the system's text
  size setting (Windows Text size, GNOME Large Text) unless you turn that off.
- **Tray icon** with Open Gooby, update status and quit.
- **Updates**, off until you say yes: signed, installed in the background,
  applied on restart and never mid-recording.
- **Remembers the window** size and position.
- **Interface in many languages**, falling back to English for new text.
- **Command-line flags** for scripts and window managers:
  `--toggle-transcription`, `--toggle-post-process`, `--cancel`,
  `--start-hidden`, `--no-tray` and `--debug`.
- **Portable mode** on Windows keeps everything next to the app.

![The Library in six palettes](screenshots/palettes.png)

## Install

Installers are on [gooby-app/releases](https://github.com/gooby-app/releases/releases/latest).

- **Windows**: the `Gooby_x.y.z_x64-setup.exe` installer.
- **macOS**: the `.dmg` for Apple Silicon or Intel (until the builds are
  signed by Apple, allow the first launch in Privacy & Security).
- **Linux**: the one-command `install-linux.sh` (no sudo), the AppImage, or
  the `.deb`.

See [PRIVACY.md](PRIVACY.md) for what Gooby stores and what can touch the
network.
