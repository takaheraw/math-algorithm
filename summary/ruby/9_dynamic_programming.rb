room_count = 5
pattern1 = [2, 4, 1, 3]
pattern2 = [5, 3, 7]

dp = Array.new(room_count + 1)
dp[1] = 0
dp[2] = pattern1[0]
(3..room_count).each do |i|
  dp[i] = [dp[i - 1] + pattern1[i - 2], dp[i - 2] + pattern2[i - 3]].min
end

puts dp[room_count]
