def insertion_sort_trace(n, array)
  # 初期状態を出力
  puts array.join(" ")

  # 挿入ソートアルゴリズム
  (1...n).each do |i|
    key = array[i]
    j = i - 1

    # key を array[0...j] の適切な位置に挿入
    while j >= 0 && array[j] > key
      array[j + 1] = array[j]
      j -= 1
    end

    array[j + 1] = key

    # 中間結果を出力
    puts array.join(" ")
  end
end

# 入力の読み取り
n = gets.to_i
array = gets.split.map(&:to_i)

# 挿入ソートを実行
insertion_sort_trace(n, array)
