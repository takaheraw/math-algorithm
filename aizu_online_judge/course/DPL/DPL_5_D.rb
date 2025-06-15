MOD = 10**9 + 7

def mod_inverse(a, mod)
  # 拡張ユークリッドの互除法を使った逆元の計算
  def extended_gcd(a, b)
    return [a, 1, 0] if b == 0
    gcd, x1, y1 = extended_gcd(b, a % b)
    x = y1
    y = x1 - (a / b) * y1
    [gcd, x, y]
  end
  
  _, x, _ = extended_gcd(a, mod)
  (x % mod + mod) % mod
end

def mod_combination(n, r, mod)
  return 0 if r > n || r < 0
  return 1 if r == 0 || r == n
  
  numerator = 1
  denominator = 1
  
  r = n - r if r > n - r
  
  (0...r).each do |i|
    numerator = (numerator * (n - i)) % mod
    denominator = (denominator * (i + 1)) % mod
  end
  
  (numerator * mod_inverse(denominator, mod)) % mod
end

def solve(n, k)
  mod_combination(n + k - 1, k - 1, MOD)
end

n, k = gets.split.map(&:to_i)

puts solve(n, k)
