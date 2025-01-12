H = gets.to_i
keys = gets.split.map(&:to_i)

(1..H).each do |i|
  key = keys[i - 1]
  parent_key = i > 1 ? keys[(i / 2) - 1] : nil
  left_key = (2 * i <= H) ? keys[(2 * i) - 1] : nil
  right_key = (2 * i + 1 <= H) ? keys[(2 * i)] : nil

  output = "node #{i}: key = #{key}, "
  output += "parent key = #{parent_key}, " if parent_key
  output += "left key = #{left_key}, " if left_key
  output += "right key = #{right_key}, " if right_key

  puts output
end
