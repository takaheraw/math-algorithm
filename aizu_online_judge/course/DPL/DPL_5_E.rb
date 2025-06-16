MOD = 10**9 + 7

# モジュラー逆元を求める関数（フェルマーの小定理を利用）
def mod_inverse(a, mod)
  pow(a, mod - 2, mod)
end

# モジュラー累乗を求める関数
def pow(base, exp, mod)
  result = 1
  base %= mod
  while exp > 0
    if exp.odd?
      result = (result * base) % mod
    end
    base = (base * base) % mod
    exp >>= 1
  end
  result
end

# 組み合わせ C(n, r) を mod で計算する関数
def combination(n, r, mod)
  return 0 if r > n || r < 0
  return 1 if r == 0 || r == n
  
  # C(n, r) = n! / (r! * (n-r)!)
  numerator = 1
  denominator = 1
  
  # 効率的な計算: C(n, r) = n * (n-1) * ... * (n-r+1) / (r * (r-1) * ... * 1)
  r.times do |i|
    numerator = (numerator * (n - i)) % mod
    denominator = (denominator * (i + 1)) % mod
  end
  
  (numerator * mod_inverse(denominator, mod)) % mod
end

# 入力を読み取り
n, k = gets.split.map(&:to_i)

# n > k の場合は不可能
if n > k
  puts 0
else
  # k個のボックスからn個を選ぶ組み合わせ
  result = combination(k, n, MOD)
  puts result
end
