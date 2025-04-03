# Read input
n, q = gets.split.map(&:to_i)

# Initialize array A with all elements as 2^31-1
a = Array.new(n, 2**31 - 1)

# Process queries
q.times do
  query = gets.split.map(&:to_i)
  
  case query[0]
  when 0  # update(s, t, x)
    s, t, x = query[1], query[2], query[3]
    (s..t).each do |i|
      a[i] = x
    end
  when 1  # find(i)
    i = query[1]
    puts a[i]
  end
end
