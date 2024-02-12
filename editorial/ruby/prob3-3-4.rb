# 入力
n = gets.to_i
a = gets.split.map(&:to_i)

# 答えを求める
a_count = Hash.new(0)
a.each do |num|
  case num
  when 100
    a_count[:a] += 1
  when 200
    a_count[:b] += 1
  when 300
    a_count[:c] += 1
  when 400
    a_count[:d] += 1
  end
end

# 出力
puts a_count[:a] * a_count[:d] + a_count[:b] * a_count[:c]
