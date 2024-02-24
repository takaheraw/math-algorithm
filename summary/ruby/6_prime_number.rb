def is_prime(n)
  return false if n <= 1

  limit = Math.sqrt(n)
  (2..limit).each do |i|
    return false if n % i == 0
  end

  true
end

arr = gets.chomp.split.map(&:to_i)
arr.each do |v|
  if is_prime(v)
    puts "#{v} は素数です。"
  else
    puts "#{v} は素数ではありません。"
  end
end
