def prime_factors(n)
  factors = []
  divisor = 2

  while n > 1
    while n % divisor == 0
      factors << divisor
      n /= divisor
    end
    divisor += 1
  end

  factors
end

n = gets.chomp.to_i

puts "素因数分解結果: #{prime_factors(n)}"
