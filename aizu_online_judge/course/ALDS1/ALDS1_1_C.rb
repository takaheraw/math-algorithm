def prime?(num)
  return false if num < 2
  (2..Math.sqrt(num).to_i).each do |i|
    return false if num % i == 0
  end
  true
end

def count_primes(numbers)
  numbers.count { |num| prime?(num) }
end

# 入力の読み取り
n = gets.to_i
numbers = Array.new(n) { gets.to_i }

# 素数のカウントと出力
puts count_primes(numbers)
