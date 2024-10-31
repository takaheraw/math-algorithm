def is_prime(n)
  return false if n <= 1

  (2..Math.sqrt(n)).each do |i|
    return false if n % i == 0
  end

  true
end

n = gets.chomp.to_i
a = []

(2..n).each do |i|
  a << i if is_prime(i)
end

puts a.join(' ')
