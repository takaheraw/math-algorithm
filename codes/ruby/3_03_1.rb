# 入力
n = gets.to_i
a = gets.chomp.split.map(&:to_i)

# 5 つのカードの番号 (i, j, k, l, m) を全探索
answer = 0
(0..n - 1).each do |i|
  (i + 1..n - 1).each do |j|
    (j + 1..n - 1).each do |k|
      (k + 1..n - 1).each do |l|
        (l + 1..n - 1).each do |m|
          answer += 1 if a[i] + a[j] + a[k] + a[l] + a[m] == 1000
        end
      end
    end
  end
end

# 出力
puts answer
