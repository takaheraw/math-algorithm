MOD = 10**9 + 7

# 高速べき乗（繰り返し二乗法）
def power_mod(base, exp, mod)
  result = 1
  base = base % mod
  
  while exp > 0
    if exp % 2 == 1
      result = (result * base) % mod
    end
    exp = exp >> 1
    base = (base * base) % mod
  end
  
  result
end

# 入力を読み取り
n, k = gets.split.map(&:to_i)

# k^n mod (10^9 + 7) を計算
answer = power_mod(k, n, MOD)

# 結果を出力
puts answer
