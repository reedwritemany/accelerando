# ═══════════════════════════════════════════════════════════════
#  ACCELERANDO - By Ryan Etten, RHCA - Red Hat TTLA Captstone 2026
#  TAB A — SETTINGS + GATES + WORD MAP. Run THIS first, then Tab B.
# ═══════════════════════════════════════════════════════════════
use_bpm 118
# ── GATES (flip 0<->1, press Run) ───────────────────────────────
# OPENING STATE: only the lead plays — servant alone, "from the first
# day." Everything else starts silent. (:met1 is a silent clock.)
set :g_TTLA,               0   # THE PROGRAM (TTLA) — enters to carry you forward (start OFF)
set :g_presence_pillar,    0   # the kick (bring in when you "arrive")
set :g_influence_pillar,   0   # snare + hats (bring in to "move the room")
set :g_strategic_pillar,   1   # STRATEGIC = your word-cloud lead (START HERE: servant alone)
# ── PER-SECTION VOLUME (gate = ON/OFF, amp = how loud). ~0.2 to ~1.5.
set :TTLA_amp,             0.4   # THE PROGRAM bass — the foundation that carries you
set :presence_amp,         0.8   # how strongly you show up (kick)
set :influence_amp,        0.4
set :strategic_amp,        0.4   # your strategic lead
# ── BASS NOTE follows combo size: 1->F 2->C 3->Ab 4->Bb 5->F(oct).
set :bass_step,            0
# ── FADE (the ending): 1.0 = full. To CLOSE, set combo to [] (strategic
#    alone) then ease :fade down to 0 — strategic fades into the echo.
set :fade,                 1
# ── STRATEGIC COMBO — your progression. Each pillar adds its OWN word,
#    so the lead proves what you learned. The A-HA is at 4 (authentic);
#    skip 5; then drop to 3 with servant replaced by strategic to close:
#   1. OPEN:      [:servant]                                    (your one word)
#   2. PRESENCE:  [:servant, :present]                          (+present)
#   3. INFLUENCE: [:servant, :present, :influential]         (the three pillars)
#   4. A-HA:      [:servant, :present, :influential, :authentic]  (Red Hat One)
#                 [:servant, :present, :influential, :authentic, :strategic]
#                 [:servant, :present, :influential, :fair, :strategic]
#                 [:servant, :present, :influential, :visionary, :strategic]
#   5. ANSWER:    [:present, :influential, :strategic]     (servant -> strategic)                                      (strategic alone, then fade)
set :strategic_combo,  [:servant]
define :pattern do |pattern|
  return pattern.ring.tick == "x"
end
# ── COHORT WORD CLOUD — each word a note in F minor (F G Ab Bb C Db Eb).
#    strategic = F (the root). The lead uses these.
WORD_NOTES = {
  strategic: 65,        # F4 — the root
  servant: 68,          # Ab4
  fair: 72,             # C5
  influential: 56,      # Ab3 — warm low note (pillar word)
  transformational: 70, # Bb4
  thoughtful: 75,       # Eb5
  trusted:  60,         # C4
  engaging: 73,         # Db5
  visionary: 79,        # G5 — soaring top note
  authentic: 60,        # C4 — the fifth; completes the chord (the a-ha blooms)
  present: 63,          # Eb4 — warm (pillar word)
  exploratory: 70,      # Bb4
  empathetic: 63        # Eb4
}
WORDS = WORD_NOTES.keys.ring
puts "ACCELERANDO - By Ryan Etten, RHCA"
