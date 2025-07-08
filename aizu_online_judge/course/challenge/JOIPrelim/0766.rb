n = gets.to_i
a = gets.split.map(&:to_i)

a.uniq.sort.each do |num|
  puts num
end
