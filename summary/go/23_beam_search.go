package main

import (
	"fmt"
	"sort"
)

type Node struct {
	sequence string
	score    float64
}

// Function to generate possible next states (dummy implementation)
func generateNextStates(node Node) []Node {
	// Here we simply add 'A' or 'B' to the current sequence
	nextStates := []Node{
		{sequence: node.sequence + "A", score: node.score + 1.0}, // Example scoring
		{sequence: node.sequence + "B", score: node.score + 0.5},
	}
	return nextStates
}

// Beam search implementation
func beamSearch(initialNode Node, beamWidth int, maxSteps int) Node {
	currentNodes := []Node{initialNode}

	for step := 0; step < maxSteps; step++ {
		allCandidates := []Node{}

		// Generate all possible next states for each node in currentNodes
		for _, node := range currentNodes {
			nextStates := generateNextStates(node)
			allCandidates = append(allCandidates, nextStates...)
		}

		// Sort candidates by score in descending order
		sort.Slice(allCandidates, func(i, j int) bool {
			return allCandidates[i].score > allCandidates[j].score
		})

		// Keep only the top beamWidth candidates
		if len(allCandidates) > beamWidth {
			allCandidates = allCandidates[:beamWidth]
		}

		// Update current nodes
		currentNodes = allCandidates
	}

	// Return the best node from the final set of nodes
	bestNode := currentNodes[0]
	for _, node := range currentNodes {
		if node.score > bestNode.score {
			bestNode = node
		}
	}
	return bestNode
}

func main() {
	initialNode := Node{sequence: "", score: 0.0}
	beamWidth := 3
	maxSteps := 5

	result := beamSearch(initialNode, beamWidth, maxSteps)
	fmt.Printf("Best sequence: %s with score: %.2f\n", result.sequence, result.score)
}
