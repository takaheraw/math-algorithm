require 'securerandom'

N = 1_000_000 # N は試行回数（適宜変更する）
m = 0
N.times do
  px = 6.0 * SecureRandom.random_number
  py = 9.0 * SecureRandom.random_number

  # 点 (3, 3) との距離。この値が 3 以下であれば半径 3 の円に含まれる。
  dist_33 = Math.sqrt((px - 3.0)**2 + (py - 3.0)**2)

  # 点 (3, 7) との距離。この値が 2 以下であれば半径 2 の円に含まれる。
  dist_37 = Math.sqrt((px - 3.0)**2 + (py - 7.0)**2)

  # 判定
  m += 1 if dist_33 <= 3.0 || dist_37 <= 2.0
end

puts m
