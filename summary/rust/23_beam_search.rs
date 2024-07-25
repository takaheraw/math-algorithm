use std::collections::BinaryHeap;
use std::cmp::Ordering;

#[derive(Clone, Eq, PartialEq)]
struct Node {
    state: i32,
    parent: Option<Box<Node>>,
    cost: i32,
    estimated_cost: i32,
}

impl Ord for Node {
    fn cmp(&self, other: &Self) -> Ordering {
        other.estimated_cost.cmp(&self.estimated_cost)
    }
}

impl PartialOrd for Node {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

struct BeamSearch {
    start: i32,
    goal: i32,
    beam_width: usize,
}

impl BeamSearch {
    fn new(start: i32, goal: i32, beam_width: usize) -> Self {
        BeamSearch { start, goal, beam_width }
    }

    fn search(&self) -> Vec<i32> {
        let mut beam: BinaryHeap<Node> = BinaryHeap::new();
        beam.push(Node {
            state: self.start,
            parent: None,
            cost: 0,
            estimated_cost: self.heuristic(self.start),
        });

        while let Some(node) = beam.pop() {
            if node.state == self.goal {
                return self.construct_path(node);
            }

            let children = self.expand(&node);
            for child in children {
                beam.push(child);
            }

            while beam.len() > self.beam_width {
                beam.pop();
            }
        }

        vec![]
    }

    fn expand(&self, node: &Node) -> Vec<Node> {
        let mut children = Vec::new();
        let transitions = vec![(1, 2), (2, 3), (3, 4)]; // 実際には問題に応じて定義

        for (state, cost) in transitions {
            let new_cost = node.cost + cost;
            let estimated_cost = new_cost + self.heuristic(state);
            children.push(Node {
                state,
                parent: Some(Box::new(node.clone())),
                cost: new_cost,
                estimated_cost,
            });
        }

        children
    }

    fn heuristic(&self, state: i32) -> i32 {
        (self.goal - state).abs()
    }

    fn construct_path(&self, node: Node) -> Vec<i32> {
        let mut path = Vec::new();
        let mut current_node = Some(Box::new(node));

        while let Some(node) = current_node {
            path.push(node.state);
            current_node = node.parent.clone();
        }

        path.reverse();
        path
    }
}

// 使用例
fn main() {
    let start = 0;
    let goal = 10;
    let beam_width = 2;
    let beam_search = BeamSearch::new(start, goal, beam_width);
    let path = beam_search.search();
    println!("Path found: {:?}", path);
}
