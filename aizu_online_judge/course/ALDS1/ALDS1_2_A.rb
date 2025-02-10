def bubble_sort(n, array)
  swap_count = 0

  (0...n).each do |i|
    (n-1).downto(i+1) do |j|
      if array[j] < array[j-1]
        array[j], array[j-1] = array[j-1], array[j]
        swap_count += 1
      end
    end
  end

  [array, swap_count]
end

# 入力の読み取り
n = gets.to_i
array = gets.split.map(&:to_i)

# バブルソートの実行
sorted_array, swap_count = bubble_sort(n, array)

# 結果の出力
puts sorted_array.join(" ")
puts swap_count
