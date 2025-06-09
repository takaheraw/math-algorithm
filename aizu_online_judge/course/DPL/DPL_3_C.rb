def largest_rectangle_area(heights)
  stack = []
  max_area = 0
  
  heights.each_with_index do |height, i|
    # 現在の高さより大きい高さがスタックにある間、面積を計算
    while !stack.empty? && heights[stack.last] > height
      h = heights[stack.pop]
      # 幅を計算：現在のインデックス - (スタックの最後のインデックス + 1)
      # スタックが空の場合は現在のインデックスまでの全幅
      w = stack.empty? ? i : i - stack.last - 1
      max_area = [max_area, h * w].max
    end
    stack.push(i)
  end
  
  # 残りのスタック要素を処理
  while !stack.empty?
    h = heights[stack.pop]
    w = stack.empty? ? heights.length : heights.length - stack.last - 1
    max_area = [max_area, h * w].max
  end
  
  max_area
end

# 入力を読み取り
n = gets.to_i
heights = gets.split.map(&:to_i)

# 結果を出力
puts largest_rectangle_area(heights)
