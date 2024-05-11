use std::collections::{BinaryHeap, HashMap};

fn dijkstra(graph: &HashMap<char, HashMap<char, i32>>, source: char) -> HashMap<char, i32> {
    let mut distances = HashMap::new();
    let mut priority_queue = BinaryHeap::new();

    // Initialize distances
    for (&vertex, _) in graph.iter() {
        distances.insert(vertex, i32::MAX);
    }
    distances.insert(source, 0);
    priority_queue.push((0, source));

    while let Some((cost, u)) = priority_queue.pop() {
        let cost = -cost; // Since BinaryHeap is a max-heap, we use negative to simulate min-heap

        if cost > distances[&u] {
            continue;
        }

        if let Some(neighbors) = graph.get(&u) {
            for (&v, &weight) in neighbors.iter() {
                let next = cost + weight;
                if next < *distances.get(&v).unwrap_or(&i32::MAX) {
                    distances.insert(v, next);
                    priority_queue.push((-next, v)); // push negative to simulate min-heap
                }
            }
        }
    }

    distances
}

fn main() {
    let mut graph = HashMap::new();
    graph.insert('A', HashMap::from([('B', 1), ('C', 4)]));
    graph.insert('B', HashMap::from([('A', 1), ('C', 2), ('D', 5)]));
    graph.insert('C', HashMap::from([('A', 4), ('B', 2), ('D', 1)]));
    graph.insert('D', HashMap::from([('B', 5), ('C', 1)]));

    let distances = dijkstra(&graph, 'A');
    println!("Distances from A: {:?}", distances);
}
