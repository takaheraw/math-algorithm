a, b = gets.split.map(&:to_i) # a と b を入力する
puts a & b # a AND b の値を出力する
puts a | b # a OR b の値を出力する
puts a ^ b # a XOR b の値を出力する
puts [a, b].inject(:+).odd? ? 1 : 0 # XOR
puts [a, b].all? { |arg| arg == 1 } ? 0 : 1 # NAND
puts [a, b].any? { |arg| arg == 1 } ? 0 : 1 # NOR
