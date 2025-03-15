#!/usr/bin/env ruby

# 辞書Mを表すクラス
class Dictionary
  def initialize
    @map = {}
  end

  # キーと値のペアを挿入
  def insert(key, x)
    @map[key] = x
  end

  # 指定されたキーの値を取得
  def get(key)
    @map.key?(key) ? @map[key] : 0
  end

  # 指定されたキーの要素を削除
  def delete(key)
    @map.delete(key)
  end

  # 辞書順でL以上R以下のキーを持つ全ての要素を表示
  def dump(l, r)
    result = []
    @map.each do |key, value|
      if key >= l && key <= r
        result << "#{key} #{value}"
      end
    end
    result.sort.each do |element|
      puts element
    end
  end
end

# メイン処理
dictionary = Dictionary.new
q = gets.to_i

q.times do
  query = gets.chomp.split
  operation = query[0].to_i
  
  case operation
  when 0 # insert
    key = query[1]
    x = query[2].to_i
    dictionary.insert(key, x)
  when 1 # get
    key = query[1]
    puts dictionary.get(key)
  when 2 # delete
    key = query[1]
    dictionary.delete(key)
  when 3 # dump
    l = query[1]
    r = query[2]
    dictionary.dump(l, r)
  end
end
