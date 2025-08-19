n = gets.to_i
sequence = gets.split.map(&:to_i)

(n - 1).times do
  new_sequence = []
  
  (sequence.length - 1).times do |i|
    new_sequence << (sequence[i] - sequence[i + 1]).abs
  end
  
  sequence = new_sequence
end

puts sequence[0]
