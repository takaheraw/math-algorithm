fn distance(a: (Float, Float), b: (Float, Float)) -> Float {
  return ((a.0 - b.0).pow(2) + (a.1 - b.1).pow(2)).sqrt()
}

fn assign_clusters(points: &List<(Float, Float)>, centroids: &List<(Float, Float)>) -> List<Int> {
  let mut clusters = List<Int>::new_with_size(points.size(), -1)

  for i = 0; i < points.size(); i = i + 1 {
    let mut min_dist = Float::max_value()
    let mut closest_centroid = -1

    for j = 0; j < centroids.size(); j = j + 1 {
      let dist = distance(points[i], centroids[j])
      if dist < min_dist {
        min_dist = dist
        closest_centroid = j
      }
    }

    clusters[i] = closest_centroid
  }

  return clusters
}

fn update_centroids(points: &List<(Float, Float)>, clusters: &List<Int>, k: Int) -> List<(Float, Float)> {
  let mut new_centroids = List<(Float, Float)>::new_with_size(k, (0.0, 0.0))
  let mut counts = List<Int>::new_with_size(k, 0)

  for i = 0; i < points.size(); i = i + 1 {
    let cluster = clusters[i]
    new_centroids[cluster].0 = new_centroids[cluster].0 + points[i].0
    new_centroids[cluster].1 = new_centroids[cluster].1 + points[i].1
    counts[cluster] = counts[cluster] + 1
  }

  for j = 0; j < k; j = j + 1 {
    if counts[j] > 0 {
      new_centroids[j].0 = new_centroids[j].0 / counts[j].to_float()
      new_centroids[j].1 = new_centroids[j].1 / counts[j].to_float()
    }
  }

  return new_centroids
}

fn kmeans(points: &List<(Float, Float)>, k: Int, max_iters: Int) -> List<(Float, Float)> {
  // 初期の重心をランダムに選ぶ
  let mut centroids = points[0:k].clone()

  for _ in 0..max_iters {
    let clusters = assign_clusters(points, &centroids)
    let new_centroids = update_centroids(points, &clusters, k)

    // 重心が変わらなければ終了
    if centroids == new_centroids {
      break
    }

    centroids = new_centroids
  }

  return centroids
}

fn main {
  let points = [(1.0, 1.0), (1.5, 2.0), (3.0, 4.0), (5.0, 7.0), (3.5, 5.0), (4.5, 5.0), (3.5, 4.5)]
  let k = 2
  let max_iters = 100
  let centroids = kmeans(&points, k, max_iters)

  println("Final centroids: ", centroids)
}
