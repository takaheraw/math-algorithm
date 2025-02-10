def fibonacci(n)
  return 1 if n == 0 || n == 1
  fib = [1, 1]
  (2..n).each do |i|
    fib[i] = fib[i - 1] + fib[i - 2]
  end
  fib[n]
end

# 入力の読み込み
n = gets.to_i

# フィボナッチ数の計算と出力
puts fibonacci(n)
