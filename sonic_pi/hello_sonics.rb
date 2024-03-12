# Welcome to Sonic Pi

play :Cs2
sleep 0.05
play :Gs3
sleep 0.05
play :Ab2
sleep 0.05

live_loop :flibble do
  sample :ambi_choir, rate: 0.6
  # sample :bd_haus, rate: 1
  sleep 0.5
end

live_loop :guit do
  
  with_fx :echo, mix: 0.3, phase: 0.25 do
    
    sample :guit_e_fifths, rate: 0.5
  end
  sample :guit_e_slide, rate: 0.7
  sleep 8
end

live_loop :boom do
  
  with_fx :reverb, room: 1 do
    
    sample :bd_boom, amp: 10, rate: 1
  end
  
  sleep 8
  
end