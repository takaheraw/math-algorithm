def euler_phi(n)
  result = n
  
  i = 2
  while i * i <= n
    if n % i == 0
      while n % i == 0
        n /= i
      end
      result -= result / i
    end
    i += 1
  end
  
  if n > 1
    result -= result / n
  end
  
  result
end

n = gets.to_i

puts euler_phi(n)
