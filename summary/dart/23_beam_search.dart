import 'dart:collection';

class Node {
  final String value;
  final List<Node> children;

  Node(this.value, this.children);
}

class BeamSearch {
  final int beamWidth;

  BeamSearch(this.beamWidth);

  List<Node> findBestPath(Node root, Node goal) {
    // 探索済みのノードを保持するキュー
    var explored = <Node>[];

    // 未探索のノードを保持するキュー
    var frontier = <List<Node>>[
      [root]
    ];

    while (frontier.isNotEmpty) {
      // 現在探索しているレベルを取得
      var currentLevel = frontier.removeAt(0);

      // 次のレベルの候補ノードリストを作成
      var nextLevel = <List<Node>>[];

      for (var node in currentLevel) {
        // ゴールノードに到達したか確認
        if (node == goal) {
          return retracePath(node);
        }

        // 子ノードを展開
        for (var child in node.children) {
          // 探索済みのノードをスキップ
          if (explored.contains(child)) continue;

          // 新しい経路を作成
          var newPath = currentLevel.toList()..add(child);

          // 次のレベルの候補ノードリストに追加
          nextLevel.add(newPath);
        }

        // 探索済みリストに追加
        explored.add(node);
      }

      // 次のレベルをソート（スコアの高い順）
      nextLevel.sort((a, b) => compareScore(a, b));

      // 次のレベルを制限（ビーム幅分）
      nextLevel = nextLevel.sublist(0, beamWidth);

      // 次のレベルを追加
      if (nextLevel.isNotEmpty) {
        frontier.add(nextLevel);
      }
    }

    // ゴールノードが見つからなかった場合
    return [];
  }

  // スコアを比較する関数
  int compareScore(List<Node> path1, List<Node> path2) {
    // スコア計算ロジックを実装
    // 例：最後のノードのヒューリスティック値を使用
    return path1.last.heuristicValue - path2.last.heuristicValue;
  }

  // パスをたどってリストを返す関数
  List<Node> retracePath(Node node) {
    var path = <Node>[];
    while (node != null) {
      path.add(node);
      node = node.parent;
    }
    path.reversed();
    return path;
  }
}

void main() {
  // ノードを作成
  var root = Node('A', [
    Node('B', [
      Node('E', []),
      Node('F', []),
    ]),
    Node('C', [
      Node('G', []),
      Node('H', []),
    ]),
    Node('D', []),
  ]);
  var goal = Node('H', []);

  // ビームサーチアルゴリズムを作成
  var beamSearch = BeamSearch(2);

  // 最適なパスを見つける
  var path = beamSearch.findBestPath(root, goal);

  // パスを表示
  print('最短経路: ${path.map((node) => node.value).join(' -> ')}');
}
