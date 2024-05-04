def k_means(data, k)
  centroids = data.sample(k)
  clusters = {}

  loop do
    clusters = data.group_by do |point|
      centroids.min_by { |centroid| euclidean_distance(point, centroid) }
    end

    new_centroids = clusters.map do |_, points|
      points.transpose.map { |dimension| dimension.sum.to_f / dimension.size }
    end

    break if new_centroids == centroids

    centroids = new_centroids
  end

  return clusters
end

def euclidean_distance(point1, point2)
  sum_of_squares = point1.zip(point2).map { |a, b| (a - b) ** 2 }.sum
  Math.sqrt(sum_of_squares)
end

# Example usage:
data = [[1, 2], [1, 4], [1, 0], [10, 2], [10, 4], [10, 0]]
k = 2
clusters = k_means(data, k)
clusters.each_with_index do |(centroid, points), index|
  puts "Cluster #{index + 1}: Centroid -> #{centroid}, Points -> #{points.inspect}"
end
