MOD = 1_000_000_007

a, b = gets.split.map(&:to_i)

answer = 1
b.times do
  answer = (answer * a) % MOD
end

puts answer
