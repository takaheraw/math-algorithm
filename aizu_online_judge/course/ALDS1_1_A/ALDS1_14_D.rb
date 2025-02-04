# 標準入力からテキスト T を取得
t = gets.chomp

# クエリ数 Q を取得
q = gets.to_i

# 各パターンについて判定し、結果を出力
q.times do
  pattern = gets.chomp
  # T に pattern が含まれていれば1、含まれていなければ0を出力
  puts t.include?(pattern) ? 1 : 0
end
