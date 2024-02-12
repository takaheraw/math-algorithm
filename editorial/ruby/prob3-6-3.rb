def merge_sort(arr)
  # 長さが 1 の場合、すでにソートされているので何もしない
  return arr if arr.length <= 1

  # 2 つに分割した後、小さい配列をソート
  mid = arr.length / 2
  a_dash = merge_sort(arr[0...mid])
  b_dash = merge_sort(arr[mid..-1])

  # 以下が Merge 操作となります。
  c = []
  until a_dash.empty? || b_dash.empty?
    c << if a_dash.first <= b_dash.first
           a_dash.shift
         else
           b_dash.shift
         end
  end

  # 余った要素を追加
  c.concat(a_dash).concat(b_dash)
end

# 以下、メイン部分
n = gets.to_i
a = gets.split.map(&:to_i)

# マージソート → 答えの出力
answer = merge_sort(a)
puts answer.join(' ')
