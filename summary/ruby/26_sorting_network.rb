# Sorting Network Implementation in Ruby

module SortingNetwork
  module_function

  # 汎用的なSWAP操作
  def swap(arr, i, j)
    arr[i], arr[j] = arr[j], arr[i] if arr[i] > arr[j]
  end

  # 3要素用 (3 comparators)
  def sort3(arr)
    swap(arr, 0, 1)
    swap(arr, 1, 2)
    swap(arr, 0, 1)
    arr
  end

  # 5要素用 (9 comparators)
  def sort5(arr)
    swap(arr, 0, 1)
    swap(arr, 3, 4)
    swap(arr, 2, 4)
    swap(arr, 2, 3)
    swap(arr, 0, 3)
    swap(arr, 0, 2)
    swap(arr, 1, 4)
    swap(arr, 1, 3)
    swap(arr, 1, 2)
    arr
  end

  # 7要素用 (16 comparators)
  def sort7(arr)
    swap(arr, 1, 2)
    swap(arr, 3, 4)
    swap(arr, 5, 6)
    swap(arr, 0, 2)
    swap(arr, 3, 5)
    swap(arr, 4, 6)
    swap(arr, 0, 1)
    swap(arr, 4, 5)
    swap(arr, 2, 6)
    swap(arr, 0, 4)
    swap(arr, 1, 5)
    swap(arr, 0, 3)
    swap(arr, 2, 5)
    swap(arr, 1, 3)
    swap(arr, 2, 4)
    swap(arr, 2, 3)
    arr
  end

  # 9要素用 (25 comparators)
  def sort9(arr)
    swap(arr, 0, 1)
    swap(arr, 3, 4)
    swap(arr, 6, 7)
    swap(arr, 1, 2)
    swap(arr, 4, 5)
    swap(arr, 7, 8)
    swap(arr, 0, 1)
    swap(arr, 3, 4)
    swap(arr, 6, 7)
    swap(arr, 0, 3)
    swap(arr, 3, 6)
    swap(arr, 0, 3)
    swap(arr, 1, 4)
    swap(arr, 4, 7)
    swap(arr, 1, 4)
    swap(arr, 2, 5)
    swap(arr, 5, 8)
    swap(arr, 2, 5)
    swap(arr, 1, 3)
    swap(arr, 5, 7)
    swap(arr, 2, 6)
    swap(arr, 4, 6)
    swap(arr, 2, 4)
    swap(arr, 2, 3)
    swap(arr, 5, 6)
    arr
  end

  # 要素数に応じて適切なネットワークを選択
  def sort(arr)
    case arr.size
    when 0, 1 then arr
    when 2    then swap(arr, 0, 1); arr
    when 3    then sort3(arr)
    when 4    then sort4(arr)
    when 5    then sort5(arr)
    when 6    then sort6(arr)
    when 7    then sort7(arr)
    when 8    then sort8(arr)
    when 9    then sort9(arr)
    else
      raise ArgumentError, "Sorting network not implemented for size #{arr.size}"
    end
  end

  # 4要素用 (5 comparators) - 追加
  def sort4(arr)
    swap(arr, 0, 1)
    swap(arr, 2, 3)
    swap(arr, 0, 2)
    swap(arr, 1, 3)
    swap(arr, 1, 2)
    arr
  end

  # 6要素用 (12 comparators) - 追加
  def sort6(arr)
    swap(arr, 1, 2)
    swap(arr, 4, 5)
    swap(arr, 0, 2)
    swap(arr, 3, 5)
    swap(arr, 0, 1)
    swap(arr, 3, 4)
    swap(arr, 2, 5)
    swap(arr, 0, 3)
    swap(arr, 1, 4)
    swap(arr, 2, 4)
    swap(arr, 1, 3)
    swap(arr, 2, 3)
    arr
  end

  # 8要素用 (19 comparators) - 追加
  def sort8(arr)
    swap(arr, 0, 1)
    swap(arr, 2, 3)
    swap(arr, 4, 5)
    swap(arr, 6, 7)
    swap(arr, 0, 2)
    swap(arr, 1, 3)
    swap(arr, 4, 6)
    swap(arr, 5, 7)
    swap(arr, 1, 2)
    swap(arr, 5, 6)
    swap(arr, 0, 4)
    swap(arr, 3, 7)
    swap(arr, 1, 5)
    swap(arr, 2, 6)
    swap(arr, 1, 4)
    swap(arr, 3, 6)
    swap(arr, 2, 4)
    swap(arr, 3, 5)
    swap(arr, 3, 4)
    arr
  end
end

# 使用例
if __FILE__ == $0
  # テスト
  [3, 5, 7, 9].each do |n|
    10.times do
      arr = Array.new(n) { rand(100) }
      original = arr.dup
      SortingNetwork.sort(arr)
      
      expected = original.sort
      status = arr == expected ? "✓" : "✗"
      puts "#{status} sort#{n}(#{original}) => #{arr}"
    end
    puts
  end
end
