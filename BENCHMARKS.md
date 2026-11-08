# Benchmarks

How fast Gooby is, and how much memory it uses, measured the same way for
every release next to the release before. The README shows the short
version.

## The machine

A Linux PC (AMD Ryzen 9 9900X, Ubuntu 24.04.5 LTS) held to 4 cores and 8 GB of memory (and 2 GB of swap), with no graphics card for Gooby to use. It stands for an ordinary laptop.

## What's measured

- **Stop talking → text typed:** from the moment you stop the dictation to
  the last character appearing in a text box, with the settings a fresh
  install gets: the speech model, and formatting as setup leaves it (Inky,
  Gooby's own formatter, from 0.0.8; before that, the AI model setup
  downloaded for this much memory). The speech is a synthetic voice played
  in as the microphone, the same sentences for every release.
- **First dictation after starting Gooby:** the same, a couple of seconds
  after launch, while models may still be loading.
- **Start-up:** from launch until Gooby's window is drawn.
- **Memory:** Gooby and everything it starts (the window, the speech model,
  the AI formatter), counting shared memory fairly. While waiting: 10
  seconds after start. While dictating: the peak.
- **Words heard right:** the speech model's transcript against the words
  spoken, ignoring capitals and punctuation. A clear synthetic voice is
  easy to hear, so this is higher than with real voices and rooms.

Each number is the median of several runs; the range is the middle 80% of
them. The two releases take turns, so a busy moment hits both alike.

## Results

Measured 2026-11-08.

|                                      |                 v0.0.8 |                 v0.0.9 |
| ------------------------------------ | ---------------------: | ---------------------: |
| Stop talking → text typed (20 words) | 550 ms (520 ms–820 ms) | 560 ms (540 ms–830 ms) |
| Stop talking → text typed (31 words) | 610 ms (590 ms–830 ms) | 600 ms (590 ms–810 ms) |
| First dictation after starting Gooby | 590 ms (550 ms–800 ms) | 640 ms (560 ms–800 ms) |
| Start-up, until the window is drawn  | 370 ms (370 ms–370 ms) | 350 ms (340 ms–350 ms) |
| Memory while waiting                 |                 1.4 GB |                 1.4 GB |
| Memory while dictating (peak)        | 1.5 GB (1.5 GB–1.5 GB) | 1.5 GB (1.5 GB–1.5 GB) |
| Words heard right                    |                   100% |                   100% |

## What it can't show

- **It's one kind of computer.** The limits give Gooby fewer cores and less
  memory, but each core is still a modern one: an older laptop's slower
  cores and memory make every step slower than shown here.
- **No graphics card.** With one, the speech model and the AI formatter
  run on it and are faster.
- **Linux only, for now.** Windows and macOS do the same work, but their
  numbers differ.
- **Some noise.** The absolute numbers move a little from run to run;
  the comparison with the release before is measured in the same run, on
  the same PC, so it's the steadier number.
