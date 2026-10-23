# Gooby features

Gooby turns your voice into text in any app, entirely on your computer. It
runs on Linux, Windows and macOS.

![A real dictation: Gooby types a numbered list into an email](screenshots/demo.gif)

## Dictation

- **One-click setup**: the first screen asks which language you'll speak,
  shows the speech model and AI formatter that suit your computer and the
  microphone Gooby will use; one click downloads them and you're dictating
  as soon as speech is ready. For formatting it suggests Ollama (or links to
  it), or keeping it all inside Gooby. Optionally, your name and email
  become snippets and your country's common words are turned on.
- **Always ready**: Gooby loads its speech model and AI formatter when it
  starts and keeps them loaded, so even the first dictation of the day is
  quick, on a laptop without a graphics card too. Until they're loaded the
  window and tray say "Getting ready…", and a dictation is typed without AI
  formatting.
- **Press a shortcut, speak, and the text appears** where your cursor is.
  The default shortcut is Ctrl+Alt+Space; push-to-talk or press-to-toggle.
  If another app already holds the default, Gooby picks a free one
  (Ctrl+Alt+G) and tells you; a shortcut you chose is never changed. If the
  text can't be typed, it's copied to the clipboard instead.
- **Finds your microphone**: if the system's default input can't hear a
  voice (a digital S/PDIF input, a loopback), Gooby switches to a real
  microphone, and says so when there isn't one. Your own choice always wins.
- **Local speech recognition** with a choice of Whisper, Parakeet, Canary,
  Moonshine, SenseVoice and other models, using your graphics card where it
  can. Each model is rated for your computer (great, may be slow, too
  large), and Gooby recommends the most accurate one that runs well and
  speaks your language.
- **Recording overlay**: Gooby swims like a jellyfish while you talk, grows a
  thought bubble while it transcribes (counting the seconds if it takes a
  while) and hops with a sparkle when your words are typed. It looks puzzled
  and says so when it didn't hear anything, waves when a voice command
  worked and sheds a tear when typing failed. Minimal or Live
  (your words as you speak, with streaming models), at the top or bottom of
  the screen, or off.
- **Type what I say** (on by default): turn it off and dictations are only
  kept in your Library. **Copy when done** puts each one on the clipboard as
  well. **Save as files** (off by default) also writes each dictation as a
  `.txt` file to a folder you choose.

## Talk to Gooby

- **Voice commands**: start with "Gooby," to change things by voice:
  "formatting off", "sounds off", "stop typing", "use the email style",
  "switch to French", "switch to the Acme project", "type that", "open the
  Library", "what can I say?", or "…Gooby, cancel" at the end to throw a
  dictation away. Anything else is typed as said. The overlay (or a system
  notification, with the overlay off) says what changed.
- **Edit by voice**: select text anywhere and say "Gooby, make this
  shorter", "fix the grammar", "translate this into French" or "format this";
  Gooby rewrites the selection in place (Ctrl+Z or Cmd+Z undoes it). Needs
  an AI formatter.
- **Notes to self**: "Gooby, note: …" keeps a dictation in the Library
  without typing it (see Library below).
- **"Hey Gooby"** (off by default): start a dictation or a command by voice;
  it stops two seconds after you stop talking. Setup offers it, and Settings → General and the
  tray menu turn it on or off; the tray icon shows a blue dot while it
  listens. It runs on your computer and keeps nothing until it hears its
  name.
- **Snippets**: "Gooby, insert my signature" types saved text exactly.
- **Templates by voice**: "Gooby, SOAP note: …" formats one dictation with
  the AI formatting prompt of that name.

## Formatting

- **AI formatting** (optional) tidies punctuation, lists and paragraphs with
  a model on your computer: built into Gooby, or Ollama, or Apple
  Intelligence on Macs. Cloud providers are blocked unless you allow them.
- **Quick formatting**: whatever the AI doesn't format (short dictations,
  AI formatting off or still loading) is tidied by rules: no "um"s or
  stutters, spoken punctuation, numbers, money and times, lists, letters and
  "scratch that". Instant, and nothing to download. Settings → AI
  formatting → Tidy up without AI turns it off. Setup suggests the rules
  alone on light computers (under 8 GB of RAM, no graphics card).
- **Formatting that fits the app**: paragraphs in an email, casual in a
  chat, clear prompts for AI assistants, and your words as said in a
  terminal or code editor. Not on Wayland.

![What you say, and what Gooby types after AI formatting](screenshots/formatting.png)

## Your words

- **Names & words** (Settings → Words): names and jargon the model keeps
  getting wrong.
- **Common terms**: packs of acronyms (on by default) and of each country's
  institutions, places and slang (US, UK, Canada, Australia, New Zealand,
  Ireland, India, South Africa), plus Hindi and Tagalog words.
- **Words for each project** that apply while it's active.

## Library

Every dictation is kept in the Library, with its audio.

- **Projects, nested tags (`work/acme`) and favorites**, plus Unsorted and
  Recently Deleted (kept 30 days).
- **One tree, then what you said**: projects, tags and views in one column,
  the open one's recordings right under it (click it again to fold it); the
  rest of the window shows the selected recording, with play, copy, edit,
  add a note and star above it.
- **Drag and drop** recordings onto a project or tag, select several at once
  (Shift / Ctrl / ⌘), and undo mistakes. Right-click to rename, tag or move
  them (or double-click a title, or press F2, to rename).
- **Notes to self**: "Gooby, note: …" (or "Note to self …") keeps a
  dictation in the Library without typing it, as does dictating while Gooby
  is in front with no text box selected. With "Don't type when there's
  nowhere to type; keep a note instead" on (off by default; Linux and
  Windows), so does dictating while a button, a list or the desktop has
  focus. They're listed under Notes to self.
- **Say where it goes**: start with "For the Acme project: …" or end with
  "…put it in Acme" and it's filed there, with the command cut from the text.
- **Summaries**: after each recording, while Gooby is idle, the AI formatter
  gives it a title, a one- or two-sentence summary, its action items, and
  suggests tags and a project. A title you typed, your own tags and your
  project are never changed: suggested tags and projects wait for one click.
  "Summarize again" redoes one, and Settings → AI formatting → Summaries can
  summarize older recordings. On for formatters on your computer; with a
  cloud provider only if you turn it on. It never slows a dictation down.
- **List or calendar**: recordings grouped by day, with search across titles,
  transcripts, notes and summaries; the calendar marks the days you recorded.
- **Where it went**: each recording says which app it was typed into
  ("Typed into Slack"), or that it was kept as a note.
- **Live transcript**: words highlight while the audio plays (the play button
  above the text), click a word to jump there, fix mistakes in place, and "Teach Gooby" adds the corrected
  words to your custom words.
- **Notes** on a recording ("Add a note" above the text), saved as you
  type; the box shows only when there is a note.
- **Cleanup** (off by default; every recording is kept) can remove old
  recordings past a limit you set, but keeps notes and the ones you
  organized.

![The Library: projects, tags and a recording with its transcript](screenshots/library.png)

## Around the app

- **Performance** (Settings → Performance): this computer's memory and
  graphics, the speed settings together (GPU or CPU for the speech model and
  the built-in formatter, when there's a graphics card; the unload timeout;
  tidying without AI), and a speed test. Say a phrase (it stops when you do)
  and see a chart of how long loading, transcribing, AI formatting and the
  quick rules, saving and tagging took, starting from unloaded models, with
  a recommendation and one-click changes. With a graphics card, compare
  Auto, the CPU and each graphics chip on the same phrase, side by side,
  without changing your settings; the recommendation weighs speed first,
  then how busy the computer gets and memory, and keeps Auto when it already
  picks the best one. Gooby holds a lightning bolt on the overlay while it
  runs. Nothing is saved to your Library, typed or copied.

- **Themes**: light or dark (or follow the system), in six two-color
  palettes: 1-bit, Game Boy, Amber, Blueprint, Paper and Sakura.
- **Overlay looks**: Classic, Island, Soft or Pixel, picked with a live
  preview in Settings → Themes.
- **Text size** from Small to Largest (Ctrl/Cmd + and −), scaling text,
  icons and spacing together, overlay included. It follows the system's text
  size setting (Windows Text size, GNOME Large Text) unless you turn that off.
- **Tray icon** with Open Gooby, "Listen for “Hey Gooby”", update status and
  quit; it shows when Gooby is recording, transcribing or listening.
- **Updates**, off until you say yes: signed, installed in the background,
  applied on restart and never mid-recording.
- **Remembers the window** size and position.
- **Light in the background**: about 300 MB while idle, and a minute after
  you close the window it's unloaded to save about 100 MB more.
- **Interface in 26 languages** (English and 25 translations). Voice
  commands are recognized in English only for now.
- **Settings search and Help**: find any setting in a few keystrokes; Help
  covers getting started, every voice command and common problems.
- **Developer mode** (Settings → General → Advanced): a Logs button at the
  bottom of the window shows everything Gooby did since it started (GPU
  found, model loaded, what was heard, formatted and typed where), with Copy
  to share it. Turning it on after a problem still shows the problem.
- **Command-line flags** for scripts and window managers:
  `--toggle-transcription`, `--toggle-post-process`, `--cancel`,
  `--start-hidden`, `--no-tray` and `--debug`.
- **Portable mode** on Windows keeps everything next to the app.

![The Library in six palettes](screenshots/palettes.png)

## Install

Installers are on [gooby-app/releases](https://github.com/gooby-app/releases/releases/latest).

- **Windows**: the `Gooby_x.y.z_x64-setup.exe` installer.
- **macOS**: the `.dmg`, for Macs with Apple Silicon (allow the first launch
  in Privacy & Security).
- **Linux**: the one-command `install-linux.sh` (no sudo), the AppImage, or
  the `.deb`.

Gooby isn't signed yet, so Windows and macOS ask whether you trust it the first
time; [INSTALL.md](https://github.com/gooby-app/releases/blob/main/INSTALL.md)
shows what to click.

Updates install from inside Gooby, which keeps your settings, models and
recordings. On a Mac, Gooby offers to move itself into Applications if it was
opened from somewhere it can't update.

**Uninstall** the usual way for each system: Windows's Installed apps, Settings →
Storage → Move Gooby to Trash on a Mac, `install-linux.sh --uninstall` or
`apt remove` on Linux. Each asks (or tells you how) whether to keep your
recordings, settings and models; Settings → Storage → Remove all Gooby data
removes them on any system.

See [PRIVACY.md](PRIVACY.md) for what Gooby stores and what can touch the
network.
