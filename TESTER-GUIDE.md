# Testing Gooby

Thanks for testing Gooby's alpha. This guide is a script: follow your
computer's part from top to bottom, and write down what happened at each
step, good or bad. It takes about an hour, plus the model download.

- [Before you start](#before-you-start)
- [1. Install](#1-install)
- [2. First-run setup](#2-first-run-setup)
- [3. Dictate](#3-dictate)
- [4. Talk to Gooby](#4-talk-to-gooby)
- [5. The Library](#5-the-library)
- [6. Settings, looks and the tray](#6-settings-looks-and-the-tray)
- [7. Quit, restart, sleep](#7-quit-restart-sleep)
- [8. Update](#8-update)
- [9. Uninstall](#9-uninstall)
- [Sending us what you found](#sending-us-what-you-found)

## Before you start

- **A real microphone.** A laptop's built-in one, a headset or a USB mic.
  Gooby can't hear anything through a digital (S/PDIF) input.
- **Say who you are and what you're on:** the OS and its version, the
  computer (and whether it has a graphics card), and how much memory it has.
- **Use only your own words.** Don't dictate passwords, health details or
  anything about someone else. Everything stays on your computer, but you
  may send us screenshots and logs.
- **The shortcut:** Ctrl+Alt+Space on Windows and Linux, Option+Space on
  macOS. Hold it while you talk, or tap it once to start and again to stop.
  If setup gave you a different one, use that.

## 1. Install

Follow [INSTALL.md](INSTALL.md) for your OS. Note what your computer said and
what you clicked.

**Windows** (10 or 11):

1. Run `Gooby_<version>_x64-setup.exe`. SmartScreen says "Windows protected
   your PC": **More info → Run anyway**.
2. No administrator prompt should appear. Click through to **Finish**.
3. If Smart App Control blocks it instead, say so; that's useful to know.

**macOS** (13.3 or later, Apple Silicon):

1. Open `Gooby_<version>_aarch64.dmg`. First open Gooby **from the disk
   image**: a card should offer to move it to Applications. Let it.
2. macOS says it can't verify Gooby: **Done**, then **System Settings →
   Privacy & Security → Open Anyway**, then **Open Anyway** again.
3. It must never say Gooby "is damaged". If it does, tell us how you
   downloaded it.
4. Allow **Microphone** and **Accessibility** when asked.

**Linux** (Ubuntu 22.04 or later):

- **Ubuntu 24.04:** try the one-command install first:
  `curl -fsSL https://raw.githubusercontent.com/gooby-app/gooby-releases/main/install-linux.sh | bash`.
  Gooby should be in your app menu. Or the AppImage: `chmod +x` it and open
  it.
- **Ubuntu 22.04:** `sudo apt install ./Gooby_<version>_amd64.deb`. The
  one-command install should stop and tell you to use the `.deb`.
- On Wayland (Ubuntu's default), your desktop asks once to let Gooby control
  the keyboard. Allow it.

## 2. First-run setup

1. Gooby opens to setup on its own. Note what it picked: the speech model,
   the AI formatter (or "Gooby's own (Inky)") and the microphone.
2. Is the microphone the one you'll speak into? If not, change it and say
   so.
3. Click to download. Note how long it took and how big it said it was.
4. Gooby opens once speech is ready, while the formatter finishes in the
   background. Did "All set!" ever get stuck?
5. A fresh install must **not** show "What's new" or "Gooby has been
   updated".

## 3. Dictate

Try each of these in a different app, and note for each: did the text
appear, was it right, how long did it take after you stopped talking, and
did it fit the app (an email reads like an email, a chat like a chat)?

1. **An email** (Gmail in a browser, Outlook or Mail): two or three
   sentences.
2. **A chat** (Slack, Discord, WhatsApp, Teams): one short line.
3. **A document** (Google Docs, Word, a notes app): a paragraph.
4. **A list:** "Shopping list: first eggs, second milk, third bread."
5. **Numbers and times:** "Meet at three thirty on the fifth, it costs
   twenty five dollars."
6. **Umms and corrections:** "So um I think we should, no wait, we must
   ship on Friday."
7. **A code editor or a terminal:** a short sentence. Nothing in the
   terminal should be interrupted or run.
8. **Hold and tap:** once holding the shortcut, once tapping it twice.
9. **Back to back:** as soon as one dictation stops, start the next. The
   second should start after the first text appears, in order.
10. **Nothing said:** press the shortcut, stay silent, stop. Gooby should
    say it didn't hear anything.
11. **Cancel:** end a dictation with "Gooby, cancel". On Windows and macOS,
    also press Esc while recording. Nothing should be typed.

Watch the overlay (the small window that shows while Gooby listens): where
it sits, whether it covers anything, and what it shows while listening,
thinking and done.

## 4. Talk to Gooby

Start a dictation with "Gooby," and a command. Help in the app lists them
all (or say "Gooby, what can I say?"). Try at least these:

1. **"Gooby, note: call the dentist tomorrow."** Nothing is typed; the note
   is in the Library.
2. Select a sentence you typed, then **"Gooby, make this shorter."** It's
   replaced. Your clipboard should still have what it had before.
3. **"Gooby, formatting off"**, dictate something (it's typed exactly as
   said), then **"Gooby, formatting on"**. Ask **"Gooby, what formatting
   are you using?"**: does the answer match Settings → AI formatting?
4. **"Gooby, switch to the Test project"**, dictate, then **"Gooby, no
   project"**.
5. **"Gooby, open the Library."**
6. A sentence that only starts with the word Gooby, like "Gooby is a funny
   name." It should be typed as you said it.
7. If Gooby misheard its own name ("Goofy", "Guppy"), write down how it
   spelled it.

"Hey Gooby" (hands-free) is **experimental** and off by default. If you try
it (Settings → General, or the tray menu), tell us how often it woke when
you said it, and whether it ever woke when you didn't, especially on "Hey
Google" or "OK Google".

## 5. The Library

Open Gooby's window (the tray icon, or launch it again).

1. Your dictations are there, newest first, each with a title.
2. Open one: the text, then play it. Words light up as it plays; click a
   word to jump there, and drag through the audio.
3. Rename one (double-click the title, or right-click → Rename).
4. Make a project, drag a recording into it, add a tag (right-click →
   Tags).
5. Edit a transcript and save it.
6. Star one, search for a word you said, and look at the calendar.
7. Delete one, find it in Recently Deleted, restore it. Then delete one
   forever.
8. If a summary shows (title, summary, action items), is it right?

## 6. Settings, looks and the tray

1. **Themes:** pick two palettes, light and dark. Then each **Overlay
   look** (Classic, Island, Soft, Pixel), at the bottom and at the top, and
   dictate once with each. Anything hard to read, cut off or in the wrong
   place?
2. **Text size:** Largest. Does every page still fit? Then back to
   Default.
3. **Windows:** display scaling at 125% and 150% (Windows Settings →
   Display), and the taskbar on the left or top if you can.
   **macOS:** the Dock on the side, and a Mac with a notch: where does the
   overlay sit? **Linux:** a dock on the left.
4. **The tray menu:** Open Gooby, Settings, Check for Updates, Quit. Each
   should do what it says.
5. **Settings → Storage:** does it show how much space Gooby takes? Don't
   press Remove all yet.
6. Turn **Launch on startup** on (Settings → General).

## 7. Quit, restart, sleep

1. Quit from the tray. Start Gooby again: your Library and settings are
   still there.
2. Restart the computer. Gooby starts on its own (in the tray, without a
   window). Dictate once.
3. Put the computer to sleep, wake it, and dictate once.

## 8. Update

When we tell you a new version is out:

1. Tray → **Check for Updates** (or Settings → About → Updates → Check
   now). It finds the new version and downloads it.
2. **Restart to Update.** Gooby comes back as the new version (Settings →
   About shows it) and shows what's new.
3. Your Library, settings and shortcut are kept. On macOS, Microphone and
   Accessibility are still allowed: dictate once without being asked again.
4. On Linux with the `.deb`, it asks for your password to install. Note what
   it showed.

## 9. Uninstall

Do this last, and twice if you can: once keeping your data and once deleting
it. Reinstall in between.

**Windows:** Settings → Apps → Installed apps → Gooby → Uninstall. First
leave "Also delete my recordings, settings and downloaded models" unticked,
then reinstall and tick it.

**macOS:** Settings → Storage → **Move Gooby to Trash**. First keep your
data, then reinstall and delete it.

**Linux:** with the one-command install,
`curl -fsSL https://raw.githubusercontent.com/gooby-app/gooby-releases/main/install-linux.sh | bash -s -- --uninstall`
(it asks about your data); with the `.deb`, Settings → Storage → Remove all
Gooby data first (to delete it), then `sudo apt remove gooby`.

**After deleting everything, check what's left** and tell us if anything
is:

| OS | Should be gone |
|---|---|
| Windows | `%APPDATA%\com.gooby.dictation`, `%LOCALAPPDATA%\com.gooby.dictation`, `%LOCALAPPDATA%\Gooby`, Gooby in Credential Manager and in Task Manager → Startup apps |
| macOS | Gooby in Applications; `com.gooby.dictation` in `~/Library/Application Support`, `~/Library/Caches`, `~/Library/Logs`, `~/Library/WebKit`, `~/Library/HTTPStorages`, `~/Library/Preferences` and `~/Library/Saved Application State`; Gooby in System Settings → Privacy & Security → Microphone and Accessibility; `com.gooby.dictation` in Keychain Access |
| Linux | `~/.local/share/com.gooby.dictation`, `~/.config/com.gooby.dictation`, `~/.cache/com.gooby.dictation`, `~/.local/share/gooby`, `~/.local/bin/gooby`, `~/.config/autostart/Gooby.desktop`, Gooby in the app menu, `com.gooby.dictation` in Passwords and Keys (Seahorse) |

After keeping your data, those folders should still be there, and
reinstalling should bring back your Library and settings.

## Sending us what you found

Post in the testing channel on [Discord](https://heygooby.com/discord), or
open an [issue](https://github.com/gooby-app/gooby-releases/issues). For each
problem:

- the step number from this guide (like "3.5");
- what you did, what you expected and what happened;
- a screenshot if it's about how something looks;
- for a crash or anything that went wrong, **the log**: Settings → About →
  Log directory opens the folder; attach the newest file. Logs never
  contain what you said.

Things that worked are useful too: "Section 3 all fine on Windows 11" tells
us something. What Gooby stores and sends is in [PRIVACY.md](PRIVACY.md);
fixes for common problems are in [TROUBLESHOOTING.md](TROUBLESHOOTING.md).
