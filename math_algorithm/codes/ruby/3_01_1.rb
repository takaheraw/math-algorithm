# 2以上の整数 N に対し、N が素数であれば true、素数でなければ false を返す関数
def is_prime(n)
  (2..n - 1).each do |i|
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
