# 入力
n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 配列の初期化
first = Array.new(n + 1, -1)
second = Array.new(n + 1, -1)

# 答えを求める
# cur は現在いる町の番号
cnt = 0
cur = 1
loop do
  # First, Second の更新
  if first[cur] == -1
    first[cur] = cnt
  elsif second[cur] == -1
    second[cur] = cnt
  end

  # K 回の移動後に町 cur にいるか判定
  if cnt == k
    puts cur
    exit
  elsif second[cur] != -1 && (k - first[cur]) % (second[cur] - first[cur]) == 0
    puts cur
    exit
  end

  cur = a[cur - 1]
  cnt += 1
end
