use_bpm 75
use_synth :pretty_bell

vol = ring(0.7, 1)
r0 = [0.9, 0.5, 0.9, 0.5, 0.9, 0.5, 0.9, 0.5, 0.9, 0.5, 0.9, 0.5, 0.6]
r1 = [0.7, 0.8, 0.6, 0.5, 0.6, 0.8]
r2 = [0.6, 0.7, 0.5, 0.6, 0.6]
r3 = [0.5, 0.5, 0.5, 0.7, 0.8]

define :debby do
  play_pattern_timed [[:c6, :a3], [:e4, :f4],[:f5, :d3],[:a3, :c4],
                      [:bb5, :g3], [:d4, :f4], [:e5, :c3],[:bb3, :d3],
                      [:a5, :g3], [:e4, :a4], [:gb3], [:c4, :d5], [:f3]], r0, amp: vol.tick
end

define :debby_0 do
  play_pattern_timed [[:f3, :g4, :e4], [:f4, :d4], [:e3, :c4, :e4],
                      [:f4, :d4], [:g4, :e4], [:c4, :f4, :a4]], r1
  
  play_pattern_timed [[:g4, :eb4], [:f4, :d4, :c4, :a3],
                      [:g4, :d4, :bb3], [:a4, :f4, :c4], [:bb4, :f4, :db4]], r2
  
  
  play_pattern_timed [[:a3, :c4, :f4], [:g4, :e4, :bb3],
                      [:c4, :a4, :f4], [:bb4, :d4, :g4], [:c4, :e4, :a4, :c5]], r3
end

chords_list = [
  chord(:a3, :minor),      # Am
  chord(:bb3, :major),     # Bb
  chord(:c4, :dom7),       # C7
  chord(:d4, :minor7),     # Dm7
  chord(:e4, :m7b5),       # Em7b5
  chord(:f4, :major7),     # Fmaj7
  chord(:g4, :minor7),     # Gm7
  chord(:a4, :minor7),     # Am7
  chord(:bb4, :major7)     # Bbmaj7
]

durations = [0.9, 0.7, 0.5, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]

define :jazzy_? do
  use_synth :sine
  chords_list.zip(durations).each do |ch, dur|
    play ch, release: dur, amp: 0.9
    sleep dur
  end
end

define :debby_1 do
  play_pattern_timed [[:c6, :a3], [:c4, :f4],[:f5, :d3],[:a3, :f4],
                      [:bb5, :g3], [:d4, :bb4], [:e5, :c3],[:bb3, :f4],
                      [:a5, :db3], [:e4, :a4], [:db3], [:a4, :e5], [:d3]], r0, amp: vol.tick
end

define :debby_2 do
  play_pattern_timed [[:f3, :g4, :e4], [:f4, :d4], [:c4, :e4],
                      [:f4, :d4], [:g4, :e4], [:db4, :a4]], r1
  
  play_pattern_timed [[:g4], [:f4, :d4],
                      [:g4, :e4], [:a4, :f4,], [:b4, :eb4]], r2
  
  play_pattern_timed [[:a4], [:e4, :ab3],
                      [:gb4, :a4], [:ab4, :b4], [:e4, :a4, :db5]], r3
end

define :debby_3 do
  r4 = [0.5, 0.6, 1, 0.5, 0.6, 1, 0.5, 0.6, 1, 0.5, 0.6, 0.6, 1]
  r5 = [0.9, 0.4, 0.5, 0.4, 0.7, 0.8, 0.4, 0.5, 0.4, 0.7, 0.6, 0.5, 0.5, 0.5, 0.5, 0.4, 0.3]
  r6 = [0.8, 0.7, 0.6, 0.5, 0.8, 0.6, 0.7, 0.6, 0.6, 0.7, 0.6, 0.8, 1]
  play_pattern_timed [[:a3], [:e4], [:e4, :a4], [:a3],
                      [:d4], [:e4, :b4], [:e3], [:a3], [:e4, :db5],
                      [:e3], [:a3], [:db4], [:e4]],r4
  play_pattern_timed [[:d5, :g3], [:a3, :f4], [:c3], [:bb3, :a4],
                      [:c5], [:d5, :a3], [:b3,:e3], [:d3], [:gb3, :e5],
                      [:c5], [:d5, :f4, :bb4], [:c5, :a4], [:g4, :bb4], [:a4, :db4],
                      [:f4],[:e4], [:e4, :g4]],r5
  play_pattern_timed [[:c4, :f4], [:bb4, :d5], [:e4, :c5], [:g4, :bb4], [:d4, :a4],
                      [:bb4], [:a4, :gb4], [:e4], [:f4, :c3, :a3], [:e4, :c4, :a4], [:f4, :f4, :c5],
                      [:f4, :a4, :e5], [:f5], [:d5, :a4, :b3], [:g3, :c4, :eb4]], r6
  
end




live_loop :main_song do
  debby
  debby_0
  jazzy_?
  debby_1
  debby_2
  debby_3
  jazzy_?
end