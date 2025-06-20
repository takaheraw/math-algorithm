MOD = 10**9 + 7

def mod_pow(base, exp, mod)
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

def mod_inverse(a, mod)
  mod_pow(a, mod - 2, mod)
end

def stirling_second_kind(n, k)
  return 0 if k > n
  return 1 if k == 0 && n == 0
  return 0 if k == 0 || n == 0
  
  fact = Array.new(k + 1, 1)
  (1..k).each { |i| fact[i] = (fact[i-1] * i) % MOD }
  
  inv_fact = Array.new(k + 1)
  inv_fact[k] = mod_inverse(fact[k], MOD)
  (k-1).downto(0) { |i| inv_fact[i] = (inv_fact[i+1] * (i+1)) % MOD }
  
  sum = 0
  (0..k).each do |i|
    binom = (fact[k] * inv_fact[i]) % MOD
    binom = (binom * inv_fact[k-i]) % MOD
    
    power = mod_pow(i, n, MOD)
    
    term = (binom * power) % MOD
    if (k - i).odd?
      term = (MOD - term) % MOD
    end
    
    sum = (sum + term) % MOD
  end
  
  result = (sum * inv_fact[k]) % MOD
  result
end

n, k = gets.split.map(&:to_i)

puts stirling_second_kind(n, k)
