# 入力を受け取る
t = gets.chomp
p = gets.chomp

# KMP法用に部分一致テーブル（πテーブル）を作成する関数
def build_pi(pattern)
  m = pattern.size
  pi = Array.new(m, 0)
  j = 0
  (1...m).each do |i|
    while j > 0 && pattern[i] != pattern[j]
      j = pi[j - 1]
    end
    if pattern[i] == pattern[j]
      j += 1
      pi[i] = j
    end
  end
  pi
end

# KMP法で文字列検索を行う関数
def kmp_search(text, pattern)
  n = text.size
  m = pattern.size
  pi = build_pi(pattern)
  j = 0
  results = []

  (0...n).each do |i|
    while j > 0 && text[i] != pattern[j]
      j = pi[j - 1]
    end
    j += 1 if text[i] == pattern[j]
    if j == m
      # マッチした場合の開始インデックスを追加
      results << i - m + 1
      j = pi[j - 1]
    end
  end

  results
end

# 検索を実行し、結果の各インデックスを出力
indices = kmp_search(t, p)
indices.each { |index| puts index }
