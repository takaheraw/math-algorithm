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

# 深さ優先探索の初期化
visited = Array.new(n + 1, false)
s = [] # スタック s を定義
visited[1] = true
s.push(1) # s に 1 を追加

# 深さ優先探索
while s.size >= 1
  pos = s.pop # s の末尾を調べ、これを取り出す
  g[pos].each do |nex|
    unless visited[nex]
      visited[nex] = true
      s.push(nex) # s に nex を追加
    end
  end
end

# 連結かどうかの判定（answer = true のとき連結）
answer = true
(1..n).each do |i|
  unless visited[i]
    answer = false
    break
  end
end

if answer
  puts 'The graph is connected.'
else
  puts 'The graph is not connected.'
end
