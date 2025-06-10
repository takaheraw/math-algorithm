n, v = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)
d = gets.split.map(&:to_i)

# バッグAとBの全ての組み合わせの和を計算し、出現回数をカウント
ab_sums = Hash.new(0)
(0...n).each do |i|
  (0...n).each do |j|
    sum = a[i] + b[j]
    ab_sums[sum] += 1
  end
end

# バッグCとDの全ての組み合わせを試して、
# 必要な値(V - c[i] - d[j])がab_sumsに存在するかチェック
result = 0
(0...n).each do |i|
  (0...n).each do |j|
    needed = v - c[i] - d[j]
    if ab_sums.key?(needed)
      result += ab_sums[needed]
    end
  end
end

puts result
