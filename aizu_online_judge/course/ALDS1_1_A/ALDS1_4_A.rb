def count_common_elements
  # 標準入力の読み取り
  n = gets.to_i
  s = gets.split.map(&:to_i).to_set # 配列をセットに変換
  q = gets.to_i
  t = gets.split.map(&:to_i)

  # 共通要素のカウント
  count = t.count { |element| s.include?(element) }

  # 結果を出力
  puts count
end

# メソッドの実行
require 'set'
count_common_elements
