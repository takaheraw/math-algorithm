defmodule KMeans do
  def cluster(data, k) do
    centroids = Enum.take_random(data, k)
    do_cluster(data, centroids)
  end

  defp do_cluster(data, centroids) do
    clusters = Enum.group_by(data, &closest_centroid(&1, centroids))
    new_centroids = Enum.map(clusters, fn {_, points} -> calculate_centroid(points) end)

    if new_centroids == centroids do
      clusters
    else
      do_cluster(data, new_centroids)
    end
  end

  defp closest_centroid(point, centroids) do
    Enum.min_by(centroids, &euclidean_distance(point, &1))
  end

  defp calculate_centroid(points) do
    points
    |> Enum.zip()
    |> Enum.map(&(Enum.sum(&1) / length(&1)))
  end

  defp euclidean_distance(point1, point2) do
    Enum.zip(point1, point2)
    |> Enum.map(fn {a, b} -> :math.pow(a - b, 2) end)
    |> Enum.sum()
    |> :math.sqrt()
  end
end

# 使用例
data = [[1, 2], [1, 4], [1, 0], [10, 2], [10, 4], [10, 0]]
k = 2
clusters = KMeans.cluster(data, k)

Enum.each(clusters, fn {centroid, points} ->
  IO.puts("クラスター: 中心点 -> #{inspect(centroid)}, ポイント -> #{inspect(points)}")
end)
