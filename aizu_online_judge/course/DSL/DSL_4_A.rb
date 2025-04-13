def calculate_union_area(rectangles)
  # x軸方向のイベントを作成
  events = []
  
  rectangles.each do |x1, y1, x2, y2|
    # 長方形の左端（追加）と右端（削除）でイベントを作成
    events << [x1, 1, y1, y2]  # 開始イベント
    events << [x2, -1, y1, y2] # 終了イベント
  end
  
  # x座標でイベントをソート
  events.sort_by! { |x, type, _, _| x }
  
  total_area = 0
  active_ranges = []
  prev_x = nil
  
  events.each do |x, event_type, y1, y2|
    # 前回のx位置からの面積を計算
    if prev_x && !active_ranges.empty?
      width = x - prev_x
      # アクティブな範囲の合計長さを計算
      height = calculate_total_length(active_ranges)
      total_area += width * height
    end
    
    # アクティブな範囲を更新
    if event_type == 1
      active_ranges << [y1, y2]
    else
      active_ranges.delete([y1, y2])
    end
    
    prev_x = x
  end
  
  total_area
end

# 重複を考慮して区間の合計長さを計算
def calculate_total_length(ranges)
  return 0 if ranges.empty?
  
  # 区間の開始と終了をイベントとして扱う
  events = []
  ranges.each do |start, finish|
    events << [start, 1]   # 開始イベント
    events << [finish, -1] # 終了イベント
  end
  
  events.sort_by! { |pos, _| pos }
  
  total_length = 0
  active_count = 0
  prev_pos = nil
  
  events.each do |pos, event_type|
    # 前回の位置から現在の位置までで、アクティブな区間がある場合は長さを加算
    if prev_pos && active_count > 0
      total_length += pos - prev_pos
    end
    
    active_count += event_type
    prev_pos = pos
  end
  
  total_length
end

# 入力を処理
n = gets.to_i
rectangles = []

n.times do
  x1, y1, x2, y2 = gets.split.map(&:to_i)
  rectangles << [x1, y1, x2, y2]
end

# 計算して結果を出力
puts calculate_union_area(rectangles)
