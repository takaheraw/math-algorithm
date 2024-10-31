print '金額を入力してください: '
n = gets.chomp.to_i

answer = 0

# 10000 円以上の間、10000 円札を使い続ける
while n >= 10_000
  n -= 10_000
  answer += 1
end

# 5000 円以上の間、5000 円札を使い続ける
while n >= 5000
  n -= 5000
  answer += 1
end

# 残った金額を 1000 円札で支払う
while n >= 1000
  n -= 1000
  answer += 1
end

puts answer
