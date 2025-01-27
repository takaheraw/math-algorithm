n = gets.to_i
adj = Array.new(n) { [] }

n.times do
  parts = gets.split.map(&:to_i)
  u = parts[0]
  k = parts[1]
  vc_pairs = parts[2..-1]
  
  i = 0
  while i < vc_pairs.size
    v = vc_pairs[i]
    c = vc_pairs[i+1]
    adj[u] << [v, c]
    i += 2
  end
end

dist = Array.new(n, Float::INFINITY)
dist[0] = 0
processed = Array.new(n, false)

n.times do
  # 未処理で最小距離の頂点を選択
  min_dist = Float::INFINITY
  u = nil
  n.times do |i|
    if !processed[i] && dist[i] < min_dist
      min_dist = dist[i]
      u = i
    end
  end

  break unless u  # すべて処理済みの場合

  processed[u] = true

  # 隣接頂点の距離を更新
  adj[u].each do |v, c|
    if dist[v] > dist[u] + c
      dist[v] = dist[u] + c
    end
  end
end

n.times do |i|
  puts "#{i} #{dist[i]}"
end
