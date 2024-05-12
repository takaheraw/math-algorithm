use std::collections::{VecDeque, HashMap};

fn breadth_first_search(graph: &HashMap<char, Vec<char>>, start_vertex: char) -> Vec<char> {
    let mut queue = VecDeque::new();
    let mut visited = HashMap::new();
    let mut order_of_visit = Vec::new();

    queue.push_back(start_vertex);
    visited.insert(start_vertex, true);

    while let Some(current_vertex) = queue.pop_front() {
        order_of_visit.push(current_vertex);

        if let Some(neighbors) = graph.get(&current_vertex) {
            for &neighbor in neighbors {
                if !visited.contains_key(&neighbor) {
                    queue.push_back(neighbor);
                    visited.insert(neighbor, true);
                }
            }
        }
    }

    order_of_visit
}

fn main() {
    let mut graph = HashMap::new();
    graph.insert('A', vec!['B', 'C']);
    graph.insert('B', vec!['A', 'D', 'E']);
    graph.insert('C', vec!['A', 'F']);
    graph.insert('D', vec!['B']);
    graph.insert('E', vec!['B', 'F']);
    graph.insert('F', vec!['C', 'E']);

    let visit_order = breadth_first_search(&graph, 'A');
    println!("Visit order: {:?}", visit_order);
}
