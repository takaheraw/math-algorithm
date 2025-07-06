A = gets.to_i
B = gets.to_i
C = gets.to_i

if A == B + C || B == A + C || C == A + B
  puts 1
else
  puts 0
end
