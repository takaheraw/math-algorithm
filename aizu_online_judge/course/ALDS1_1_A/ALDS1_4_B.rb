def count_common_elements_sorted
  # 標準入力の読み取り
  n = gets.to_i
  s = gets.split.map(&:to_i) # ソート済みの配列
  q = gets.to_i
  t = gets.split.map(&:to_i) # チェックする配列

  # 共通要素のカウント
  count = 0

  t.each do |element|
    count += 1 if binary_search(s, element)
  end

  # 結果を出力
  puts count
end

# 二分探索を行う関数
# 配列 array から要素 key を探す
# 見つかれば true を返す
# 見つからなければ false を返す
def binary_search(array, key)
  left = 0
  right = array.size

  while left < right
    mid = (left + right) / 2
    if array[mid] == key
      return true
    elsif array[mid] < key
      left = mid + 1
    else
      right = mid
    end
  end

  false
end

# メソッドの実行
count_common_elements_sorted
