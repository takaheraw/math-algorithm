# 深さ優先探索を行う関数
def dfs(pos, g, visited)
  visited[pos] = true
  g[pos].each do |i|
    dfs(i, g, visited) unless visited[i]
  end
end

# 再帰呼び出しの深さの上限を 120000 に設定
# Rubyではデフォルトの再帰呼び出し制限はありません

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

# 深さ優先探索
visited = Array.new(n + 1, false)
dfs(1, g, visited)

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
