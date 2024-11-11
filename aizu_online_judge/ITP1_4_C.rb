# Ruby program to perform basic arithmetic operations

while true
  input = gets.split
  a = input[0].to_i
  op = input[1]
  b = input[2].to_i

  break if op == '?'

  result = case op
           when '+'
             a + b
           when '-'
             a - b
           when '*'
             a * b
           when '/'
             a / b
           end

  puts result
end
