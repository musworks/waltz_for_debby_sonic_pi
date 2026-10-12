use_bpm 75
use_synth :sine

r0 = [
  0.9, 0.5, 0.9, 0.5, 0.9, 0.5, 0.9,
  0.5, 0.9, 0.5, 0.9, 0.5, 0.6
]

define :debby do
  play_pattern_timed [
    [:c6, :a3], [:e4, :f4], [:f5, :d3],
    [:a3, :c4], [:bb5, :g3], [:d4, :f4],
    [:e5, :c3], [:bb3, :d3], [:a5, :g3],
    [:e4, :a4], [:gb3], [:c4, :d5], [:f3]
  ], r0, amp: 0.65
end

r1 = [0.7, 0.8, 0.6, 0.5, 0.6, 0.8]
r2 = [0.6, 0.7, 0.5, 0.6, 0.6]
r3 = [0.6, 0.7, 0.6, 0.5, 0.6, 0.9]

define :debby_0 do
  play_pattern_timed [
    [:f3, :g4, :e4], [:f4, :d4], [:e3, :c4, :e4],
    [:f4, :d4], [:g4, :e4], [:c4, :f4, :a4]
  ], r1, amp: 0.52
  
  play_pattern_timed [
    [:g4, :eb4], [:f4, :d4, :c4, :a3],
    [:g4, :d4, :bb3], [:a4, :f4, :c4],
    [:bb4, :f4, :db4]
  ], r2, amp: 0.48
  
  play_pattern_timed [
    [:g3, :bb3, :f4],[:a3, :c4, :f4], [:g4, :e4, :bb3],
    [:c4, :a4, :f4], [:bb4, :d4, :g4],
    [:c4, :e4, :a4, :c5]
  ], r3, amp: 0.55
end

define :debby_1 do
  play_pattern_timed [
    [:c6, :a3], [:c4, :f4], [:f5, :d3],
    [:a3, :f4], [:bb5, :g3], [:d4, :bb4],
    [:e5, :c3], [:bb3, :f4], [:a5, :db3],
    [:e4, :a4], [:db3], [:a4, :e5], [:d3]
  ], r0, amp: 0.58
end

define :debby_2 do
  play_pattern_timed [
    [:f3, :g4, :e4], [:f4, :d4], [:c4, :e4],
    [:f4, :d4], [:g4, :e4], [:db4, :a4]
  ], r1, amp: 0.52
  
  play_pattern_timed [
    [:g4], [:f4, :d4], [:g4, :e4],
    [:a4, :f4], [:b4, :eb4]
  ], r2, amp: 0.48
  
  play_pattern_timed [
    [:a3, :eb4], [:a4], [:e4, :ab3], [:gb4, :a4],
    [:ab4, :b4], [:e4, :a4, :db5]
  ], r3, amp: 0.55
end

r4 = [0.5, 0.6, 1, 0.5, 0.6, 1, 0.5, 0.6, 1, 0.5, 0.6, 0.6, 1]

r5 = [
  0.9, 0.4, 0.5, 0.4, 0.7, 0.8,
  0.4, 0.5, 0.4, 0.7, 0.6, 0.5,
  0.5, 0.5, 0.5, 0.4, 0.3
]

r6 = [
  0.8, 0.7, 0.6, 0.5, 0.7, 0.6, 0.7,
  0.5, 0.5, 0.7, 0.5, 0.7, 0.5, 0.6, 0.8
]

define :debby_3 do
  play_pattern_timed [
    [:a3], [:e4], [:e4, :a4], [:a3],
    [:d4], [:e4, :b4], [:e3], [:a3],
    [:e4, :db5], [:e3], [:a3], [:db4], [:e4]
  ], r4, amp: 0.50
  
  play_pattern_timed [
    [:d5, :g3], [:a3, :f4], [:c3], [:bb3, :a4],
    [:c5], [:d5, :a3], [:b3, :e3], [:d3],
    [:gb3, :e5], [:c5], [:d5, :f4, :bb4],
    [:c5, :a4], [:g4, :bb4], [:a4, :db4],
    [:f4], [:e4], [:e4, :g4]
  ], r5, amp: 0.56
  
  play_pattern_timed [
    [:c4, :f4], [:bb4, :d5], [:e4, :c5],
    [:g4, :bb4], [:d4, :a4], [:bb4],
    [:a4, :gb4], [:e4], [:f4, :c3, :a3],
    [:e4, :c4, :a4], [:f4, :f4, :c5],
    [:f4, :a4, :e5], [:f5], [:d5, :a4, :b3],
    [:g3, :c4, :eb4]
  ], r6, amp: 0.60
end

chords_list = [
  chord(:a3, :minor),
  chord(:bb3, :major),
  chord(:c4, :dom7),
  chord(:d4, :minor7),
  chord(:e4, :m7b5),
  chord(:f4, :major7),
  chord(:g4, :minor7),
  chord(:a4, :minor7),
  chord(:bb4, :major7)
]

durations = [
  0.9, 0.8, 0.7, 0.6, 0.4,
  0.5, 0.6, 0.8, 0.9
]

define :jazzy do
  chords_list.zip(durations).each do |ch, dur|
    play ch, release: dur, amp: 0.72
    sleep dur
  end
end

define :debby_4 do
  play_pattern_timed [
    [:f3, :g4, :e4], [:f4, :d4], [:e3, :c4, :e4],
    [:f4, :d4], [:g4, :e4], [:c4, :f4, :a4]
  ], r1, amp: 0.52
  
  play_pattern_timed [
    [:g4, :eb4], [:f4, :d4, :c4, :a3],
    [:g4, :d4, :bb3], [:a4, :f4, :c4],
    [:bb4, :f4, :db4]
  ], r2, amp: 0.48
  
  play_pattern_timed [
    [:a3, :c4, :f4], [:g4, :eb4, :bb3],
    [:c4, :a4, :e4], [:bb4, :d4, :f4],
    [:c4, :e4, :a4, :c5], [:d4, :g4, :a4, :d5]
  ], [0.6, 0.5, 0.6, 0.7, 0.4, 3.2], amp: 0.55
end

define :debby_5 do #outro
  play_pattern_timed [
    [:e5, :db5], [:d5, :b4], [:e5, :db5],
    [:d5, :b4], [:e5], [:a4, :c5],
  ],[0.7, 0.5, 0.6, 0.5, 0.7, 1.6], amp: 0.55
  
  play_pattern_timed [
    [:c5, :f4], [:f4, :bb4], [:c5, :f4],
    [:f4, :bb4], [:c5, :g4], [:a4, :f4],
  ],[0.7, 0.5, 0.6, 0.5, 0.7, 1.6], amp: 0.55
  
  play_pattern_timed [
    [:g5, :db5], [:f5, :db5], [:e5, :g5],
    [:d5, :f5], [:c5, :g5], [:d4, :f5],
    [:e5, :g5], [:f5, :db5], [:d5, :f5, :a5, :d6]
  ],[0.6, 0.6, 0.7, 0.6, 0.7, 0.6, 0.7, 0.6, 1.6], amp: 0.55
  
  play_chord [:c3, :e3, :f4, :ab4, :b4, :e5], sustain: 2, release: 2
  sleep 4
  
  play_pattern_timed [:db3, :gb3, :bb3, :eb4, :f4, :ab4, :f5], [0.15, 0.15, 0.1, 0.1, 0.1, 0.1, 1.6], amp: 0.5
end


define :a_anchor do |cycles=11|
  use_synth :sine
  
  cycles.times do
    play :a2, sustain: 3.5, release: 1.5, amp: 0.16
    sleep 5
  end
end

with_fx :reverb, room: 0.55, mix: 0.2 do
  with_fx :lpf, cutoff: 80 do
    debby
    sleep 0.5
    debby_0
    sleep 1
    in_thread do
      a_anchor 11
    end
    jazzy
    sleep 0.5
    debby_1
    sleep 0.5
    with_transpose 12 do
      debby_2
    end
    sleep 0.5
    with_transpose 12 do
      debby_3
      sleep 0.5
      jazzy
      sleep 0.5
    end
    debby
    debby_4
    sleep 2
    sleep 1
    debby_5
  end
end



