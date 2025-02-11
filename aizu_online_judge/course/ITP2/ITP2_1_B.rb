#!/usr/bin/env ruby
# 円環バッファを用いた deque の実装

class Deque
  def initialize
    @capacity = 2
    @buffer = Array.new(@capacity)
    @head = 0   # 先頭要素の位置
    @size = 0   # 現在の要素数
  end

  # 先頭に x を追加
  def push_front(x)
    resize(@capacity * 2) if @size == @capacity
    @head = (@head - 1) % @capacity
    @buffer[@head] = x
    @size += 1
  end

  # 末尾に x を追加
  def push_back(x)
    resize(@capacity * 2) if @size == @capacity
    idx = (@head + @size) % @capacity
    @buffer[idx] = x
    @size += 1
  end

  # 先頭の要素を削除して返す
  def pop_front
    x = @buffer[@head]
    @head = (@head + 1) % @capacity
    @size -= 1
    x
  end

  # 末尾の要素を削除して返す
  def pop_back
    idx = (@head + @size - 1) % @capacity
    x = @buffer[idx]
    @size -= 1
    x
  end

  # 0-index で p 番目の要素を返す
  def random_access(p)
    idx = (@head + p) % @capacity
    @buffer[idx]
  end

  # 現在の要素数を返す
  def size
    @size
  end

  private

  # バッファが一杯になった場合，容量を new_capacity に拡大し，
  # 現在の先頭から順に新バッファにコピーする
  def resize(new_capacity)
    new_buffer = Array.new(new_capacity)
    @size.times do |i|
      new_buffer[i] = @buffer[(@head + i) % @capacity]
    end
    @buffer = new_buffer
    @capacity = new_capacity
    @head = 0
  end
end

# 入力全体を高速に読み込む
input = STDIN.read.split
q = input.shift.to_i
deque = Deque.new
output = []
pos = 0

# クエリの処理
# クエリは以下の3種類
# 0 d x  => push(d, x) : d==0なら先頭に，d==1なら末尾に追加
# 1 p    => randomAccess(p) : 0-origin で p 番目の要素を出力
# 2 d    => pop(d) : d==0なら先頭から，d==1なら末尾から削除
while pos < input.size
  op = input[pos]
  pos += 1
  case op
  when "0"  # push 操作
    d = input[pos]; pos += 1
    x = input[pos].to_i; pos += 1
    if d == "0"
      deque.push_front(x)
    else
      deque.push_back(x)
    end
  when "1"  # randomAccess 操作
    p_index = input[pos].to_i; pos += 1
    output << deque.random_access(p_index)
  when "2"  # pop 操作
    d = input[pos]; pos += 1
    if d == "0"
      deque.pop_front
    else
      deque.pop_back
    end
  end
end

puts output.join("\n")
