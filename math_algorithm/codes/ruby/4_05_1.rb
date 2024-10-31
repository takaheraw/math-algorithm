# 入力
n, m = gets.split.map(&:to_i)
a = Array.new(m)
b = Array.new(m)
m.times do |i|
  a[i], b[i] = gets.split.map(&:to_i)
end

# 隣接リストの作成
g = Array.new(n + 1) { [] } # g[i] は頂点 i に隣接する頂点のリスト
m.times do |i|
  g[a[i]] << b[i] # 頂点 a[i] に隣接する頂点として b[i] を追加
  g[b[i]] << a[i] # 頂点 b[i] に隣接する頂点として a[i] を追加
end

# 出力（g[i].size は頂点 i に隣接する頂点のリストの大きさ ＝ 次数）
(1..n).each do |i|
  output = "#{i}: {"
  g[i].each_with_index do |vertex, j|
    output += ',' if j >= 1
    output += vertex.to_s # g[i][j] は頂点 i に隣接する頂点のうち j+1 番目のもの
  end
  output += '}'
  puts output
end
