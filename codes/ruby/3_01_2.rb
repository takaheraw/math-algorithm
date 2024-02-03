# 2以上の整数 N に対し、N が素数であれば true、素数でなければ false を返す関数
def is_prime(n)
  limit = Math.sqrt(n).to_i
  (2..limit).each do |i|
    return false if n % i == 0
  end
  true
end

n = gets.to_i
if is_prime(n)
  puts 'prime'
else
  puts 'not prime'
end
