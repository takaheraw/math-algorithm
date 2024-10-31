# 小問題 t を解く関数
def shou_mondai(a, b, t)
  cl = (a + t - 1) / t.to_f.ceil # A÷t の小数点以下切り上げ
  cr = b / t.to_f.floor # B÷t の小数点以下切り捨て
  cr - cl >= 1
end

# 入力
a, b = gets.chomp.split.map(&:to_i)

# 1 から B までループ
(1..b).each do |i|
  # 小問題 i が解けるかどうか判定
  next unless shou_mondai(a, b, i)

  # 解ける場合、答えを出力
  puts i
  break
end
