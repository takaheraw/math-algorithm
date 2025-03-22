# 入力を受け取る
a, b = gets.split.map(&:to_i)

# AND演算
and_result = a & b

# OR演算
or_result = a | b

# XOR演算
xor_result = a ^ b

# 32ビットの2進数表現に変換する関数
def to_32bit_binary(num)
  format("%032b", num)
end

# 結果を出力
puts to_32bit_binary(and_result)
puts to_32bit_binary(or_result)
puts to_32bit_binary(xor_result)
