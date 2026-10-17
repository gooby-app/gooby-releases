# Security

## Reporting a problem

Please **don't open a public issue** for a security problem. Report it
privately through GitHub instead:
[Report a vulnerability](https://github.com/gooby-app/releases/security/advisories/new).

Include what you found, how to reproduce it, and which Gooby version and OS
you used. We aim to reply within a week, and we'll credit you in the release
notes unless you'd rather we didn't.

## Supported versions

Only the latest release gets security fixes. Gooby can update itself (once
you allow update checks), so staying current is one click.

## What Gooby does to stay safe

- **Local by default.** Speech recognition and the default AI formatter run on
  your computer. See [PRIVACY.md](PRIVACY.md) for everything that can touch
  the network.
- **Signed updates.** Every update is signed, and Gooby refuses to install one
  whose signature doesn't match the key built into the app.
- **A locked-down window.** A strict Content Security Policy, and the app can
  only read audio from its own recordings folder.
- **API keys stay put.** The AI formatting client doesn't follow redirects, so
  a key you entered for one provider is never forwarded to another host.

## In scope

- Anything that sends audio, text or files off the device without the user
  turning it on.
- Reading or writing files outside Gooby's data folder and the folders the
  user chose.
- Running code through a crafted model file, update, settings file or
  recording.
- Bypassing update signature checks.

Problems that need someone already logged in as you, with full access to your
files, are generally out of scope.
