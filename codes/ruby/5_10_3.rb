# 入力
n, x, y = gets.split.map(&:to_i)

# 4 つの整数 (a, b, c, d) の全探索
flag = false
(1..n).each do |a|
  (a..n).each do |b|
    (b..n).each do |c|
      (c..n).each do |d|
        if a + b + c + d == x && a * b * c * d == y
          flag = true # 答えが見つかったら flag を true にする
        end
      end
    end
  end
end

# 答えの出力
if flag == true
  puts 'Yes'
else
  puts 'No'
end
