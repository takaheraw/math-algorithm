MOD = 10**9 + 7

def mod_pow(base, exp, mod)
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

def mod_inverse(a, mod)
  mod_pow(a, mod - 2, mod)
end

def combination(n, r)
  return 0 if r > n || r < 0
  return 1 if r == 0 || r == n
  
  numerator = 1
  denominator = 1
  
  r = [r, n - r].min
  
  (0...r).each do |i|
    numerator = (numerator * (n - i)) % MOD
    denominator = (denominator * (i + 1)) % MOD
  end
  
  (numerator * mod_inverse(denominator, MOD)) % MOD
end

n, k = gets.split.map(&:to_i)

if n < k
  puts 0
else
  puts combination(n - 1, k - 1)
end
