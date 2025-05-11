#!/usr/bin/env ruby

# 与えられた点が線分上にあるかどうかを判定する
def on_segment?(p, q, r)
  return q[0] <= [p[0], r[0]].max && q[0] >= [p[0], r[0]].min &&
         q[1] <= [p[1], r[1]].max && q[1] >= [p[1], r[1]].min
end

# 点の向きを判定する（反時計回り、時計回り、または一直線）
def orientation(p, q, r)
  val = (q[1] - p[1]) * (r[0] - q[0]) - (q[0] - p[0]) * (r[1] - q[1])
  return 0 if val == 0    # 一直線
  return 1 if val > 0     # 時計回り
  return 2                # 反時計回り
end

# 2つの線分が交差するかどうかを判定する
def intersect?(p1, q1, p2, q2)
  o1 = orientation(p1, q1, p2)
  o2 = orientation(p1, q1, q2)
  o3 = orientation(p2, q2, p1)
  o4 = orientation(p2, q2, q1)

  # 一般的な場合
  return true if o1 != o2 && o3 != o4

  # 特殊なケース
  return true if o1 == 0 && on_segment?(p1, p2, q1)
  return true if o2 == 0 && on_segment?(p1, q2, q1)
  return true if o3 == 0 && on_segment?(p2, p1, q2)
  return true if o4 == 0 && on_segment?(p2, q1, q2)

  return false
end

# 点が多角形の辺上にあるかをチェック
def is_on_edge?(polygon, point)
  n = polygon.length
  
  # 各辺をチェック
  n.times do |i|
    next_i = (i + 1) % n
    segment_start = polygon[i]
    segment_end = polygon[next_i]
    
    # 点が線分上にあるかどうかをチェック
    if orientation(segment_start, point, segment_end) == 0 && on_segment?(segment_start, point, segment_end)
      return true
    end
  end
  
  return false
end

# 点が多角形内部にあるかをチェック（Ray casting algorithm）
def is_inside_polygon?(polygon, point)
  # 先に辺上にあるかチェック
  return 1 if is_on_edge?(polygon, point)
  
  n = polygon.length
  inside = false
  
  # 点から右方向に伸びる光線を考え、多角形の辺との交差回数を数える
  inf_point = [Float::INFINITY, point[1]]
  count = 0
  
  n.times do |i|
    next_i = (i + 1) % n
    
    # 辺が光線と同じ高さを持つ場合は除外
    next if (polygon[i][1] == point[1] && polygon[next_i][1] == point[1])
    
    # 辺の一方の端点だけが光線と同じ高さの場合、少し調整
    if polygon[i][1] == point[1]
      # 上向きの辺の始点の場合だけカウント
      count += 1 if polygon[next_i][1] > point[1]
      next
    end
    
    if polygon[next_i][1] == point[1]
      # 下向きの辺の終点の場合だけカウント
      count += 1 if polygon[i][1] > point[1]
      next
    end
    
    # 通常の交差チェック
    if (polygon[i][1] > point[1]) != (polygon[next_i][1] > point[1])
      # x座標の計算
      xinters = (polygon[next_i][0] - polygon[i][0]) * (point[1] - polygon[i][1]) / 
                (polygon[next_i][1] - polygon[i][1]) + polygon[i][0]
      
      # 点の右側で交差するかチェック
      count += 1 if xinters > point[0]
    end
  end
  
  # 交差回数が奇数なら内部
  return 2 if count.odd?
  return 0
end

# 入力の読み込み
n = gets.to_i
polygon = []
n.times do
  x, y = gets.split.map(&:to_i)
  polygon << [x, y]
end

q = gets.to_i
results = []

q.times do
  x, y = gets.split.map(&:to_i)
  point = [x, y]
  results << is_inside_polygon?(polygon, point)
end

# 結果の出力
results.each { |result| puts result }
