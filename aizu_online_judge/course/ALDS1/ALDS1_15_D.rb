# ノードの構造体を定義
Node = Struct.new(:char, :freq, :left, :right)

def huffman_length(s)
  # 各文字の出現頻度をカウント
  freq = Hash.new(0)
  s.each_char { |char| freq[char] += 1 }

  # ノードを頻度順に並べた配列を用意
  nodes = freq.map { |char, count| Node.new(char, count, nil, nil) }

  # Huffman木を構築
  while nodes.size > 1
    # 頻度の小さい順にソート
    nodes.sort_by!(&:freq)
    left = nodes.shift
    right = nodes.shift
    combined_freq = left.freq + right.freq
    nodes.push(Node.new(nil, combined_freq, left, right))
  end

  # Huffman木のルートノードを取得
  root = nodes.first

  # 深さ優先探索でHuffman符号の長さを計算
  total_length = 0
  stack = [[root, 0]] # ノードとその深さを保持
  until stack.empty?
    node, depth = stack.pop
    if node.left.nil? && node.right.nil?
      # 葉ノードの場合、符号長を計算
      total_length += depth * freq[node.char]
    else
      stack.push([node.left, depth + 1]) if node.left
      stack.push([node.right, depth + 1]) if node.right
    end
  end

  total_length
end

# 入力を受け取り、結果を出力
s = gets.chomp
puts huffman_length(s)
