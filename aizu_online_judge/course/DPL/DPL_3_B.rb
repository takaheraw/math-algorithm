def largest_rectangle_in_histogram(heights)
  stack = []
  max_area = 0
  
  heights.each_with_index do |height, i|
    while !stack.empty? && heights[stack[-1]] > height
      h = heights[stack.pop]
      w = stack.empty? ? i : i - stack[-1] - 1
      max_area = [max_area, h * w].max
    end
    stack.push(i)
  end
  
  while !stack.empty?
    h = heights[stack.pop]
    w = stack.empty? ? heights.length : heights.length - stack[-1] - 1
    max_area = [max_area, h * w].max
  end
  
  max_area
end

# メイン処理
def solve_largest_rectangle
  # 入力の読み取り
  h, w = gets.split.map(&:to_i)
  matrix = []
  h.times do
    row = gets.split.map(&:to_i)
    matrix << row
  end
  
  # 各行について、その行までの連続する0の高さを計算
  heights = Array.new(h) { Array.new(w, 0) }
  
  # 最初の行を初期化
  (0...w).each do |j|
    heights[0][j] = matrix[0][j] == 0 ? 1 : 0
  end
  
  # 2行目以降を計算
  (1...h).each do |i|
    (0...w).each do |j|
      if matrix[i][j] == 0
        heights[i][j] = heights[i-1][j] + 1
      else
        heights[i][j] = 0
      end
    end
  end
  
  # 各行についてヒストグラムの最大矩形を計算
  max_area = 0
  (0...h).each do |i|
    area = largest_rectangle_in_histogram(heights[i])
    max_area = [max_area, area].max
  end
  
  puts max_area
end

# 実行
solve_largest_rectangle
