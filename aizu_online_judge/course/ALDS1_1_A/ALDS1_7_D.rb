def build_postorder(preorder, inorder)
  return [] if preorder.empty?

  root = preorder[0]
  root_index = inorder.index(root)

  left_inorder = inorder[0...root_index]
  right_inorder = inorder[root_index + 1..]

  left_preorder = preorder[1..left_inorder.size]
  right_preorder = preorder[left_inorder.size + 1..]

  left_postorder = build_postorder(left_preorder, left_inorder)
  right_postorder = build_postorder(right_preorder, right_inorder)

  left_postorder + right_postorder + [root]
end

# 入力の読み込み
n = gets.to_i
preorder = gets.split.map(&:to_i)
inorder = gets.split.map(&:to_i)

# 再構築してポストオーダーを出力
postorder = build_postorder(preorder, inorder)
puts postorder.join(" ")
