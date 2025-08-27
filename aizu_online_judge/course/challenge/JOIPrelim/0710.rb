n, m = gets.split.map(&:to_i)
boxes = gets.split.map(&:to_i)  # 宝箱に書かれた数値
keys = gets.split.map(&:to_i)   # 鍵に書かれた数値

key_set = keys.to_set

unlockable_count = 0

boxes.each do |box_value|
  if key_set.include?(box_value)
    unlockable_count += 1
  end
end

puts unlockable_count
