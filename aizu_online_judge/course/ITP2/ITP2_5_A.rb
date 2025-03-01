n = gets.to_i
points = Array.new(n) { gets.split.map(&:to_i) }

points.sort! do |a, b|
  if a[0] == b[0]
    a[1] <=> b[1]
  else
    a[0] <=> b[0]
  end
end

points.each { |x, y| puts "#{x} #{y}" }
