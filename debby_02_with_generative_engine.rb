
use_bpm 75
use_synth :sine

r0 = [
  0.9, 0.5, 0.9, 0.5, 0.9, 0.5, 0.9,
  0.5, 0.9, 0.5, 0.6
]

r1 = [0.7, 0.8, 0.6, 0.5, 0.6, 0.8]
r2 = [0.6, 0.7, 0.5, 0.6, 0.6]
r3 = [0.5, 0.5, 0.5, 0.7, 0.8]

r4 = [0.5, 0.6, 1, 0.5, 0.6, 1, 0.5, 0.6, 1, 0.5, 0.6, 0.6, 1]

r5 = [
  0.9, 0.4, 0.5, 0.4, 0.7, 0.8,
  0.4, 0.5, 0.4, 0.7, 0.6, 0.5,
  0.5, 0.5, 0.5, 0.4, 0.3
]

r6 = [
  0.8, 0.7, 0.6, 0.5, 0.8, 0.6, 0.7,
  0.6, 0.6, 0.7, 0.6, 0.8, 1
]


define :play_phrase do |notes, times, base_amp|
  if notes.length != times.length
    puts "cek: #{notes.length} not vs #{times.length} durasi"
  end
  count = notes.length
  
  notes.each_with_index do |n, i|
    step = times[i % times.length]
    position = i.to_f / [count - 1, 1].max
    contour = 0.78 + 0.22 * Math.sin(Math::PI * position)
    
    pitches = Array(n).map { |x| note(x) }
    top = pitches.max
    
    pitches.each do |pitch|
      level = (pitch == top) ? 1 : 0.65
      play pitch, amp: base_amp * contour * level, release: step * 1.2
    end
    sleep step
  end
end


define :debby do |rhythm|
  notes = [
    [:c6, :a3], [:e4, :f4], [:f5, :d3],
    [:a3, :c4], [:bb5, :g3], [:d4, :f4],
    [:e5, :c3], [:bb3, :d3], [:a5, :g3],
    [:e4, :a4], [:gb3], [:c4, :d5], [:f3]
  ]
  
  play_phrase notes, rhythm, 0.58
end


define :debby_0 do |rhythm1, rhythm2, rhythm3|
  play_phrase [
    [:f3, :g4, :e4], [:f4, :d4], [:e3, :c4, :e4],
    [:f4, :d4], [:g4, :e4], [:c4, :f4, :a4]
  ], rhythm1, 0.52
  
  play_phrase [
    [:g4, :eb4], [:f4, :d4, :c4, :a3],
    [:g4, :d4, :bb3], [:a4, :f4, :c4],
    [:bb4, :f4, :db4]
  ], rhythm2, 0.48
  
  play_phrase [
    [:a3, :c4, :f4], [:g4, :e4, :bb3],
    [:c4, :a4, :f4], [:bb4, :d4, :g4],
    [:c4, :e4, :a4, :c5]
  ], rhythm3, 0.55
end


define :debby_1 do |rhythm|
  notes = [
    [:c6, :a3], [:c4, :f4], [:f5, :d3],
    [:a3, :f4], [:bb5, :g3], [:d4, :bb4],
    [:e5, :c3], [:bb3, :f4], [:a5, :db3],
    [:e4, :a4], [:db3], [:a4, :e5], [:d3]
  ]
  
  play_phrase notes, rhythm, 0.58
end


define :debby_2 do |rhythm1, rhythm2, rhythm3|
  play_phrase [
    [:f3, :g4, :e4], [:f4, :d4], [:c4, :e4],
    [:f4, :d4], [:g4, :e4], [:db4, :a4]
  ], rhythm1, 0.52
  
  play_phrase [
    [:g4], [:f4, :d4], [:g4, :e4],
    [:a4, :f4], [:b4, :eb4]
  ], rhythm2, 0.48
  
  play_phrase [
    [:a4], [:e4, :ab3], [:gb4, :a4],
    [:ab4, :b4], [:e4, :a4, :db5]
  ], rhythm3, 0.55
end


define :debby_3 do |rhythm1, rhythm2, rhythm3|
  play_phrase [
    [:a3], [:e4], [:e4, :a4], [:a3],
    [:d4], [:e4, :b4], [:e3], [:a3],
    [:e4, :db5], [:e3], [:a3], [:db4], [:e4]
  ], rhythm1, 0.50
  
  play_phrase [
    [:d5, :g3], [:a3, :f4], [:c3], [:bb3, :a4],
    [:c5], [:d5, :a3], [:b3, :e3], [:d3],
    [:gb3, :e5], [:c5], [:d5, :f4, :bb4],
    [:c5, :a4], [:g4, :bb4], [:a4, :db4],
    [:f4], [:e4], [:e4, :g4]
  ], rhythm2, 0.56
  
  play_phrase [
    [:c4, :f4], [:bb4, :d5], [:e4, :c5],
    [:g4, :bb4], [:d4, :a4], [:bb4],
    [:a4, :gb4], [:e4], [:f4, :c3, :a3],
    [:e4, :c4, :a4], [:f4, :f4, :c5],
    [:f4, :a4, :e5], [:f5], [:d5, :a4, :b3],
    [:g3, :c4, :eb4]
  ], rhythm3, 0.60
end


chords_list = [
  chord(:a3, :minor),    # Am
  chord(:bb3, :major),   # Bb
  chord(:c4, :dom7),     # C7
  chord(:d4, :minor7),   # Dm7
  chord(:e4, :m7b5),     # Em7b5
  chord(:f4, :major7),   # Fmaj7
  chord(:g4, :minor7),   # Gm7
  chord(:a4, :minor7),   # Am7
  chord(:bb4, :major7)   # Bbmaj7
]

chord_durations = [
  0.9, 0.7, 0.5, 0.4, 0.5,
  0.6, 0.7, 0.8, 0.9
]

define :jazzy_chords do |chords, durations|
  with_synth :sine do
    count = chords.length
    
    chords.each_with_index do |ch, i|
      dur = durations[i % durations.length]
      
      position = i.to_f / [count - 1, 1].max
      contour = 0.9 + 0.1 * Math.sin(Math::PI * position)
      
      play ch, release: dur, amp: 0.55 * contour
      sleep dur
    end
  end
end

define :debby_4 do #outro
  play_pattern_timed [
    [:e5, :db5], [:d5, :b4], [:e5, :db5],
    [:d5, :b4], [:e5], [:a4, :c5],
  ],[0.7, 0.5, 0.6, 0.5, 0.7, 1], amp: rrand(0.4, 0.55)
  
  play_pattern_timed [
    [:c5, :f4], [:f4, :bb4], [:c5, :f4],
    [:f4, :bb4], [:c5, :g4], [:a4, :f4],
  ],[0.7, 0.5, 0.6, 0.5, 0.7, 1], amp: rrand(0.4, 0.55)
  
  play_pattern_timed [
    [:g5, :db5], [:f5, :db5], [:e5, :g5],
    [:d5, :f5], [:c5, :g5], [:d4, :f5],
    [:e5, :g5], [:f5, :db5], [:d5, :f5, :a5, :d6]
  ],[0.6, 0.6, 0.7, 0.6, 0.7, 0.6, 0.7, 0.6, 1.6], amp: rrand(0.4, 0.55)
  
  play_chord [:c3, :e3, :f4, :ab4, :b4, :e5], sustain: 2, release: 2
  sleep 2.4
  
  play_pattern_timed [:db3, :gb3, :bb3, :eb4, :f4, :ab4, :f5], [0.15, 0.15, 0.1, 0.1, 0.1, 0.1, 1.6], amp: 0.5
end


debby(r0)
debby_0(r1, r2, r3)
jazzy_chords(chords_list, chord_durations)

debby_1(r0)
with_transpose 12 do
  debby_2(r1, r2, r3)
  debby_3(r4, r5, r6)
  jazzy_chords(chords_list, chord_durations)
end
debby(r0)
with_transpose 12 do
  debby_2(r1, r2, r3)
end
sleep 1.6
debby_4
