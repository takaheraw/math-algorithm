n = gets.to_i
a = gets.split.map(&:to_i)
m = gets.to_i
b = gets.split.map(&:to_i)

i = 0
j = 0

while i < n && j < m
  if a[i] == b[j]
    j += 1
  end
  i += 1
end

puts j == m ? 1 : 0
