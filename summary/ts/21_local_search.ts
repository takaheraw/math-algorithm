function localSearchAlgorithm(arr: number[], costFunction: (arr: number[]) => number): number[] {
    const n: number = arr.length;
    let bestSolution: number[] = arr.slice();
    let bestCost: number = costFunction(bestSolution);

    while (true) {
        let currentSolution: number[] = bestSolution.slice();
        let improved: boolean = false;

        for (let i = 0; i < n; i++) {
            for (let j = i + 1; j < n; j++) {
                [currentSolution[i], currentSolution[j]] = [currentSolution[j], currentSolution[i]];
                const currentCost: number = costFunction(currentSolution);
                if (currentCost < bestCost) {
                    bestSolution = currentSolution.slice();
                    bestCost = currentCost;
                    improved = true;
                }
                [currentSolution[i], currentSolution[j]] = [currentSolution[j], currentSolution[i]];
            }
        }

        if (!improved) {
            break;
        }
    }

    return bestSolution;
}

// Example usage:
const inputArray: number[] = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
const bestArray: number[] = localSearchAlgorithm(inputArray, (arr) => arr.reduce((sum, num) => sum + num ** 2, 0));
console.log(`Optimized Array: ${bestArray}`);
