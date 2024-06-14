package main

import (
	"fmt"
	"math"
	"math/rand"
	"time"
)

// 評価関数（最小化したい関数）
func objectiveFunction(x float64) float64 {
	return x*x + 4*math.Sin(5*x)
}

// 焼きなまし法を実装する関数
func simulatedAnnealing(initialTemp, finalTemp, alpha float64, iterations int) float64 {
	rand.Seed(time.Now().UnixNano())

	// 初期解の設定
	currentSolution := rand.Float64()*20 - 10 // -10から10の範囲で初期解を設定
	currentEnergy := objectiveFunction(currentSolution)
	bestSolution := currentSolution
	bestEnergy := currentEnergy

	// 初期温度設定
	temp := initialTemp

	for temp > finalTemp {
		for i := 0; i < iterations; i++ {
			// 新しい解を近傍から生成
			newSolution := currentSolution + (rand.Float64()*2 - 1)
			newEnergy := objectiveFunction(newSolution)

			// エネルギーの変化
			energyChange := newEnergy - currentEnergy

			// 新しい解を受け入れるかどうかの判定
			if energyChange < 0 || rand.Float64() < math.Exp(-energyChange/temp) {
				currentSolution = newSolution
				currentEnergy = newEnergy
			}

			// 最良解の更新
			if currentEnergy < bestEnergy {
				bestSolution = currentSolution
				bestEnergy = currentEnergy
			}
		}
		// 温度の減少
		temp *= alpha
	}

	return bestSolution
}

func main() {
	initialTemp := 1000.0
	finalTemp := 0.1
	alpha := 0.99
	iterations := 100

	bestSolution := simulatedAnnealing(initialTemp, finalTemp, alpha, iterations)
	fmt.Printf("最適解: %f\n", bestSolution)
	fmt.Printf("最小値: %f\n", objectiveFunction(bestSolution))
}
