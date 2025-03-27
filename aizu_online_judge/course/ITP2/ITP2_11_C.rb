n = gets.to_i
k, *elements = gets.split.map(&:to_i)

subsets = []

(0...(1 << k)).each do |i|
  subset = []
  value = 0

  k.times do |j|
    if i & (1 << j) != 0
      subset << elements[j]
      value |= (1 << elements[j])
    end
  end

  subsets << [value, subset.sort]
end

subsets.sort_by! { |value, _| value }

subsets.each do |value, subset|
  print "#{value}:"
  puts subset.empty? ? '' : " #{subset.join(' ')}"
end
