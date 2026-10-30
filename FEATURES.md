# Gooby features

Gooby turns your voice into text in any app, entirely on your computer. It
runs on Linux, Windows and macOS.

![A real dictation: Gooby types a numbered list into an email](screenshots/demo.gif)

## Dictation

- **One-click setup**: the first screen asks which language you'll speak,
  shows the speech model that suits your computer and the microphone Gooby
  will use; one click downloads it and you're dictating as soon as it's
  ready. Gooby's own formatting (Inky) tidies your words from the first
  dictation, with nothing else to install or choose; AI models are in
  Settings → AI formatting, one click each. Optionally, your name and email
  become snippets and your country's common words are turned on. While the
  model downloads, a short tour shows what Gooby does (Help → Take the tour
  again), and the download's percent, size and speed show under it.
- **Always ready**: Gooby loads its speech model and AI formatter when it
  starts and keeps them loaded, so even the first dictation of the day is
  quick, on a laptop without a graphics card too. Until they're loaded the
  window and tray say "Getting ready…", and Inky formats dictations
  meanwhile.
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
  "formatting off", "what formatting are you using?", "sounds off", "stop
  typing", "use the email style",
  "switch to French", "switch to the Acme project", "type that", "open the
  Library", "what can I say?", or "…Gooby, cancel" at the end to throw a
  dictation away. "…Gooby, done" (or "stop", "that's it") ends a dictation
  and types it, and "…Gooby, send" also presses Enter. Anything else is
  typed as said.
- **The Library by voice**: "Gooby, delete the last note", "open my note
  about pricing", "rename that to Q3 plan", "move it to the Acme project",
  "star that", "bring back the last note", "undo", and any page or view
  ("open storage settings", "show me recently deleted", "search for
  pricing"). "That" is the recording open in Gooby's window; when it isn't
  clear which one you mean, Gooby asks instead of guessing, and a change
  shows with Undo. A delete only moves it to Recently Deleted.
- **Stops when you pause**: tap the shortcut to start and Gooby stops on its
  own once you've been quiet for 3 seconds (Settings → General → Stop after
  a pause: never, 2, 3, 5 or 10 seconds). Holding the shortcut is never cut
  short. If nothing is heard for 10 seconds, it stops and says so.
- **Shares the microphone**: Gooby opens it only while you dictate (and
  while "Hey Gooby" listens), and never takes it for itself. If another app
  does, Gooby says the microphone is busy. The overlay (or a system
  notification, with the overlay off) says what changed.
- **Edit by voice**: select text anywhere and say "Gooby, make this
  shorter", "fix the grammar", "translate this into French" or "format this";
  Gooby rewrites the selection in place (Ctrl+Z or Cmd+Z undoes it). Needs
  an AI formatter.
- **Notes to self**: "Gooby, note: …" keeps a dictation in the Library
  without typing it (see Library below).
- **Reminders**: "Gooby, remind me to call Mom tomorrow at 5" (or "set a
  reminder …", "schedule a meeting …", "add … to my calendar") or "remind
  me" anywhere in a dictation is added to the calendar at once (today,
  tomorrow, weekdays, "the 27th", "June 3rd", "in 20 minutes", "at 3",
  "noon"). The overlay says "Added: Call Mom" with the day and time; clicking
  it shows Undo, the note, and Google Calendar or Outlook when they're on. A
  plan said to Gooby ("I need to meet Dave on the 28th") only shows a small
  "Add reminder?" that opens the note. The dictation is typed or saved as
  usual either way. Reminders stay linked to their note: the note shows the
  reminder (Change, On your phone, Remove from calendar) and clicking it in
  the calendar opens the note; any recording can get one from its toolbar.
  A notification says when it's due while Gooby runs.
- **Your calendars** (Settings → Calendar): nothing leaves the computer
  until **Allow cloud calendars** is on (off by default); without it, a
  phone gets a reminder from its QR code. "On your phone" asks iPhone or
  Android and points to the quickest way. Connect iCloud (Apple ID and an
  app-specific password, in three steps; Gooby picks the calendar) or
  another CalDAV calendar, and reminders go there too, with their alert;
  editing or deleting one in the Library changes it there. Google Calendar
  and Outlook (Outlook.com or work and school) open with the reminder filled
  in, one click to save, no sign-in in Gooby; "your calendar app" opens a
  calendar file. A reminder's QR code (On your phone) adds it to a phone's
  calendar from its camera. Only connected, switched-on calendars are used.
  "Reminders by voice" can be turned off.
- **"Hey Gooby"** (off by default): start a dictation or a command by voice;
  it stops two seconds after you stop talking. Setup offers it, and Settings → General and the
  tray menu turn it on or off; the tray icon shows a blue dot while it
  listens. It runs on your computer and keeps nothing until it hears its
  name.
- **Snippets**: "Gooby, insert my signature" types saved text exactly.
- **Templates by voice**: "Gooby, SOAP note: …" formats one dictation with
  the AI formatting prompt of that name.

## Formatting

- **Two ways to format**, as two cards in Settings → AI formatting:
  Gooby's own (Inky) or an AI model. "Type exactly as said", in Advanced,
  turns formatting off; "Gooby, formatting off" and "on" switch it by voice,
  and "Gooby, AI formatting on" or "off" switches between the AI and Inky.
- **Gooby's own (Inky)**: Inky, Gooby's built-in formatting model, puts in
  punctuation, capitals and paragraphs and takes out "um"s and false starts,
  and rules write spoken punctuation, numbers, money and times, lists,
  letters and "scratch that". Instant (about 10–40 ms), on your computer,
  and nothing to download. It also formats whatever the AI doesn't: short
  dictations, and any while the AI isn't ready. Setup suggests it alone on
  light computers (under 8 GB of RAM, no graphics card).
- **AI formatting** (optional) rewords more, with a model on your computer:
  built into Gooby, or Ollama, or Apple Intelligence on Macs. Cloud
  providers are blocked unless you allow them. It formats dictations of 6
  words or more, starting from the rules' tidy version, which makes small
  models much better at it. Gooby starts Ollama when it's needed and closes
  it when you quit, so it doesn't have to start at login.
- **Who formats, right now**: Settings → AI formatting says whether Inky or
  the AI formats your dictations, and when the AI was picked but can't, why
  (not downloaded, still loading, Ollama not running, cloud AI not allowed,
  no API key), with a one-click fix where there is one. Ask "Gooby, what
  formatting are you using?" for the same on the overlay. When a dictation
  meant for the AI is formatted by Inky instead, the overlay says so and
  why, and the Library shows under each recording what formatted it.
- **Emails and messages**: start with "Email to Sam: …" or "WhatsApp message
  to Mom: …" (or "write an email saying …", "text to the team …"), and
  Gooby writes an email ("Hi Sam," at the top, "Best," and your name at the
  end) or a short message with no greeting. The AI puts `[Date]`, `[Place]`
  or `[Name]` where you didn't say one. A long dictation into an email app
  becomes an email too; a short one (a subject, a quick reply) doesn't, and
  neither does a request typed to an AI assistant ("write an email to Sam
  saying …" in ChatGPT is left for the AI) where Gooby can tell the app: on
  Windows and Linux X11, and on macOS in the ChatGPT and Claude apps (not a
  browser tab), never on Wayland.
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
  Recently Deleted (kept until you empty it).
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
  transcripts, notes and summaries; the calendar marks the days you recorded
  and the days with reminders. Pick a day for its reminders (tick them off,
  or right-click to edit or delete) above its recordings. A note's "Add to
  calendar" makes it a reminder later.
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

- **Command menu**: Ctrl+K (Cmd+K on a Mac) finds any Settings page or
  setting, the Library, and the common actions (formatting on or off,
  "Hey Gooby" on or off, check for updates, the tour), with their shortcuts.
  Alt+Left, Cmd+[ or the mouse's back button goes from Settings back to the
  Library, and Ctrl/Cmd+Z undoes a move or delete in the Library while its
  Undo bar shows.
- **Performance** (Settings → Performance): this computer's memory and
  graphics, the speed settings together (GPU or CPU for the speech model and
  the built-in formatter, when there's a graphics card; the unload timeout),
  and a speed test. Say a phrase (it stops when you do)
  and see a chart of how long loading, transcribing, AI formatting and
  Inky, saving and tagging took, starting from unloaded models, with
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
- **Text font**: Gooby's pixel font by default, drawn pixel-perfect (every
  pixel of a letter is a whole screen pixel, at 100% or 200%), so it's
  sharp; or your system's own font (Settings → Themes). Fractional scaling
  on Linux and the scaled "Looks like" modes on a Mac resample the window, so
  pixel text is softer there.
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

Installers are on [gooby-app/gooby-releases](https://github.com/gooby-app/gooby-releases/releases/latest).

- **Windows**: the `Gooby_x.y.z_x64-setup.exe` installer.
- **macOS**: the `.dmg`, for Macs with Apple Silicon (allow the first launch
  in Privacy & Security).
- **Linux**: the one-command `install-linux.sh` (no sudo), the AppImage, or
  the `.deb`.

Gooby isn't signed yet, so Windows and macOS ask whether you trust it the first
time; [INSTALL.md](https://github.com/gooby-app/gooby-releases/blob/main/INSTALL.md)
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
