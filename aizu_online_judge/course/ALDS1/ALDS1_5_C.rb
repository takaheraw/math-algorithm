def koch_curve(n, p1, p2)
  return [p1, p2] if n == 0

  x1, y1 = p1
  x2, y2 = p2

  # Divide the line segment into three equal parts
  s = [(2 * x1 + x2) / 3.0, (2 * y1 + y2) / 3.0]
  t = [(x1 + 2 * x2) / 3.0, (y1 + 2 * y2) / 3.0]

  # Find the top of the equilateral triangle
  dx, dy = t[0] - s[0], t[1] - s[1]
  u = [s[0] + dx * Math.cos(Math::PI / 3) - dy * Math.sin(Math::PI / 3),
       s[1] + dx * Math.sin(Math::PI / 3) + dy * Math.cos(Math::PI / 3)]

  # Recursively generate Koch curves
  result = []
  result += koch_curve(n - 1, p1, s)
  result += koch_curve(n - 1, s, u)[1..] # Exclude the duplicate starting point
  result += koch_curve(n - 1, u, t)[1..] # Exclude the duplicate starting point
  result += koch_curve(n - 1, t, p2)[1..] # Exclude the duplicate starting point
  result
end

# Read input
n = gets.to_i

# Initial segment from (0, 0) to (100, 0)
points = koch_curve(n, [0.0, 0.0], [100.0, 0.0])

# Output points
points.each do |x, y|
  puts format('%.8f %.8f', x, y)
end
