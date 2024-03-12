# Welcome to Sonic Pi

live_loop :flibble do
  sample :ambi_choir, rate: 0.6
  sample :bd_haus, rate: 1
  sleep 0.5
end

live_loop :guit do
  
  with_fx :echo, mix: 0.3, phase: 0.25 do
    
    sample :guit_e_fifths, rate: 0.5
  end
  #sample :guit_e_slide, rate: 0.7
  sleep 8
end

live_loop :acid do
  cue :foo
  4.times do |i|
    use_random_seed 667
    16.times do
      use_synth :tb303
      play chord(:e2, :major7).choose, attack: 0, release: 0.1, cutoff: rrand_i(50, 90) + i * 10
      sleep 0.125
    end
  end
end

# DRUMS
live_loop :drums do
  sample :bd_fat, amp: 5
  sleep 0.5
end

live_loop :boom do
  with_fx :reverb, room: 1 do
    sample :bd_boom, amp: 3, rate: 1
  end
  sleep 4
end