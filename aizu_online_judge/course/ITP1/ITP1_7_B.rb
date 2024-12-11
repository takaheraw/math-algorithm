# Ruby program to count the number of ways to choose three integers with a given sum

while true
  n, x = gets.split.map(&:to_i)
  break if n == 0 && x == 0

  count = 0

  (1..n).to_a.combination(3) do |combo|
    count += 1 if combo.sum == x
  end

  puts count
end
