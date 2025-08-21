n, m, k = gets.split.map(&:to_i)
bells = gets.split.map(&:to_i)  # 鐘の位置
houses = gets.split.map(&:to_i) # 家の位置

houses.each do |house_pos|
  max_sound = 0
  
  bells.each do |bell_pos|
    distance = (house_pos - bell_pos).abs
    sound_strength = [k - distance, 0].max
    max_sound = [max_sound, sound_strength].max
  end
  
  puts max_sound
end
