# Accelerando

A live-performable generative song written in [Sonic Pi](https://sonic-pi.net/) (Ruby),
built as a leadership reflection for the Red Hat TTLA (Technology Thought Leader Accelerator) capstone.

The piece dramatizes a year-long leadership journey: it opens on a single word — *servant* — and
builds, layer by layer, into a full arrangement whose melody is made from the words a cohort used to
describe one another. As the performer adds "words" live, the lead grows, until it resolves on the one
word big enough to hold all the others: *strategic*. An on-screen log narrates each section as it enters.

Named *Accelerando* — the musical term for *gradually getting faster* — because the arpeggio literally
accelerates as it grows, and because the accelerator is what sped the whole journey forward.

## Files

- **`src/tab_a_settings.rb`** — Settings, gates, per-section volumes, the word→note map, and the combo
  progression. **Run this FIRST.** Edit values here live and press Run; changes cross into the track.
- **`src/tab_b_track.rb`** — The track itself: the metronome clock, the narrator log, the drum/bass/lead
  loops, and all FX. **Run this SECOND.**

## How to run

1. Open both files in separate Sonic Pi buffers.
2. Run **`src/tab_a_settings.rb`**, then **`src/tab_b_track.rb`**.
3. Perform by editing the `set :strategic_combo, [...]` line (and the `g_*` gates) in Tab A and pressing Run.
   The change lands on the next bar's downbeat; the log prints the caption for that section.

Key: F minor (root F). Tempo: 118 BPM.

## Performance

The song was designed for a two-phase capstone talk: ~3 minutes walking through the code on screen while
telling the story, then an uninterrupted play where the music and the on-screen log narrate together.

## Repository layout

```
accelerando/
├── LICENSE                     # MIT
├── README.md
├── src/
│   ├── tab_a_settings.rb       # run FIRST
│   └── tab_b_track.rb          # run SECOND
└── docs/
    ├── performance-guide.md    # mechanical cue reference
```

## License

Released under the [MIT License](LICENSE) — use it, change it, perform it, build on it. Attribution appreciated.
