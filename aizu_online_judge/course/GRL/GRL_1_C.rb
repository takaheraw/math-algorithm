#!/usr/bin/env ruby

INF = Float::INFINITY

# グラフの読み込み
v, e = gets.split.map(&:to_i)
graph = Array.new(v) { Array.new(v, INF) }

# 自分自身への距離は0に初期化
v.times { |i| graph[i][i] = 0 }

# エッジの読み込み
e.times do
  s, t, d = gets.split.map(&:to_i)
  graph[s][t] = d
end

# Floyd-Warshallアルゴリズムの実装
v.times do |k|
  v.times do |i|
    v.times do |j|
      if graph[i][k] != INF && graph[k][j] != INF
        graph[i][j] = [graph[i][j], graph[i][k] + graph[k][j]].min
      end
    end
  end
end

# 負の閉路の検出
negative_cycle = false
v.times do |i|
  negative_cycle = true if graph[i][i] < 0
end

# 結果の出力
if negative_cycle
  puts "NEGATIVE CYCLE"
else
  v.times do |i|
    result = []
    v.times do |j|
      if graph[i][j] == INF
        result << "INF"
      else
        result << graph[i][j].to_s
      end
    end
    puts result.join(" ")
  end
end
