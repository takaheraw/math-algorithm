n = gets.to_i
a = gets.split.map(&:to_i)

count = Hash.new(0)
a.each { |num| count[num] += 1 }

min_count = count.values.min

result = count.select { |num, cnt| cnt == min_count }.keys.min

puts result
