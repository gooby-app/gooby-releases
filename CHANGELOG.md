# Changelog

What changed in each version of Gooby. 0.0.7 is the first alpha; earlier
versions were pre-alpha, for the developers only.

## Coming in the next version

## 0.0.8 - 2026-10-30

Reminders and your own calendars by voice, the Library by voice, emails and
messages written as such, Gooby's own formatting (Inky) from the first
dictation with a one-click setup, and Gooby's pixel font, sharp again. It's
also the first update from one alpha to the next: check that it updates
cleanly and keeps your recordings and settings.

### Added

- **The Library by voice**: say "Gooby, delete the last note", "open my note
  about pricing", "rename that to Q3 plan", "move it to Acme", "star that",
  "bring it back" or "undo", or go anywhere with "open storage settings" or
  "show me recently deleted". Gooby never guesses which recording you mean:
  "that" is the one open in Gooby, and when it isn't clear, it asks. Each
  change shows with Undo, and deleted ones go to Recently Deleted.
- **Command menu**: Ctrl+K (Cmd+K on a Mac) goes to any page or setting and
  does the common things (AI formatting on or off, "Hey Gooby" on or off,
  check for updates, the tour), with each one's shortcut shown.
- **Undo and Back from the keyboard**: Ctrl/Cmd+Z undoes a move or delete in
  the Library while the Undo bar shows; Alt+Left, Cmd+[ or the mouse's back
  button goes from Settings back to the Library.
- **Emails and messages by voice**: start a dictation with "Email to Sam: …"
  or "WhatsApp message to Mom: …" and Gooby writes it as one: an email gets
  "Hi Sam," and "Best," with your name (or `[Name]` and `[Your name]`), a
  message stays short with no greeting. With AI formatting, what you didn't
  name becomes a placeholder like `[Date]` or `[Place]`. Works with the quick
  rules too. A long dictation into an email app is written as an email.
- **Who formats your text, at a glance**: Settings → AI formatting starts
  with what's formatting your dictations right now (Inky, or your AI model
  for dictations of 6 words or more), and when the AI was picked but can't,
  why: the model isn't downloaded yet, it's still loading, Ollama isn't
  running, cloud AI isn't allowed, or a key is missing, with a button where
  one click fixes it.
- **Two ways to format**: pick Gooby's own (Inky: fast, private, nothing to
  set up) or an AI model (smarter rewording), as two cards. The AI's
  settings show only when it's picked. "Type exactly as said", in Advanced,
  turns formatting off altogether.
- **"Gooby, what formatting are you using?"**: ask, and the overlay says who
  formats your dictations right now. "Is the AI working?", "which model
  formats my text?" and the like work too.
- **"Formatted by …" in the Library**: under each new recording's text,
  which formatted it: your AI model, Inky, the rules, or nobody ("Typed as
  said"). Transcribing it again updates it.
- **Donate**: Settings → About has a Donate button, which goes to
  Gooby's own donation page (heygooby.com/donate), which offers Buy Me a
  Coffee and Razorpay. Gooby stays free, with no
  ads, account or tracking.
- **Stop after a pause**: a dictation you start with a tap stops by itself
  once you've been quiet for 3 seconds (Settings → General: never, 2, 3, 5
  or 10 seconds), as if you'd tapped again; with nothing heard for 10 seconds,
  it stops and says so. Holding the shortcut is never cut short.
- **"Gooby, done" and "Gooby, send"** at the end of a dictation finish it;
  "send" also presses Enter, for a chat or a search box.
- **"The microphone is busy"**: when another app has the microphone to
  itself, Gooby says so on the overlay instead of failing quietly.
- **Reminders by voice**: say "Gooby, remind me to call Mom tomorrow at 5"
  (or "set a reminder …", "schedule a meeting …", "add the dentist on
  Friday at 3 to my calendar"), or "remind me" anywhere in a dictation
  ("The 28th at 5 p.m. Please remind me to clean the drawers"), and it goes
  straight onto your calendar. Gooby says "Added: Call Mom" with the day and
  time it understood; click it for Undo, the note, or Google Calendar and
  Outlook if you use them. A plan said to Gooby without asking ("Hey Gooby,
  I need to meet Dave on the 28th") only gets a small "Add reminder?", which
  opens the note to add it. Dictations are typed or saved as usual either
  way. A reminder stays linked to its note: the note shows it (change the
  day, or take it off the calendar), and clicking it in the Library's
  calendar opens the note. The calendar marks the days with reminders and
  lists them above that day's recordings, where you can tick them off, edit
  or delete them. While Gooby is running, a notification tells you when one
  is due.
- **Your own calendars** (Settings → Calendar), behind **Allow cloud
  calendars**, off by default: until you turn it on, no reminder leaves your
  computer. Say which phone you have and Gooby shows the quickest way. iPhone: connect iCloud in three steps (an
  app-specific password, then Connect, which picks your calendar), and
  reminders show in Calendar on your iPhone, iPad and Mac, with their alert;
  edits and deletes in the Library follow. Android: Google Calendar opens
  with the reminder filled in for you to save, with no sign-in in Gooby.
  Another CalDAV calendar (Fastmail, Nextcloud…) works like iCloud, and
  "your calendar app" opens a calendar file. Only calendars you connect and
  switch on are used. "Reminders by voice" turns the whole thing off, and
  Gooby's own copy can be switched off while another calendar is on.
- **On your phone**: any reminder in the Library shows a QR code; point your
  phone's camera or a QR app at it to add it to the phone's calendar, no
  account needed; Gooby sends nothing.
- **A quick tour** while setup downloads the models: five cards on the
  shortcut, tidying up, voice commands, the Library and privacy, with Next,
  Back and Skip. Help → Take the tour again shows it any time.

### Changed
- **Simpler setup**: the first screen no longer asks you to pick an AI
  formatter or install Ollama. Gooby's own formatting (Inky) tidies your
  words from the first dictation; AI models are one click each in Settings →
  AI formatting, and Ollama works there if you already have it.
- **Easier to read**: Gooby's pixel font is drawn pixel-perfect, every pixel
  of a letter a whole screen pixel (100% at Small and Default text size, 200%
  at Large and up), so it's sharp, and gray hints and labels are darker.
  Prefer your system's font? Settings → Themes → Text font.
- **Recently Deleted keeps recordings until you empty it**, instead of
  deleting them for good after 30 days.
- **"Gooby, delete that"** on its own deletes the recording open in Gooby
  (with Undo); after other words it still throws the dictation away.
- **"Gooby, formatting off" types your words exactly as said**, and
  "formatting on" brings Gooby's own formatting (Inky) back. "Gooby, AI
  formatting on" or "off" switches between your AI model and Inky. The
  command menu's formatting switch does the same as "formatting off" and
  "on".
- **When the AI isn't ready, Gooby says who formatted instead**: "Formatted
  by Inky (AI not ready)" or "(no AI model loaded)" on the overlay, with the
  reason; click it to open AI formatting. A reason that lasts, like no
  model, is said once per session. "Gooby, make this shorter" and other
  edits say why too, instead of only "Couldn't edit it".
- **Setup's "Quick rules only" is now "Gooby's own (Inky)"**, as in Settings
  and the speed test.
- **Help us count Gooby users**: a one-time question, and a switch in
  Settings → About, asks whether Gooby may tell us, once a day, its
  version, your system, the month you installed it, and whether it's the
  first time this week, this month or ever. It's off until you say yes,
  there's no ID, and your IP address isn't kept. Downloads from the website
  are counted once per person and day, without bots. The privacy policy has
  the details.
- **Cleaner text without the AI**: when Gooby formats without the AI (AI
  formatting off, a short dictation, or the AI still loading), Inky,
  Gooby's built-in formatting model, now puts in the commas, full stops,
  question marks, capitals and paragraphs, and takes out the "um"s and false
  starts, before the quick rules write numbers, addresses and lists. It runs
  on your computer in about 10–40 ms and needs no download.
  With a speech model that doesn't punctuate, sentences now come out
  punctuated.
- **Snappier Library and menus**: a submenu (Move to, Tags) stays open while
  you move the pointer to it across other rows; the star turns on the moment
  you click it; the Library shows placeholder rows instead of "Nothing here
  yet" while it loads, and what you saw last when you come back from
  Settings; pages show their outline while they load; going between the
  Library and Settings crossfades; shortcut keys show in menus and tooltips.
- **Better AI formatting with small models**: the AI now starts from the
  quick rules' tidy version of what you said, so it gets "um"s, repeats and
  "I mean" corrections right far more often (on Gooby's formatting tests,
  Qwen 2.5 1.5B went from 69% to 87% and Gemma 3 4B from 81% to 90%).
- **"Gooby, stop" finishes a dictation** instead of throwing it away:
  people say it when they're done. "Gooby, cancel", "never mind" and
  "scratch that" still throw it away.
- **Setup shows how the download is going**: the percent, how many MB of how
  many and the speed, then "Checking the download…" and "Loading the speech
  model…", so it never looks stuck. If AI formatting is still downloading
  after setup, the "Getting ready" panel shows its progress too, and a long
  load shows how many seconds it has taken.
- **The first run gets ready faster**: the AI formatter now waits for the
  speech model before it loads, as on every later start, instead of both
  fighting over the computer. With Ollama as the formatter, Gooby loads its
  model and reads its instructions at start, so the first dictation doesn't
  wait for it.
- **Ollama starts and stops with Gooby**: when AI formatting uses Ollama and
  it isn't running, Gooby starts it, and closes it again when you quit
  (closing the window to the tray keeps it). Ollama no longer needs to start
  at login and use memory while Gooby isn't running. An Ollama you started
  yourself is left running.
- **The Performance tab is easier to read**: the steps of a dictation sit in
  two columns where there's room and one at large text sizes, names aren't
  cut off or written in capitals, and the comparison table wraps instead of
  scrolling sideways.
- **"Hey Gooby"** wakes for far more voices: its model is now trained on real
  people saying it, not only computer voices, and it stays quiet on "Hey
  Google" and "OK Google". It still misses some voices and can wake on similar
  phrases, so it's still experimental and off unless you turn it on.

### Fixed

- **Large Text on Linux** (GNOME's, or a bigger font DPI) is no longer
  applied twice, so Gooby's window and overlay are the size you set.
- **"Hey Gooby" after the microphone drops**: if the microphone was
  unplugged or taken by another app while Gooby listened, "Hey Gooby"
  stayed deaf until the next shortcut dictation. It now reopens the
  microphone by itself.
- **Dates are written as numbers**: "the twenty seventh" is typed as "the
  27th" (it came out as "20 seventh"), and "twenty-first" as "21st". "A twenty
  second clip" stays twenty seconds.
- **Gooby's icon on Linux**: a downloaded AppImage started as is had no app
  menu entry, so the dock showed a gear instead of Gooby. Gooby now adds its
  own entry and icon the first time (unless one is installed already), and
  its window icon is sharp on X11.

### Known issues

- **Windows with Ollama**: when Gooby started Ollama for you, quitting Gooby
  leaves Ollama's model in memory until you quit Ollama or restart.
- **Pixel font on scaled screens**: with fractional display scaling on Linux,
  or a Mac set to a scaled resolution, the pixel font looks a little soft.
  Settings → Themes → Text font → System is sharp everywhere.

## 0.0.7 - 2026-10-23

Phase 1, the streamlined core: talk to Gooby, notes to self, editing by
voice, "Hey Gooby", formatting that fits the app, and a setup that takes one
click. And the start of phase 2: summaries for every recording.

### Added

- **License and privacy policy**: Gooby now comes with an end-user license
  (free for any purpose during the alpha and beta) and a privacy policy that
  says who makes Gooby, how to reach us and what your rights are. Settings →
  About links to both.
- **Gooby's moods in the main window**: while you're not dictating, Gooby
  waves or perks up once in a while, dozes off after two minutes without
  input and perks up when you're back. The Library shows him thinking beside
  a summary being written and sad beside one that failed, and in setup he
  swims while the models download. He still holds still while Gooby is in
  the background, and with reduced motion on.
- **Performance tab**: Settings → Performance shows your computer's memory
  and graphics and gathers the speed settings in one place. The speed test
  listens for a phrase and stops by itself when you stop talking. It then
  starts from unloaded models, so the time to load them shows, and times
  transcribing, AI formatting and the quick rules side by side (the AI too
  when formatting is off, if one is set up on this computer), the checks
  before typing, saving and the background tagging. A chart shows where the
  time went, in plain words ("from when you stop talking to your text
  appearing"), with how busy the computer got and which device ran it.
  "Compare with the other options" tries Auto, the CPU and each graphics
  chip Auto didn't pick (integrated graphics too), on the same phrase and
  the same settings, without changing them. The recommendation picks the
  fastest, and when waits are close, the one that keeps the computer less
  busy and uses less memory. It keeps Auto when Auto already lands on the
  best device, and offers a button only when it would change a setting. With
  AI formatting off it suggests turning it on, or setting it up. On a
  computer without a graphics card there's nothing to compare, and the GPU
  options stay hidden. Nothing is saved to your Library, typed or copied.
- **GPU or CPU for the AI formatter**: choose where the built-in formatter
  runs its model (Automatic, CPU or GPU) when the computer has a graphics
  card.
- **Uninstall on a Mac**: Settings → Storage → Move Gooby to Trash removes
  Gooby, and asks whether your recordings, settings and models go too.
- **Gooby moves itself to Applications**: opened from the disk image or
  Downloads on a Mac, where it can't update itself, Gooby offers to move
  there and opens again.
- **Always ready on laptops without a graphics card**: Gooby loads its
  speech model and AI formatter when it starts, one after the other, and
  keeps them loaded, so the first dictation of the day is as quick as any
  other. While they load, the window and the tray say "Getting ready…";
  a dictation made meanwhile is typed straight away without AI formatting,
  and the overlay says why.
- **Gooby has feelings**: he swims like a jellyfish (harder while you talk),
  perks up when the mic is ready, grows a thought bubble while he works,
  sparkles when your words are typed, waves when a command worked, looks
  puzzled when he didn't hear anything and sheds a tear when typing failed.
  He looks around now and then, and sleeps while Gooby is in the
  background, which keeps it as light as before.
- **Developer mode** (Settings → General → Advanced): a Logs button next to
  the version opens this session's log, from launch: the GPU found, the model
  loaded, what was heard and formatted, and where it was typed. Copy shares
  it. Turning it on after something went wrong still shows what happened.
- **One-click setup**: the first screen asks which language you'll dictate
  in, shows the speech model and AI formatter that suit your computer and
  the microphone Gooby will use, and downloads everything with one click.
  Dictation works as soon as speech is ready; the formatter finishes in the
  background. Bigger formatters stay in Settings → AI formatting.
- Setup suggests **Ollama** for AI formatting, with "Keep it all inside
  Gooby" (the built-in formatter, with a choice of models that fit your
  computer) and "No AI formatting for now" as the alternatives, and a pros &
  cons panel. Without Ollama, it links to the download and checks again;
  with it, Gooby downloads the right model into Ollama for you.
- Setup's optional **About you**: your name and email become snippets
  ("Gooby, insert my email"), and your country turns on its common words.
- **"Gooby, …" voice commands**: start a dictation with "Gooby," to change
  things without opening Settings: "formatting off", "sounds off", "stop
  typing" (dictations are kept as notes until "start typing"), "use the
  email style" ("the default style" goes back), "switch to French", "switch
  to the Acme project", "no project", "type that", "open the Library" and
  "what can I say?". "…Gooby, cancel" at the end throws a dictation away.
  Anything Gooby doesn't know is typed as you said it. The overlay says what
  changed (a system notification when the overlay is off), and Help lists
  every command. Commands also work when the speech model hears "Google"
  for "Gooby", which Parakeet often does.
- **Notes to self**: "Gooby, note: …" or "Note to self …" keeps a dictation
  in the Library without typing it, and so does dictating while Gooby's
  window is in front with no text box selected. Notes have their own place
  in the Library and are never removed by cleanup.
- **Summaries in the Library**: after each recording, while Gooby is idle,
  your AI formatter writes a title, a short summary and the action items,
  and suggests tags and a project, which you add with one click. A title you
  typed and your own tags and project are never changed. "Summarize again"
  on a recording redoes it, and AI formatting → Summaries can summarize your
  older recordings. On when the formatter runs on your computer; with a cloud
  provider only if you turn on "Also with cloud providers". A dictation never
  waits for a summary. Search covers summaries too.
- **Keep it as a note when there's nowhere to type** (General → Advanced
  settings, off by default): a dictation made while a button, a list or the
  desktop has focus is kept as a note instead of typed. Only when the system
  is sure; otherwise Gooby types as usual. Linux and Windows.
- **Edit by voice**: select text in any app, press the dictation shortcut
  and say "Gooby, make this shorter", "fix the grammar", "translate this
  into French" or "format this". Gooby rewrites the selection with your AI
  formatter and pastes it over (Ctrl+Z or Cmd+Z undoes it).
- **"Hey Gooby"** (Settings → General, off by default): say "Hey Gooby" and
  what to type, or a command, without pressing the shortcut; Gooby stops two
  seconds after you stop talking, whatever the model or the voice activity
  detection setting. A small model on your computer listens and holds only the last
  second and a half of audio, in memory. Setup offers it (unticked), the tray
  menu turns it on and off, and the tray icon shows a blue dot while it
  listens.
- **Snippets** (Settings → Words): save text you type often, then say
  "Gooby, insert my signature" to type it exactly.
- **Templates by voice**: say a formatting prompt's name after "Gooby," to
  use it for one dictation: "Gooby, SOAP note: patient reports…", even when
  AI formatting is off.
- **Formatting that fits the app**: AI formatting knows where you're typing.
  Emails get paragraphs, chats stay casual, prompts for AI assistants keep
  every detail, and in a terminal or code editor your words are typed as
  said. Each recording shows the app it went into ("Typed into Slack"). Turn
  it off in AI formatting → Format for the app. Not on Wayland, where the
  desktop doesn't say which app is in front.
- Short dictations (a few words) are tidied up without waiting for the AI:
  "um" and "uh" go, "new line" and "question mark" become the real thing,
  and the first letter is a capital.
- **Settings → Words**: Names & words, Snippets, Projects, and **Common
  terms**: packs of acronyms (on by default) and of each country's
  institutions, places, money and slang (US, UK, Canada, Australia, New
  Zealand, Ireland, India, South Africa), plus Hindi and Tagalog words that
  speech models often miss. Turn packs or single terms on and off, search
  them (typos are fine) and remove any term; ordinary words are never
  changed. "Gooby" is in Names & words from the start, so voice commands are
  heard.
- **Words for each project**: names and terms (a book's characters, a
  client's products) used while that project is active. With AI formatting
  on, "open quote", "close quote" and "em dash" become punctuation.
- **Gooby in the overlay**: it walks while you talk, bobs while transcribing,
  formatting or editing (counting the seconds when a step is slow, so a slow
  model doesn't look stuck), and hops with "Typed" once your words are in.
  The hop is skipped when the system asks for less motion. A dictation
  started with "Hey Gooby" says "Pause when you're done".
- When another app already holds the default dictation shortcut, Gooby picks
  a free one (Ctrl+Alt+G, then Ctrl+Alt+Shift+Space) and tells you. A
  shortcut you chose is never changed.
- When Gooby can't type into an app, the text is copied to the clipboard and
  the overlay says so.
- When the system's default input can't hear a voice (S/PDIF, monitor,
  loopback), Gooby switches to a real microphone and tells you. It never
  overrides a microphone you chose, including "Default".
- **Settings → Themes**: light, dark or follow the system, six two-color
  palettes (1-bit, Game Boy, Amber, Blueprint, Paper, Sakura), and **text
  size** (Small to Largest, or Ctrl/Cmd +, −, 0), which scales the whole
  window and the overlay and follows the system text size on Windows and
  GNOME.
- **Gooby's own title bar on Windows**, in the pixel font and your theme's
  colors. Drag it to move the window, double-click to maximize; closing
  still hides Gooby to the tray.
- About → Licenses lists every third-party library, engine, model and font
  in the app with its license text.
- Settings → Debug → Try a voice command runs a "Gooby, …" command as if
  you'd said it, for trying commands without a microphone.
- **Settings → Storage** shows how much space Gooby takes and frees it:
  remove the audio of old recordings (their text stays), remove models you
  don't use, clear logs and caches, open the data folder, or remove all of
  Gooby's data, API keys included, in one step. On Windows, uninstalling
  with "Delete the application data" also removes the API keys.
- **Gooby on Discord**: Settings → About links to Gooby's Discord server,
  for questions, ideas and news.
- **Overlay looks**: Settings → Themes → Overlay look offers three new
  looks beside Classic, each with a live preview: Island (a dark pill that
  floats over any app), Soft (a light capsule with a soft shadow) and Pixel
  (the 1-bit look with pixel corners). The words and Gooby stay the same;
  the new looks also show the recording time and count down the save pill.
  Gooby sits centered in every look, and every look takes your palette's
  colors. Classic stays the default.

### Changed

- **Two speech models left the list**: Canary 1B, whose license allows only
  non-commercial use, and MedASR, which comes with Google's terms for health
  apps. Canary 1B Flash and Canary 1B v2 do the same job under an open
  license.
- **Gooby tidies up after itself**: half-finished downloads go after a day
  instead of a week, and the installer a Windows update leaves behind and a
  speed test's leftover audio go too. Switching to another speech or AI
  formatter model asks whether to delete the old one, so it no longer sits
  on your disk unnoticed.
- **macOS 13.3 or later**: Gooby needs macOS Ventura 13.3 or later on a Mac
  with Apple Silicon. It said macOS 11, but couldn't start before 13.3; an
  older Mac now says which version it needs instead.
- **The Experimental features switch is gone**: its four settings (keyboard
  implementation, acceleration, lazy stream close, voice detector) are under
  an "Experimental" fold in General → Advanced. Without a graphics card the
  acceleration choice is hidden.
- **Clearer wording for the note setting**: "Keep it as a note when there's
  nowhere to type" now reads "Don't type when there's nowhere to type; keep
  a note instead", and its hint says every dictation is saved to your
  Library either way.
- **macOS needs Apple Silicon**: Gooby runs on Macs with an M1 or newer.
  There is no Intel Mac download: the speech engine it relies on is no
  longer made for Intel Macs.
- **The Windows installer looks like Gooby**: its welcome and finish pages
  show Gooby and the wordmark instead of the installer kit's stock picture,
  and each page says "Gooby" and the version at the bottom.
- **Readable in every palette**: secondary text, hints and lines take more
  of the palette's ink in Game Boy, Amber, Blueprint, Paper and Sakura, in
  the window and the overlay, so they no longer fade into the background.
  In the overlay, Island's glow is a soft light behind Gooby instead of a
  blur on his pixels, Pixel's checkered tile is lighter, Classic's
  "Transcribing…" no longer gets cut off and its small titles and menu
  buttons are bigger, and Gooby no longer flashes green before taking a
  palette's colors.
- **The overlay stays centered**: at the bottom it centers on the space
  apps use, so a dock or taskbar on the side no longer pushes it off the
  middle (at the top on macOS and Linux it lines up with the notch and the
  clock), and it moves with the taskbar, dock or screen resolution if they
  change while it's showing.
- **Cleaner text without the AI formatter**: short replies, and any
  dictation the AI formatter doesn't handle (still loading, or no formatter
  at all), now lose "okay so", "you know", "basically", stutters and
  comma-set-off "like"; follow spoken "comma", "period", "colon" and "open
  quote … close quote"; keep only the final version of "at ten, actually
  make that eleven" or "scratch that"; write "twenty five dollars" as $25
  and "nine thirty" as 9:30; and turn "first … second … third …" into a
  numbered list. It still takes no time and no memory, and now works with
  AI formatting off too (Settings → AI formatting → Tidy up without AI
  turns it off). On computers with under 8 GB of memory, setup suggests
  these rules instead of an AI model.
- **Gooby in your colors**: with any palette but black and white, Gooby
  himself is drawn in the palette's colors, in the window and the overlay.
- **Right-click menus and confirmations match your theme**: they're drawn
  in Gooby's colors and pixel font instead of the system's, and work from
  the keyboard.
- **The Library is one tree**: projects, tags and views share one column
  with their recordings, which open right under the folder you click (click
  it again to fold it), so what you said gets the rest of the window.
- **The Library puts what you said first**: a recording opens to its
  transcript, in the widest column, with a small toolbar above it (play,
  copy, edit, add a note, star). Rename, tag and file recordings from the
  list: right-click one, double-click its title, press F2, or drag it onto
  a project or tag. The notes box shows only when a recording has a note.
- **Faster AI formatting without a graphics card**: setup picks Qwen 2.5
  1.5B there (about 1 s per dictation on a 4-core laptop, with 1.5 GB of
  memory) instead of Gemma 3 4B (about 2.6 s and 3.3 GB); a graphics card
  built into the processor no longer counts as one. If your formatter is
  slow on your computer, AI formatting offers the one that fits.
- **Better AI formatting with small models**: dictated questions and
  prompts for an AI are written down instead of answered, self-corrections
  ("no wait", "scratch that", "I mean") are resolved more often, and a
  reply that isn't your dictation is never typed. Switching between apps no
  longer slows the next dictation down, and the AI formatter uses far less
  memory.
- **The first dictation is ready sooner**: Gooby loads the speech model when
  it starts instead of on the first dictation (not with "Unload model:
  Immediately").
- The app is translated again into all 25 of its other languages: newer
  screens (setup, the Library, Themes, voice commands, Help) were English-only,
  and some older settings still used their old names. These are machine
  translations; corrections from native speakers are welcome.
- Gooby uses about 100 MB less memory while it waits in the tray: a minute
  after you close its window, the window is unloaded, and opening it again
  takes a moment longer.
- On Linux (X11), dictated text appears about six times faster: a sentence
  in a fraction of a second, a long paragraph in under a second instead of
  five.
- Setup recommends speech models by accuracy first, then the smaller
  download, then languages, and says when a model for English only would be
  faster. English users get Parakeet.
- New installs follow your system's light or dark mode. A theme you picked
  is kept.
- Everything is bigger by default: 1.25× the old size, about the body text
  of native apps. "Small" keeps the old look.
- **Type what I say** (Settings → General) turns typing off so dictations
  are only kept in your Library, as notes. It replaces the "None" paste
  method; if you used that, the switch is already off.
- The separate "dictate with AI formatting" shortcut (Ctrl+Shift+Space) is
  gone: the dictation shortcut formats whenever formatting is on, and
  "Gooby, format this" formats selected text.
- Projects moved to Settings → Words. Input channel, the output device for
  Gooby's sounds and their volume moved to General → Advanced settings.
- Clearer names in Settings: "Dictation shortcut" (was "Transcribe
  shortcut"), "Sounds" (was "Audio feedback"), "Interface language", "Speech
  models", and Library cleanup under Library instead of History. Model
  descriptions are plain English.
- Confirmation dialogs and the update question name their action ("Empty
  Recently Deleted", "Turn on updates", "Not now") instead of Yes / No.
- Installers, updates, release notes and bug reports live in the public
  [gooby-app/releases](https://github.com/gooby-app/releases) repo; About →
  "Gooby on GitHub", the privacy policy and help links open it. About and
  Help call Gooby source-available, not open source.
- The built-in formatter no longer includes llama.cpp's web chat page,
  which Gooby never opened (3 MB smaller).
- Recordings take about a tenth of the space: the Library keeps their audio
  as Opus (about 10 MB per hour of speech instead of 115 MB), and recordings
  from earlier versions are converted in the background, a minute after
  Gooby starts and never while you dictate. "Also save audio" writes an
  `.opus` beside each saved dictation. Playback, word highlighting and
  re-transcribing work as before.
- Speech models download into Gooby's own folder instead of the Hugging
  Face cache other apps share, so removing Gooby's data removes them too;
  models Gooby downloaded there before move over once, at no cost. After you
  switch models, Gooby offers to remove the old one and says how much space
  that frees.
- Lighter when idle: the speech model stays loaded so dictation always
  starts at once (installs on the old 5-minute default move over), the AI
  formatter (built-in or Ollama) frees its memory after 5 idle minutes
  instead of 30 (the built-in one only with a graphics card), and "Hey Gooby" pauses while the screen is locked (Linux,
  Windows) and skips its detector in silence, using about half the CPU in a
  quiet room.
- The Linux AppImage is a third smaller (190 MB to 127 MB): it carries only
  the GStreamer plugins Gooby needs to play recordings, not every video codec
  and voice on the build machine. An `.rpm` built from source is compressed
  (110 MB to 26 MB).
- Gooby open behind other apps uses next to no CPU: the mascot in the main
  window rests while the window isn't in front (it kept redrawing five times
  a second, 20 times the CPU of a Gooby closed to the tray).

### Fixed

- **AI formatting stays quick right after a summary**: when you dictated again while Gooby was summarizing the last recording, the built-in formatter had to reread its instructions, adding a fraction of a second on a GPU. It now rereads them while you're still talking.
- **Your Library is backed up before an update changes it**: Gooby copies
  its database first, so a failed update can't lose your recordings, and an
  older Gooby opens a Library a newer one has used instead of failing to
  start.
- **Crashes show in the log**: when part of Gooby crashes, the log file
  says where, so a bug report's log shows it (never what you said).
- **A new install opens its window**: Gooby starts in the tray by default,
  so the first launch after installing showed only a tray icon and never
  first-run setup. It now opens until setup is done, and **Start hidden**
  applies only when Gooby starts at login: opened from the app menu, it
  always shows its window (on a Mac, the setting still covers every launch).
- **Uninstalling removes everything when you ask**: the Windows uninstaller's
  choice now says what it deletes (recordings, settings and models) and also
  clears Gooby from Task Manager's startup list; the Linux install script
  asks whether to keep your data, removes the start-at-login entry, and
  `--purge` removes everything; on a Mac, "Remove all Gooby data" also
  clears what macOS keeps for Gooby and its permissions.
- **Every kind of install gets updates**: a release that left out one kind
  of installer from its update list (or offered a `.deb` install the
  AppImage) now can't be published.
- **Start at login on Linux** works when Gooby's path has a space in it, and
  with the install script on systems without FUSE; an uninstalled Gooby no
  longer leaves a broken entry behind.
- **A `.deb` update that needs your password** says how to install it by
  hand if the password prompt is cancelled.
- **AI formatting:** Ollama set up in first-run setup is listed as Ollama, not
  "Custom", and with the built-in formatter and no model yet, the hint no
  longer says "turn on" under a switch that's already on.
- **Menus:** a dropdown near the bottom of the window opens upward instead of
  being cut off, and Home, End and the arrow keys move through its options.
- **Translations:** 25 strings reworded in English (the speech model and
  shortcut settings, Sounds, Library, "Formatting...", and others) are now
  updated in all 25 languages too.
- **Tray menu:** Settings opens Settings (it opened the Library), Check for
  Updates opens About to show the result, and the check marks for "Hey
  Gooby" and the speech model stay right after a click that changes nothing.
  Ctrl+Q (Cmd+Q on a Mac) in Gooby's window quits, as the menu says.
- **Recently Deleted**: the Delete key deletes the selected recordings
  forever, after asking; it did nothing before. Deleting forever from the
  menu or the reading pane asks first too.
- **Pasting into slower apps:** a dictation into apps that take a moment to
  paste, like Notepad++, no longer pastes nothing or your old clipboard.
  Gooby now waits until the app has pasted before putting your clipboard back
  (Windows and macOS; on Linux it waits longer). The switch is in Settings →
  General → Advanced → Output.
- **Library:** a recording's player shows its length right away, not 0:00
  until you press play.
- **The save pill's menu** shows its buttons (Copy text, Save as..., your
  projects) side by side again; they were stacked and cut off.
- **The overlay fades in and out** again instead of popping up and
  vanishing at once.
- **Linux install:** on Ubuntu 22.04, Debian 12 and other systems too old for
  the AppImage, the one-command install now says so and points to the `.deb`,
  instead of installing a Gooby that won't start.
- **Gooby** no longer stands on a black line. Every frame of the mascot
  had one under his feet, which showed in light themes.
- Settings → AI formatting disappeared when formatting was off (after "No AI
  formatting for now" at setup, or "Gooby, formatting off"), leaving no
  switch to turn it back on. It's always there now, with the switch on top.
- Settings → Projects (and each project's words) only showed with "Save
  dictations as files" on. A project only asks for a folder when dictations
  are saved as files.
- At large text sizes, Settings no longer runs off the edge: the sidebar
  scrolls so Help is always reachable, Help's lists stack instead of
  squeezing to a word per line, and the AI formatting fields and text-size
  tiles fit the window.
- Checkboxes, radio buttons, sliders and the Library's dropdowns are drawn
  in your palette's colors; an unticked box was too faint to see on dark
  palettes, and the audio player was pink in every palette.
- Model cards no longer grow when you point at them, which blurred their
  text.
- The overlay's seconds counter no longer runs into its label, and AI
  formatting says "Formatting..." instead of "Processing...".
- On Linux (X11), the recording overlay is on again for installs from before
  it was shown by default there; turn it off in General → Advanced settings
  → Overlay if you prefer.
- On Windows, Gooby's window no longer grows a little taller each time it
  opens, and the Back button on setup's model list no longer sits under the
  title bar.
- How many recordings to keep is greyed out unless Auto-delete recordings is
  set to Keep latest, the only time it's used. Auto-delete recordings shows
  up in Settings search and says what it never deletes.
- Settings texts that were out of date: the paste method no longer mentions
  "None", Clipboard handling and Copy when done explain how they differ,
  Help says where Snippets are, and "Text isn't formatted" in Help names the
  likely causes.
- Setup no longer says AI formatting is downloading when Ollama already has
  the model.
- A fresh install no longer greets you with "What's new… Gooby has been
  updated", and "What's new" shows links in release notes as plain words.
- Clicking download twice (or reloading the window) no longer starts a
  second download of the same model that fights the first.
- Cancelling a dictation while it was being transcribed or formatted left
  its audio file behind, unseen in the Library and never deleted. Gooby now
  removes it, and on startup clears out any such leftovers, downloads not
  resumed for a week and the log from before Gooby was renamed.
- Gooby's logs stay small: they record the main steps instead of every
  detail (the detailed level is still in Debug settings), and the built-in
  formatter's log starts over past 500 KB. On Linux the window no longer
  keeps a cache of its own pages on disk (up to ~90 MB).
- Starting a dictation while the last one was still being typed no longer
  shows Gooby as done and idle while you speak: the new recording starts once
  the text is in.

### Security

- **API keys stay in Rust**: the settings window no longer receives your saved API keys, only a sign that one is set.
- **No API key over plain http**: a cloud AI provider at an `http://` address on another computer never gets your key.
- **Speech models are checked after download**: a model from Hugging Face must match its published fingerprint before Gooby uses it.
- **Less in the logs**: the debug log no longer lists your settings, and an AI provider's error reply is cut short, since it can repeat what you said.
- **Dictations stay out of clipboard history**: on Windows and macOS, the text Gooby passes through the clipboard to paste, or to read a selection for voice editing, is kept out of clipboard history, cloud clipboard sync and clipboard managers.
- **The speed test's temporary files** can only be read by your account and are removed after a crash.
- Updated the OpenSSL bindings used for downloads (eight advisories) and
  other libraries with known bugs (serde_with, rand, anyhow, event-listener,
  memmap2).
- Gooby's window can no longer read files from disk itself: the Library's
  player gets each recording from Gooby, so the file-reading plugin and the
  asset protocol it needed are gone.
- AI formatting on this computer (the built-in formatter or Ollama) no
  longer goes through a proxy set with `HTTP_PROXY` or `ALL_PROXY`: the proxy
  could see what you said, and the built-in formatter never finished loading.
  Cloud providers still use the proxy.
- Updated the certificate checks used for downloads and update checks
  (rustls-webpki, webpki-roots, webpki-root-certs): they could trust
  intermediates that browsers no longer trust.
- Updated a cryptography helper (ctutils) whose comparisons could take
  different times for different values (RUSTSEC-2026-0385).

### Known issues

- **"Hey Gooby"** is experimental: it misses some voices and can wake on
  similar phrases. It's off unless you turn it on.
- **Esc** doesn't throw a dictation away on Linux: end it with "Gooby,
  cancel" or use the tray.
- **Translations** of the app are machine-made; English reads best.
- **First install:** Windows and macOS warn that Gooby isn't from a known
  developer, because it isn't signed with a paid certificate yet.
- **An AI server on another computer** that needs an API key must use an
  `https://` address: Gooby won't send a key over plain `http://` to another
  computer, where others on the network could read it, and the server then
  answers that the request isn't allowed.

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

[Unreleased]: https://github.com/gooby-app/gooby-dev/compare/v0.0.8...HEAD
[0.0.8]: https://github.com/gooby-app/gooby-dev/compare/v0.0.7...v0.0.8
[0.0.7]: https://github.com/gooby-app/gooby-dev/compare/v0.0.6...v0.0.7
[0.0.6]: https://github.com/gooby-app/gooby-dev/compare/v0.0.5...v0.0.6
[0.0.5]: https://github.com/gooby-app/gooby-dev/compare/v0.0.4...v0.0.5
[0.0.4]: https://github.com/gooby-app/gooby-dev/compare/v0.0.3...v0.0.4
[0.0.3]: https://github.com/gooby-app/gooby-dev/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/gooby-app/gooby-dev/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/gooby-app/gooby-dev/tree/v0.0.1
