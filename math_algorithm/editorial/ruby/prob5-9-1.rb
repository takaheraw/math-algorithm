# 入力
n = gets.to_i
answer = 0

# 10000 円札を支払う
answer += n / 10_000
n %= 10_000

# 5000 円札を支払う
answer += n / 5_000
n %= 5_000

# 1000 円札を支払う
answer += n / 1_000
n %= 1_000

# 出力
puts answer
