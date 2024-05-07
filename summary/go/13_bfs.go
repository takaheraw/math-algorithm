package main

import "fmt"

func breadthFirstSearch(graph map[string][]string, startVertex string) []string {
	queue := []string{startVertex}
	visited := make(map[string]bool)
	visited[startVertex] = true
	orderOfVisit := []string{}

	for len(queue) > 0 {
		currentVertex := queue[0]
		queue = queue[1:]
		orderOfVisit = append(orderOfVisit, currentVertex)

		for _, neighbor := range graph[currentVertex] {
			if !visited[neighbor] {
				queue = append(queue, neighbor)
				visited[neighbor] = true
			}
		}
	}

	return orderOfVisit
}

// Example usage:
func main() {
	graph := map[string][]string{
		"A": {"B", "C"},
		"B": {"A", "D", "E"},
		"C": {"A", "F"},
		"D": {"B"},
		"E": {"B", "F"},
		"F": {"C", "E"},
	}
	result := breadthFirstSearch(graph, "A")
	fmt.Println("Order of visit from A:", result)
}
