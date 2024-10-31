# 入力
n = gets.to_i
a = gets.chomp.split.map(&:to_i)

# 選択ソート
for i in 0..n - 2
  min_position = i
  min_value = a[i]

  (i + 1).upto(n - 1) do |j|
    if a[j] < min_value
      min_position = j  # min_position は最小値のインデックス（0 ～ n-1）
      min_value = a[j]  # min_value は現時点での最小値
    end
  end

  # a[i] と a[min_position] を交換
  a[i], a[min_position] = a[min_position], a[i]
end

# 出力
a.each do |element|
  puts element
end
