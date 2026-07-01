# ACCELERANDO — Performance Guide
### By Ryan Etten, RHCA · Red Hat TTLA Capstone 2026

**Setup:** Run **`src/tab_a_settings.rb`** first, then **`src/tab_b_track.rb`**.
You open on **servant alone** — one word, before TTLA. Everything else starts silent.

**Live changes:** edit a value in **Tab A**, press **Run on Tab A**. The change lands on the
next bar's downbeat, and the log prints that section's caption.

**Pacing:** stay on each combo ~2–4 bars before the next move.
At 118 BPM a bar is ~2 seconds. Key: F minor. The log shows only the narration — share the screen.

---

## The layers (gates in Tab A)
- **`g_TTLA`** — the bass. THE PROGRAM, the foundation that carried you.
- **`g_presence_pillar`** — the kick. PRESENCE, showing up in the room.
- **`g_influence_pillar`** — snare + hats. INFLUENCE, moving people along.
- **`g_strategic_pillar`** — the lead arp (starts ON: servant alone).

Each amp (`TTLA_amp`, `presence_amp`, `influence_amp`, `strategic_amp`) sets how loud that layer is.

---

## THE SONG — cues & the captions they trigger

| # | Move (edit in Tab A → Run) | Log caption |
|---|-----------------------------|-------------|
| 1 | **OPEN** — already set: `strategic_combo [:servant]`, only `g_strategic_pillar` on | `ONE WORD · all i had, all i was asked for` |
| 2 | **FOUNDATION** — `set :g_TTLA, 1` | `THE PROGRAM · the foundation that carried me forward` |
| 3 | **PRESENCE** — `set :g_presence_pillar, 1` | `PRESENCE · learning to truly show up in the room` |
| 4 | `set :strategic_combo, [:servant, :present]` | `PRESENCE · i learned to truly show up` |
| 5 | **INFLUENCE** — `set :g_influence_pillar, 1` | `INFLUENCE · moving people along with you` |
| 6 | `set :strategic_combo, [:servant, :present, :influential]` | `INFLUENCE · driving my presence forward` |
| 7 | **A-HA** — `set :strategic_combo, [:servant, :present, :influential, :authentic]` | `STRETCH · authenticity was my missing piece — / and realizing that was strategy in action` |
| 8 | **PEAK** — `set :strategic_combo, [:servant, :present, :influential, :authentic, :strategic]` | `STRATEGIC · strategy holds every word we named — / servant, fair, influential, transformational, / thoughtful, trusted, engaging, visionary, / authentic, present, exploratory, empathetic` |
| 9 | **STRATEGY ALONE** — at the 5-word peak, drop all support: `g_presence_pillar 0` · `g_influence_pillar 0` · `g_TTLA 0` | `STRATEGY ALONE · still pretty, but exposed. / it loses its direction without support` |
| 10 | **RESTORE** — bring them all back: `g_presence_pillar 1` · `g_influence_pillar 1` · `g_TTLA 1` `set :strategic_combo, [:present, :influential, :strategic]` | full re-announce → `THE PROGRAM` · `PRESENCE` · `INFLUENCE` · `STRETCH` · `...strategy is knowing when to use each — / and THAT is leadership.` |
| 11 | **ANSWER** — `set :strategic_combo, [:present, :strategic]` | `STRATEGIC · influential, now carried by one word` |
| 12 | **FULL CIRCLE** — `set :strategic_combo, [:strategic]` | `FULL CIRCLE · one word to begin... / ...one word to end. / the answer was STRATEGIC all along.` |
| 13 | **CLOSE** — `set :strategic_combo, []` (auto-fades the lead out over ~3 bars) | `THANK YOU · for an incredible journey.` |

*Let the echo decay fully before you stop Tab B. Then — thank you.*

---

## Notes on the captions (so cues fire as intended)

- **The count captions (ONE WORD / PRESENCE / STRETCH)** only fire for combos **without** `:strategic`. Once strategic is in the combo, you get the strategic captions instead — so the opening lines never mislead.
- **The cohort-words caption (step 8)** needs a **5-word combo that includes `:strategic`** (e.g. `[:servant, :present, :influential, :authentic, :strategic]`). Alternate peak flavors that also work: `[..., :fair, :strategic]` or `[..., :visionary, :strategic]`.
- **STRATEGY ALONE (step 9)** only fires from that 5-word state when all of `g_presence_pillar`, `g_influence_pillar`, and `g_TTLA` are 0. Bringing them back triggers the full RESTORE cascade.
- **`[:present, :strategic]`** has its own line: `STRATEGIC · influence still here, strategy leads` — a two-word variant if you want it.
- **The close auto-fades:** setting `strategic_combo []` eases `:fade` down to 0 on its own (~3 bars, since the step is 0.34). You don't need to step `:fade` manually. Re-running Tab A resets it to full.

---

## Quick reference (bare moves)
1. `[:servant]`, gates off except strategic
2. `g_TTLA 1`
3. `g_presence_pillar 1`
4. `[:servant, :present]`
5. `g_influence_pillar 1`
6. `[:servant, :present, :influential]`
7. `[:servant, :present, :influential, :authentic]`
8. `[:servant, :present, :influential, :authentic, :strategic]`
9. drop `g_influence_pillar` → 0
10. drop `g_presence_pillar` → 0
11. drop `g_TTLA` → 0
12. *(opt)* `[:servant, :present, :influential, :fair, :strategic]`
13. *(opt)* `[:servant, :present, :influential, :visionary, :strategic]`
15. restore all three → 1 + `[:present, :influential, :strategic]` plus `g_presence_pillar` · `g_influence_pillar` · `g_TTLA` → 1
16. drop `g_influence_pillar` → 0
17. `[:present, :strategic]`
18. drop `g_presence_pillar` → 0
19. drop `g_TTLA` → 0
20. `[:strategic]`
21. `[]` → let it fade → silence
