# Welcome to Sonic Pi

##| live_loop :vocals do
##|   sample :ambi_choir, amp: 0.3, rate: 0.6, attack: 0.2, release: 1.5
##|   sleep 0.5
##| end

in_thread do
  live_loop :diff_rand_riff do
    use_synth :dsaw
    use_random_seed 20
    notes = (scale :e4, :major_pentatonic, num_octaves: 2).shuffle
    16.times do
      play notes.tick, release: 0.2, cutoff: 90 if one_in(2)
      sleep 0.125
    end
  end
  
  live_loop :riff do
    synth :blade, note: :e4, release: 4, cutoff: 100, amp: 0.3
    ##| use_synth :dsaw
    use_synth :sc808_clap
    use_random_seed 40
    ##| notes = (scale :e3, :major_pentatonic, num_octaves: 2).shuffle.take(8)
    notes = (ring :e3, :e3, :r, :g3, :r, :r, :a3, :a1)
    8.times do
      play notes.tick, release: rand(0.5), cutoff: rrand(60, 130) if one_in(2)
      sleep 0.125
    end
  end
end

live_loop :drums do
  use_random_seed 500
  16.times do
    sample :bd_haus, rate: 2, cutoff: 100 if rand < 0.35
    sleep 0.125
  end
end

live_loop :bd do
  sample :bd_haus, cutoff: 100, amp: 4
  sleep 0.5
end