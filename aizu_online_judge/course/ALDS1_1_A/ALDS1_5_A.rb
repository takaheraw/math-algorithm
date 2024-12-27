def can_make_sum?(arr, target)
  # 部分集合を全て列挙し、その和が target に等しいかを確認
  (0..arr.length).each do |i|
    arr.combination(i).each do |comb|
      return true if comb.sum == target
    end
  end
  false
end

# 入力の処理
n = gets.to_i
arr = gets.split.map(&:to_i)
q = gets.to_i
queries = gets.split.map(&:to_i)

# 各クエリに対する出力
queries.each do |m|
  if can_make_sum?(arr, m)
    puts "yes"
  else
    puts "no"
  end
end
