Node = Struct.new(:val, :next)

# 入力全体を一括読み込み
data = STDIN.read.split
n = data.shift.to_i
q = data.shift.to_i

# 各リストを [head, tail] のペアで管理。初期状態は空（nil）
lists = Array.new(n) { [nil, nil] }

output_lines = []
idx = 0
q.times do
  op = data[idx]; idx += 1
  case op
  when "0"  # insert(t, x)
    t = data[idx].to_i; x = data[idx+1].to_i; idx += 2
    new_node = Node.new(x, nil)
    head, tail = lists[t]
    if head.nil?
      lists[t][0] = new_node
      lists[t][1] = new_node
    else
      tail.next = new_node
      lists[t][1] = new_node
    end
  when "1"  # dump(t)
    t = data[idx].to_i; idx += 1
    curr = lists[t][0]
    # 1行分の文字列として出力する
    line = []
    while curr
      line << curr.val.to_s
      curr = curr.next
    end
    output_lines << line.join(" ")
  when "2"  # splice(s, t)
    s = data[idx].to_i; t = data[idx+1].to_i; idx += 2
    # Ls は必ず空でない
    s_head, s_tail = lists[s]
    t_head, t_tail = lists[t]
    if t_head.nil?
      lists[t][0] = s_head
      lists[t][1] = s_tail
    else
      t_tail.next = s_head
      lists[t][1] = s_tail
    end
    # Ls を空にする
    lists[s][0] = nil
    lists[s][1] = nil
  end
end

puts output_lines.join("\n")
