# マルチセットの実装
class MultiSet
  def initialize
    @elements = {}  # ハッシュマップで要素とその出現回数を管理
  end
  
  # 要素を挿入し、セットの要素数を返す
  def insert(x)
    @elements[x] ||= 0
    @elements[x] += 1
    total_count
  end
  
  # 特定の要素の出現回数を返す
  def find(x)
    @elements[x] || 0
  end
  
  # 特定の要素をすべて削除
  def delete(x)
    @elements.delete(x)
  end
  
  # 範囲内の要素をすべて昇順で出力
  def dump(l, r)
    result = []
    @elements.each do |value, count|
      if value >= l && value <= r
        count.times { result << value }
      end
    end
    result.sort
  end
  
  # セット内の全要素数を返す
  def total_count
    @elements.values.sum
  end
end

# メイン処理
def main
  q = gets.to_i
  
  set = MultiSet.new
  results = []
  
  q.times do
    query = gets.split.map(&:to_i)
    
    case query[0]
    when 0  # insert
      results << set.insert(query[1])
    when 1  # find
      results << set.find(query[1])
    when 2  # delete
      set.delete(query[1])
    when 3  # dump
      dump_results = set.dump(query[1], query[2])
      results.concat(dump_results)
    end
  end
  
  # 結果を出力
  results.each { |r| puts r }
end

# プログラム実行
main
