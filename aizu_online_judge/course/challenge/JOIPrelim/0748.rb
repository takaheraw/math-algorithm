n = gets.to_i
a = gets.split.map(&:to_i).sort
b = gets.split.map(&:to_i).sort  
c = gets.split.map(&:to_i).sort
d = gets.split.map(&:to_i).sort

classes = [a, b, c, d]

all_heights = (a + b + c + d).uniq.sort

min_diff = Float::INFINITY

all_heights.each do |min_height|
  indices = []
  classes.each do |cls|
    idx = cls.bsearch_index { |h| h >= min_height }
    if idx.nil?
      break
    end
    indices << idx
  end
  
  next if indices.size != 4
  
  max_height = classes.each_with_index.map { |cls, i| cls[indices[i]] }.max
  
  diff = max_height - min_height
  min_diff = [min_diff, diff].min
end

puts min_diff
