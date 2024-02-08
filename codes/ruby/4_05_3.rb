# 入力
n, m = gets.split.map(&:to_i)
a = Array.new(m)
b = Array.new(m)
m.times do |i|
  a[i], b[i] = gets.split.map(&:to_i)
end

# 隣接リストの作成
g = Array.new(n + 1) { [] }
m.times do |i|
  g[a[i]] << b[i]
  g[b[i]] << a[i]
end

# 幅優先探索の初期化 (dist[i] = -1 のとき、未到達の白色頂点である）
dist = Array.new(n + 1, -1)
q = Queue.new
dist[1] = 0
q.push(1) # q に 1 を追加（操作 1）

# 幅優先探索
until q.empty?
  pos = q.pop # q の先頭を調べ、これを取り出す（操作 2, 3）
  g[pos].each do |nex|
    if dist[nex] == -1
      dist[nex] = dist[pos] + 1
      q.push(nex) # q に nex を追加（操作 1）
    end
  end
end

# 頂点 1 から各頂点までの最短距離を出力
(1..n).each do |i|
  puts dist[i]
end
