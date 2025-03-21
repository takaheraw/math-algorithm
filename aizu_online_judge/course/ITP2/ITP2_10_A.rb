#!/usr/bin/env ruby

# 標準入力から整数xを読み込む
x = gets.to_i

# xを32ビットの2進数表現に変換
binary = "%032b" % x

# 反転操作（各ビットを逆の状態に変更）
inversion = binary.chars.map { |bit| bit == '0' ? '1' : '0' }.join

# 論理的左シフト（1ビット左にシフト）
left_shift = "%032b" % (x << 1)

# 論理的右シフト（1ビット右にシフト）
right_shift = "%032b" % (x >> 1)

# 結果を出力
puts binary
puts inversion
puts left_shift
puts right_shift
