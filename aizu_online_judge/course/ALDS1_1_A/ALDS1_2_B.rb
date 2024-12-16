def selection_sort(n, array)
  swap_count = 0

  (0...n).each do |i|
    mini = i
    (i...n).each do |j|
      mini = j if array[j] < array[mini]
    end
    if i != mini
      array[i], array[mini] = array[mini], array[i]
      swap_count += 1
    end
  end

  [array, swap_count]
end

# 入力の読み取り
n = gets.to_i
array = gets.split.map(&:to_i)

# 選択ソートの実行
sorted_array, swap_count = selection_sort(n, array)

# 結果の出力
puts sorted_array.join(" ")
puts swap_count
