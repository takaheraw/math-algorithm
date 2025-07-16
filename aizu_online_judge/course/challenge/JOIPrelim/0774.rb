K = gets.to_i
N = gets.to_i
A = gets.split.map(&:to_i)
M = gets.to_i
B = gets.split.map(&:to_i)

count = 0

# 全てのAの要素とBの要素の組み合わせをチェック
(0...N).each do |p|
  (0...M).each do |q|
    if A[p] + K == B[q]
      count += 1
    end
  end
end

puts count
