package main

import (
	"math"
	"math/rand"
	"time"
)

type Point []float64

func euclideanDistance(p1, p2 Point) float64 {
	var sum float64
	for i := range p1 {
		sum += (p1[i] - p2[i]) * (p1[i] - p2[i])
	}
	return math.Sqrt(sum)
}

func kMeans(data []Point, k int) [][]Point {
	rand.Seed(time.Now().UnixNano())
	centroids := make([]Point, k)
	for i := range centroids {
		centroids[i] = data[rand.Intn(len(data))]
	}

	var clusters [][]Point
	for {
		clusters = make([][]Point, k)
		for _, point := range data {
			minDist := math.Inf(1)
			var idx int
			for i, centroid := range centroids {
				dist := euclideanDistance(point, centroid)
				if dist < minDist {
					minDist = dist
					idx = i
				}
			}
			clusters[idx] = append(clusters[idx], point)
		}

		newCentroids := make([]Point, k)
		for i, cluster := range clusters {
			newCentroid := make(Point, len(data[0]))
			for _, point := range cluster {
				for j, val := range point {
					newCentroid[j] += val
				}
			}
			for j := range newCentroid {
				newCentroid[j] /= float64(len(cluster))
			}
			newCentroids[i] = newCentroid
		}

		converged := true
		for i := range centroids {
			if euclideanDistance(centroids[i], newCentroids[i]) > 0.0001 {
				converged = false
				break
			}
		}

		if converged {
			break
		}

		centroids = newCentroids
	}

	return clusters
}

func main() {
	data := []Point{{1, 2}, {1, 4}, {1, 0}, {10, 2}, {10, 4}, {10, 0}}
	k := 2
	clusters := kMeans(data, k)
	for i, cluster := range clusters {
		println("Cluster", i+1)
		for _, point := range cluster {
			println("Point:", point)
		}
	}
}
