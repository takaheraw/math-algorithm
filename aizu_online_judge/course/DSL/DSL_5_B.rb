# 最大重なり数の計算問題
# スイープライン法を使用して、最も多くの矩形が重なる領域の重なり数を求める

def max_overlap(rectangles)
  # x座標に関するイベントリストを作成
  events = []
  
  # 各矩形のx方向のイベント（開始と終了）を記録
  rectangles.each_with_index do |(x1, y1, x2, y2), i|
    events << [x1, 1, y1, y2, i] # x1座標で矩形が始まる
    events << [x2, -1, y1, y2, i] # x2座標で矩形が終わる
  end
  
  # x座標でソート
  events.sort!
  
  max_overlap_count = 0
  active_rectangles = []
  
  events.each do |x, event_type, y1, y2, rect_id|
    if event_type == 1
      # 矩形の開始
      active_rectangles << [y1, y2, rect_id]
    else
      # 矩形の終了
      active_rectangles.reject! { |_, _, id| id == rect_id }
    end
    
    # 現在のx座標での最大重なり数を計算
    if !active_rectangles.empty?
      # y座標に関するイベントリストを作成
      y_events = []
      active_rectangles.each do |y1, y2, _|
        y_events << [y1, 1]  # y1座標で矩形が始まる
        y_events << [y2, -1] # y2座標で矩形が終わる
      end
      
      # y座標でソート
      y_events.sort!
      
      # スイープラインでy方向をスキャン
      current_overlap = 0
      max_y_overlap = 0
      
      y_events.each do |_, event_type|
        current_overlap += event_type
        max_y_overlap = [max_y_overlap, current_overlap].max
      end
      
      max_overlap_count = [max_overlap_count, max_y_overlap].max
    end
  end
  
  max_overlap_count
end

# 入力を処理
n = gets.to_i
rectangles = []

n.times do
  x1, y1, x2, y2 = gets.split.map(&:to_i)
  rectangles << [x1, y1, x2, y2]
end

# 結果を出力
puts max_overlap(rectangles)
