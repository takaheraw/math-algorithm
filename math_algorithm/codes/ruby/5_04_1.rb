# 入力
n, k = gets.chomp.split.map(&:to_i)

# 事象 b の個数 yojishou を数える
yojishou = 0
(1..n).each do |a|
  l = [1, a - (k - 1)].max # b, c の探索範囲の下限 l
  r = [n, a + (k - 1)].min # b, c の探索範囲の上限 r
  (l..r).each do |b|
    (l..r).each do |c|
      yojishou += 1 if (b - c).abs <= k - 1
    end
  end
end

# 答えの出力
puts n**3 - yojishou
