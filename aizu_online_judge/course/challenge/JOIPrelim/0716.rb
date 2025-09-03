input = gets.chomp.split.map(&:to_i)
s, a, b = input

if a >= s
  puts 250
else
  shortage = s - a
  
  additional_needed = (shortage + b - 1) / b  # 整数除算での切り上げ
  
  total_cost = 250 + additional_needed * 100
  
  puts total_cost
end
