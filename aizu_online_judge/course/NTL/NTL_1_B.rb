MOD = 1_000_000_007

def power_mod(base, exp, mod)
  result = 1
  base = base % mod
  
  while exp > 0
    if exp % 2 == 1
      result = (result * base) % mod
    end
    exp = exp >> 1  # exp を2で割る（ビットシフト）
    base = (base * base) % mod
  end
  
  result
end

# 入力を読み込み
m, n = gets.split.map(&:to_i)

# m^n (mod 1,000,000,007) を計算して出力
puts power_mod(m, n, MOD)
