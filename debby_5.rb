use_bpm 75
use_debug false
set_volume! 0.9


define :play_phrase do |notes, timings, amp=0.5, release=0.9|
  play_pattern_timed notes, timings, amp: amp, release: release
end

motif_a_times = [0.9, 0.5, 0.9, 0.5, 0.9, 0.5, 0.9,
                 0.5, 0.9, 0.5, 0.9, 0.5, 0.7]

define :debby_a do |amp=0.62|
  play_phrase [
    [:c6, :a3], [:e4, :f4], [:f5, :d3], [:a3, :c4],
    [:bb5, :g3], [:d4, :f4], [:e5, :c3], [:bb3, :d3],
    [:a5, :g3], [:e4, :a4], [:gb3], [:c4, :d5], [:f3]
  ], motif_a_times, amp
end

phrase_1_times = [0.6, 0.7, 0.5, 0.4, 0.6, 0.8]
phrase_2_times = [0.5, 0.5, 0.4, 0.5, 0.9]
phrase_3_times = [0.5, 0.5, 0.4, 0.6, 0.8]

define :debby_b do |amp=0.5|
  play_phrase [
    [:f3, :g4, :e4], [:f4, :d4], [:e3, :c4, :e4],
    [:f4, :d4], [:g4, :e4], [:c4, :f4, :a4]
  ], phrase_1_times, amp
  
  play_phrase [
    [:g4, :eb4], [:f4, :d4, :c4, :a3], [:g4, :d4, :bb3],
    [:a4, :f4, :c4], [:bb4, :f4, :db4]
  ], phrase_2_times, amp * 0.92
  
  play_phrase [
    [:a3, :c4, :f4], [:g4, :e4, :bb3],
    [:c4, :a4, :f4], [:bb4, :d4, :g4], [:c4, :e4, :a4, :c5]
  ], phrase_3_times, amp * 1.02
end

define :debby_b_variation do |amp=0.5|
  play_phrase [
    [:f3, :g4, :e4], [:f4, :d4], [:c4, :e4],
    [:f4, :d4], [:g4, :e4], [:db4, :a4]
  ], phrase_1_times, amp
  
  play_phrase [
    [:g4], [:f4, :d4], [:g4, :e4],
    [:a4, :f4], [:b4, :eb4]
  ], phrase_2_times, amp * 0.92
  
  play_phrase [
    [:a4], [:e4, :ab3], [:gb4, :a4],
    [:ab4, :b4], [:e4, :a4, :db5]
  ], phrase_3_times, amp * 1.02
end

define :debby_a_variation do
  play_phrase [
    [:c6, :a3], [:c4, :f4], [:f5, :d3], [:a3, :f4],
    [:bb5, :g3], [:d4, :bb4], [:e5, :c3], [:bb3, :f4],
    [:a5, :db3], [:e4, :a4], [:db3], [:a4, :e5], [:d3]
  ], motif_a_times, 0.56
end

define :debby_c do
  play_phrase [
    [:a3], [:e4], [:e4, :a4], [:a3], [:d4], [:e4, :b4],
    [:e3], [:a3], [:e4, :db5], [:e3], [:a3], [:db4], [:e4]
  ], [0.4, 0.5, 0.8, 0.4, 0.5, 0.8, 0.4, 0.5, 0.8, 0.4, 0.5, 0.6, 1], 0.48
  
  play_phrase [
    [:d5, :g3], [:a3, :f4], [:c3], [:bb3, :a4], [:c5],
    [:d5, :a3], [:b3, :e3], [:d3], [:gb3, :e5], [:c5],
    [:d5, :f4, :bb4], [:c5, :a4], [:g4, :bb4], [:a4, :db4],
    [:f4], [:e4], [:e4, :g4]
  ], [0.9, 0.4, 0.5, 0.4, 0.7, 0.8, 0.4, 0.5, 0.4, 0.7,
      0.6, 0.5, 0.5, 0.5, 0.5, 0.4, 0.3], 0.52
  
  play_phrase [
    [:c4, :f4], [:bb4, :d5], [:e4, :c5], [:g4, :bb4], [:d4, :a4],
    [:bb4], [:a4, :gb4], [:e4], [:f4, :c3, :a3], [:e4, :c4, :a4],
    [:f4, :f4, :c5], [:f4, :a4, :e5], [:f5], [:d5, :a4, :b3],
    [:g3, :c4, :eb4]
  ], [0.8, 0.7, 0.6, 0.5, 0.7, 0.6, 0.7, 0.5, 0.5, 0.7,
      0.5, 0.7, 0.5, 0.6, 0.8], 0.56
end

chord_progression = [
  chord(:a3, :minor), chord(:bb3, :major), chord(:c4, :dom7),
  chord(:d4, :minor), chord(:e4, :m7b5), chord(:f4, :major7),
  chord(:g4, :minor7), chord(:a4, :minor7), chord(:bb4, :major7)
]

define :jazzy_bed do |amp=0.62|
  chord_progression.each_with_index do |ch, i|
    dur = [0.7, 0.6, 0.5, 0.4, 0.4, 0.5, 0.6, 0.7, 0.9][i]
    play ch, amp: amp, sustain: dur * 0.35, release: dur * 0.65
    sleep dur
  end
end

define :debby_d do
  play_phrase [
    [:f3, :g4, :e4], [:f4, :d4], [:e3, :c4, :e4],
    [:f4, :d4], [:g4, :e4], [:c4, :f4, :a4]
  ], phrase_1_times, 0.5
  play_phrase [
    [:g4, :eb4], [:f4, :d4, :c4, :a3], [:g4, :d4, :bb3],
    [:a4, :f4, :c4], [:bb4, :f4, :db4]
  ], phrase_2_times, 0.46
  play_phrase [
    [:a3, :c4, :f4], [:g4, :eb4, :bb3], [:c4, :a4, :e4],
    [:bb4, :d4, :f4], [:c4, :e4, :a4, :c5], [:d4, :g4, :a4, :d5]
  ], [0.6, 0.5, 0.5, 0.6, 0.8, 1.6], 0.52
end

define :outro do
  phrase = [0.7, 0.5, 0.6, 0.5, 0.7, 1.6]
  play_phrase [[:e5, :db5], [:d5, :b4], [:e5, :db5], [:d5, :b4], [:e5], [:a4, :c5]], phrase, 0.5
  play_phrase [[:c5, :f4], [:f4, :bb4], [:c5, :f4], [:f4, :bb4], [:c5, :g4], [:a4, :f4]], phrase, 0.5
  play_phrase [
    [:g5, :db5], [:f5, :db5], [:e5, :g5], [:d5, :f5], [:c5, :g5],
    [:d4, :f5], [:e5, :g5], [:f5, :db5], [:d5, :f5, :a5, :d6]
  ], [0.6, 0.6, 0.7, 0.6, 0.7, 0.6, 0.7, 0.6, 1.6], 0.5
  
  play_chord [:c3, :e3, :f4, :ab4, :b4, :e5], sustain: 1.5, release: 2.5, amp: 0.48
  sleep 4
  play_phrase [:db3, :gb3, :bb3, :eb4, :f4, :ab4, :f5],
    [0.15, 0.15, 0.15, 0.1, 0.1, 0.1, 3.2], 0.42
end


define :a_anchor do |cycles=11|
  cycles.times do
    play :a2, sustain: 3.5, release: 1.5, amp: 0.13
    sleep 6
  end
end

with_fx :reverb, room: 0.65, mix: 0.28 do

    use_synth :beep
    debby_a
    sleep 0.5
    debby_b
    sleep 0.6
    in_thread(name: :anchor) { a_anchor }
    jazzy_bed
    sleep 0.5
    use_synth :sine
    debby_a_variation
    sleep 0.5
    with_transpose 12 do
      debby_b_variation
    end
    sleep 0.6
    debby_c
    sleep 0.5
    jazzy_bed 0.58
    sleep 0.5
    use_synth :beep
    debby_a
    debby_d
    sleep 1.6
    sleep 0.8
    outro
end
