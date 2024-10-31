n = gets.chomp.to_i
answer = ''

while n >= 1
  if n.even?
    answer = '0' + answer
  elsif n.odd?
    answer = '1' + answer
  end
  n /= 2
end

puts answer
