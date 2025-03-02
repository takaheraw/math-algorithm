n = gets.to_i
items = Array.new(n) do
  v, w, t, d, s = gets.split
  [v.to_i, w.to_i, t, d.to_i, s]
end

items.sort! do |a, b|
  if a[0] != b[0]
    a[0] <=> b[0]
  elsif a[1] != b[1]
    a[1] <=> b[1]
  elsif a[2] != b[2]
    a[2] <=> b[2]
  elsif a[3] != b[3]
    a[3] <=> b[3]
  else
    a[4] <=> b[4]
  end
end

items.each { |item| puts item.join(" ") }
