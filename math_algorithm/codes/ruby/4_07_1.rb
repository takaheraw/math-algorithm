MOD = 1_000_000_000

# 2×2 行列 A, B の積を返す関数
def multiply(a, b)
  c = Array.new(2) { Array.new(2, 0) }
  2.times do |i|
    2.times do |j|
      2.times do |k|
        c[i][j] += a[i][k] * b[k][j]
        c[i][j] %= MOD
      end
    end
  end
  c
end

# A の n 乗を返す関数
def power(a, n)
  p = Marshal.load(Marshal.dump(a))
  q = Array.new(2) { Array.new(2, 0) }
  flag = false
  60.times do |i|
    if n & (1 << i) != 0
      if !flag
        q = Marshal.load(Marshal.dump(p))
        flag = true
      else
        q = multiply(q, p)
      end
    end
    p = multiply(p, p)
  end
  q
end

# 入力 → 累乗の計算（N が 2 以上でなければ正しく動作しないので注意）
n = gets.to_i
a = [[1, 1], [1, 0]]
b = power(a, n - 1)

# 答えの計算 → 出力（下から 9 桁目が 0 の場合、最初に 0 を含まない形で出力していることに注意）
answer = (b[1][0] + b[1][1]) % MOD
puts answer
