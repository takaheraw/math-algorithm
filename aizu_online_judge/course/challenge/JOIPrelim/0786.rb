input = gets.chomp.split.map(&:to_i)
n = input[0]
d = input[1]

heights = gets.chomp.split.map(&:to_i)

heights.sort!

used = Array.new(2 * n, false)

pairs_count = 0

(0...(2 * n)).each do |i|
  next if used[i]  # 既に使用済みの場合はスキップ
  
  ((i + 1)...(2 * n)).each do |j|
    next if used[j]  # 既に使用済みの場合はスキップ
    
    if heights[j] - heights[i] <= d
      used[i] = true
      used[j] = true
      pairs_count += 1
      break
    else
      break
    end
  end
end

if pairs_count == n
  puts "Yes"
else
  puts "No"
end
