n = gets.to_i
ages = gets.split.map(&:to_i)

min_age = ages.min
max_age = ages.max

ages.each do |age|
  max_diff = [age - min_age, max_age - age].max
  puts max_diff
end
