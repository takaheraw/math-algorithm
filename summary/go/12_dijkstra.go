package main

import (
	"container/heap"
	"fmt"
	"math"
)

type Graph map[string]map[string]float64

func dijkstra(graph Graph, source string) map[string]float64 {
	distances := make(map[string]float64)
	for vertex := range graph {
		distances[vertex] = math.Inf(1)
	}
	distances[source] = 0

	priorityQueue := make(PriorityQueue, 0)
	priorityQueue = append(priorityQueue, &Item{value: source, priority: 0})

	for len(priorityQueue) > 0 {
		currentVertex := heap.Pop(&priorityQueue).(*Item).value

		for neighbor, weight := range graph[currentVertex] {
			newDistance := distances[currentVertex] + weight
			if newDistance < distances[neighbor] {
				distances[neighbor] = newDistance
				heap.Push(&priorityQueue, &Item{value: neighbor, priority: newDistance})
			}
		}
	}

	return distances
}

type Item struct {
	value    string
	priority float64
	index    int
}

type PriorityQueue []*Item

func (pq PriorityQueue) Len() int { return len(pq) }

func (pq PriorityQueue) Less(i, j int) bool {
	return pq[i].priority < pq[j].priority
}

func (pq PriorityQueue) Swap(i, j int) {
	pq[i], pq[j] = pq[j], pq[i]
	pq[i].index = i
	pq[j].index = j
}

func (pq *PriorityQueue) Push(x interface{}) {
	n := len(*pq)
	item := x.(*Item)
	item.index = n
	*pq = append(*pq, item)
}

func (pq *PriorityQueue) Pop() interface{} {
	old := *pq
	n := len(old)
	item := old[n-1]
	item.index = -1
	*pq = old[0 : n-1]
	return item
}

func main() {
	graph := Graph{
		"A": {"B": 1, "C": 4},
		"B": {"A": 1, "C": 2, "D": 5},
		"C": {"A": 4, "B": 2, "D": 1},
		"D": {"B": 5, "C": 1},
	}
	distances := dijkstra(graph, "A")
	fmt.Println("Distances from A:", distances)
}
