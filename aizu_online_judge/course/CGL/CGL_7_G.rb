#!/usr/bin/env ruby
x1, y1, r1, x2, y2, r2 = gets.split.map(&:to_i)

dx = x2 - x1
dy = y2 - y1
d = Math.hypot(dx, dy)
exit if d == 0.0

theta = Math.atan2(dy, dx)
points = []

# direct (external) tangents: uses (r1 - r2)/d
# transverse (internal) tangents: uses (r1 + r2)/d
[[r1 - r2, :direct], [r1 + r2, :transverse]].each do |cr, _|
  val = cr / d
  next if val.abs > 1.0
  alpha = Math.acos(val)
  [theta + alpha, theta - alpha].each do |dir|
    px = x1 + r1 * Math.cos(dir)
    py = y1 + r1 * Math.sin(dir)
    points << [px, py]
  end
end

# Remove duplicates within a small epsilon, and sort by x then y
eps = 1e-8
points.sort_by! { |px, py| [px, py] }
unique = []
points.each do |px, py|
  if unique.empty? || (px - unique[-1][0]).abs > eps || (py - unique[-1][1]).abs > eps
    unique << [px, py]
  end
end

# Print results
unique.each do |px, py|
  puts format("%.10f %.10f", px, py)
end
