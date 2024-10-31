n = 10_000 # N は試行回数（適宜変更する）
m = 0

n.times do
  px = rand # 0以上1未満の乱数を生成
  py = rand # 0以上1未満の乱数を生成
  # 原点からの距離は Math.sqrt(px * px + py * py)
  # これが1以下であれば良いので、条件は「px * px + py * py <= 1」（「Math.sqrt(px * px + py * py) <= 1」と同値）
  m += 1 if px * px + py * py <= 1.0
end

puts format('%.12f', 4 * m / n)
