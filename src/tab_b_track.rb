use_bpm 118
use_debug false
use_cue_logging false
set :n_started, 0
set :n_combo, -1
set :n_presence, 0
set :n_influence, 0
set :n_reflection, 0
set :n_stripped, 0
set :n_circle, 0
live_loop :met1 do
  sleep 1
end
live_loop :narrator, sync: :met1 do
  pr = get(:n_presence) || 0
  inf = get(:n_influence) || 0
  ref = get(:n_reflection) || 0
  combo = get(:strategic_combo) || []
  lastn = get(:n_combo) || -1
  n = combo.length
  bar = "──────────────────────────────"
  if get(:g_TTLA) == 1 && ref == 0
    puts bar; puts "  THE PROGRAM · the foundation that carried me forward"; puts bar
  end
  if get(:g_presence_pillar) == 1 && pr == 0
    puts bar; puts "  PRESENCE · learning to truly show up in the room"; puts bar
  end
  if get(:g_influence_pillar) == 1 && inf == 0
    puts bar; puts "  INFLUENCE · moving people along with you"; puts bar
  end
  if (n != lastn || get(:n_started) != 1) && get(:g_strategic_pillar) == 1
    set :n_started, 1
    if combo == [:strategic]
      puts bar; puts "  FULL CIRCLE · one word to begin..."
      puts "...one word to end."
      puts "  the answer was STRATEGIC all along."; puts bar
    elsif combo == [:present, :strategic]
      puts bar; puts "  STRATEGIC · influence still here, strategy leads"; puts bar
    elsif n >= 5 && combo.include?(:strategic)
      puts bar; puts "  STRATEGIC · strategy holds every word we named —"
      puts "        servant, fair, influential, transformational,"
      puts "        thoughtful, trusted, engaging, visionary,"
      puts "        authentic, present, exploratory, empathetic";puts bar
    elsif combo.include?(:strategic)
      puts bar; puts "  STRATEGIC · authenticity, now carried by one word"; puts bar
    elsif n >= 1
      case n
      when 1 then puts bar; puts "  ONE WORD · all i had, all i was asked for"; puts bar
      when 2 then puts bar; puts "  PRESENCE · i learned to truly show up"; puts bar
      when 3 then puts bar; puts "  INFLUENCE · driving my presence forward"; puts bar
      when 4 then puts bar; puts "  STRETCH · authenticity was my missing piece —"
        puts "        and realizing that was strategy in action"; puts bar
      else        puts bar; puts "  STRATEGIC · leadership now resolves —"
        puts "        the combination, still growing"; puts bar
      end
    end
  end
  stripped = (n >= 5 && get(:g_strategic_pillar) == 1 &&
              get(:g_presence_pillar) == 0 && get(:g_influence_pillar) == 0 &&
              get(:g_TTLA) == 0)
  was_stripped = (get(:n_stripped) || 0) == 1
  if stripped && !was_stripped
    puts bar; puts "  STRATEGY ALONE · still pretty, but exposed."
    puts "  it loses its direction without support"; puts bar
  end
  if !stripped && was_stripped
    puts bar; puts "  THE PROGRAM · the foundation that carried me forward"; puts bar
    puts bar; puts "  PRESENCE · learning to truly show up in the room"; puts bar
    puts bar; puts "  INFLUENCE · moving people along with you"; puts bar
    puts bar; puts "  STRETCH · I added authenticity because I needed it —"
    puts "        then saw the one word they asked for was a trick"; puts bar
    puts bar; puts "  ...strategy is knowing when to use each —"
    puts "     and THAT is leadership."; puts bar
  end
  set :n_stripped, (stripped ? 1 : 0)
  full_circle = (n == 0 && get(:g_strategic_pillar) == 1)
  was_circle = (get(:n_circle) || 0) == 1
  if full_circle && !was_circle
    puts bar; puts "  THANK YOU · for an incredible journey."; puts bar
  end
  set :n_circle, (full_circle ? 1 : 0)
  set :n_presence,   [pr,  get(:g_presence_pillar)].max
  set :n_influence,  [inf, get(:g_influence_pillar)].max
  set :n_reflection, [ref, get(:g_TTLA)].max
  set :n_combo,      n
  sleep 1
end
live_loop :kick, sync: :met1 do
  use_debug false; use_cue_logging false
  with_swing -0.08, 2 do
    sample :bd_tek, rate: 0.8, sustain: 0, release: 0.3, amp: get(:presence_amp) if pattern("x---x---x---x---") and get(:g_presence_pillar) == 1
  end
  sleep 0.25
end
live_loop :kick_soft, sync: :met1 do
  use_debug false; use_cue_logging false
  with_swing -0.08, 2 do
    sample :bd_tek, rate: 0.7, sustain: 0, release: 0.2, amp: get(:presence_amp) * 0.25 if pattern("---------------x---------x------") and get(:g_presence_pillar) == 1
  end
  sleep 0.25
end
live_loop :hh, sync: :met1 do
  use_debug false; use_cue_logging false
  with_swing -0.08, 2 do
    sample :drum_cymbal_closed, sustain: 0, release: 0.15, amp: 0.8 * get(:influence_amp), rate: 1.1 if pattern("--x---x---x---x-") and get(:g_influence_pillar) == 1
  end
  sleep 0.25
end
live_loop :hh_short, sync: :met1 do
  use_debug false; use_cue_logging false
  with_swing -0.08, 2 do
    sample :drum_cymbal_pedal, sustain: 0, release: 0.05, pan: -0.4, amp: 0.3 * get(:influence_amp), start: 0.1 if pattern("--xx--x--xx--x-x") and get(:g_influence_pillar) == 1
  end
  sleep 0.25
end
with_fx :reverb, damp: 1, mix: 0.3 do
  live_loop :rimshot, sync: :met1 do
    use_debug false; use_cue_logging false
    with_swing -0.08, 2 do
      sample :sn_generic, amp: 0.4 * get(:influence_amp), sustain: 0, release: 0.10 if pattern("----x-------x---") and get(:g_influence_pillar) == 1
    end
    sleep 0.25
  end
end
with_fx :reverb, room: 1, mix: 0.5 do
  with_fx :ping_pong, phase: 0.75, mix: 0.3 do
    with_fx :echo, phase: 0.375, decay: 4, mix: 0.25 do
      live_loop :strategic_thinking, sync: :met1 do
        use_debug false; use_cue_logging false
        if get(:g_strategic_pillar) == 1
          combo = get(:strategic_combo)
          combo = [] if combo.nil?
          words = [:strategic] + combo
          notes = words.map { |w| WORD_NOTES[w] }.compact.uniq.sort
          real_count = notes.length
          if notes.length == 1
            r = notes[0]
            notes = [r, r + 7, r + 12, r + 19]
          elsif notes.length < 4
            notes = (notes + [notes.first + 12]).uniq.sort
          end
          fade = get(:fade); fade = 1.0 if fade.nil?
          if combo.empty?
            fade = [fade - 0.34, 0].max
            set :fade, fade
          elsif fade < 1.0
            fade = 1.0; set :fade, 1.0
          end
          use_synth :blade
          use_synth_defaults amp: 0.5 * get(:strategic_amp) * fade,
            cutoff: 100 + [notes.length * 4, 27].min, release: 0.5, attack: 0.01
          up = (0...notes.length).to_a
          ladder = up + up.reverse[1...-1]
          ladder = [0] if ladder.empty?
          if real_count >= 4 || real_count == 1 || combo.include?(:strategic)
            steps = 16; step = 0.25
          else
            steps = 8;  step = 0.5
          end
          steps.times do
            idx = ladder.tick(:st_i)
            nte = notes[idx]
            oct = idx >= (notes.length / 2.0) ? 7 : 0
            play nte + oct - 12, pan: rrand(-0.4, 0.4)
            sleep step
          end
        else
          sleep 1
        end
      end
    end
  end
end
with_fx :reverb, room: 0.6, mix: 0.2 do
  live_loop :subbass, sync: :met1 do
    use_debug false; use_cue_logging false
    if get(:g_TTLA) == 1
      a = get(:TTLA_amp)
      combo = get(:strategic_combo)
      combo = [:servant] if combo.nil? || combo.empty?
      n = [combo.length, 5].min
      root = {1 => :f1, 2 => :c2, 3 => :ab1, 4 => :bb1, 5 => :f2}[n]
      play root, synth: :sine, attack: 0.005, sustain: 4.1, release: 0.3, amp: 0.9 * a
      play (note(root) + 12), synth: :tri, attack: 0.005, sustain: 4.1, release: 0.3, amp: 0.5 * a, cutoff: 75
      sleep 4
    else
      sleep 4
    end
  end
end
with_fx :reverb do
  live_loop :vinylNoise, sync: :met1 do
    use_debug false; use_cue_logging false
    sample :vinyl_hiss, amp: 0.08
    sleep sample_duration(:vinyl_hiss)
  end
end
