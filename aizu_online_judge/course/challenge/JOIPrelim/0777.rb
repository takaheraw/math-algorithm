def solve(n, s, a, b, c)
  # 全てのライトを消灯するコスト
  min_cost = [a, b].min * n
  
  # 各連続区間[l, r]について試す
  (0...n).each do |l|
    (l...n).each do |r|
      # 区間[l, r]を残す場合のコスト計算
      
      # 左からl個消灯するコスト
      left_cost = l * a
      
      # 右から(n-1-r)個消灯するコスト  
      right_cost = (n - 1 - r) * b
      
      # この区間をRGBパターンにするためのコスト
      # RGB パターンは必ずRから始まらなければならない
      change_cost = 0
      
      (l..r).each do |i|
        # 期待される色（必ずRから始まるRGBパターン）
        expected_color = ['R', 'G', 'B'][(i - l) % 3]
        
        # 現在の色と異なる場合は変更コストが必要
        if s[i] != expected_color
          change_cost += c
        end
      end
      
      total_cost = left_cost + right_cost + change_cost
      min_cost = [min_cost, total_cost].min
    end
  end
  
  min_cost
end

# 入力の読み取り
n = gets.to_i
s = gets.chomp
a, b, c = gets.split.map(&:to_i)

# 解答の出力
puts solve(n, s, a, b, c)
