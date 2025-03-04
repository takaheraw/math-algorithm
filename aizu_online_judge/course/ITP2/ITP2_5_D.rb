n = gets.to_i
(1..n).to_a.permutation do |perm|
  puts perm.join(" ")
end
