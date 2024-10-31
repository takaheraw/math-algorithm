args = ARGV.map(&:to_i)

puts "論理積 AND"
p args
puts args.all? { |x| x == 1 } ? 1 : 0

puts "論理和 OR"
p args
puts args.any? { |x| x == 1 } ? 1 : 0

puts "排他的論理和 XOR"
p args
puts args.inject(:+) % 2 == 1 ? 1 : 0

puts "否定論理積 NAND"
p args
puts args.all? { |x| x == 1 } ? 0 : 1

puts "否定論理和 NOR"
p args
puts args.any? { |x| x == 1 } ? 0 : 1

puts "否定 NOT"
p args
p args.map{|arg| if arg == 0; 1 elsif arg == 1; 0 end }

puts "否定論理積 NAND"
NAND = ->(x, y) { (x & y) == 0 ? 1 : 0 }
puts NAND[0, 0]
puts NAND[0, 1]
puts NAND[1, 0]
puts NAND[1, 1]

puts "否定 NOT"
NOT = ->(x) { NAND[x, x] }
puts NOT[0]
puts NOT[1]

puts "論理積 AND"
AND = ->(x, y) { NOT[NAND[x, y]] }
puts AND[0, 0]
puts AND[0, 1]
puts AND[1, 0]
puts AND[1, 1]

puts "論理和 OR"
OR = ->(x, y) { NAND[NOT[x], NOT[y]] }
puts OR[0, 0]
puts OR[0, 1]
puts OR[1, 0]
puts OR[1, 1]

puts "排他的論理和 XOR"
XOR = ->(x, y) { NAND[NAND[x, NOT[y]], NAND[NOT[x], y]] }
puts XOR[0, 0]
puts XOR[0, 1]
puts XOR[1, 0]
puts XOR[1, 1]
=begin
=end
