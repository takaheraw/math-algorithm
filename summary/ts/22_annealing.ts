function simulatedAnnealing(initialSolution: number[], costFunction: (arr: number[]) => number): number[] {
    let currentSolution: number[] = initialSolution.slice();
    let currentCost: number = costFunction(currentSolution);
    let temperature: number = 100.0;
    const minTemperature: number = 0.01;
    const alpha: number = 0.9;

    while (temperature > minTemperature) {
        let nextSolution: number[] = currentSolution.slice();
        const i: number = Math.floor(Math.random() * currentSolution.length);
        const j: number = Math.floor(Math.random() * currentSolution.length);
        [nextSolution[i], nextSolution[j]] = [nextSolution[j], nextSolution[i]];
        const nextCost: number = costFunction(nextSolution);

        if (nextCost < currentCost || Math.exp((currentCost - nextCost) / temperature) > Math.random()) {
            currentSolution = nextSolution;
            currentCost = nextCost;
        }

        temperature *= alpha;
    }

    return currentSolution;
}

// Example usage:
const inputArray: number[] = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
const optimizedArray: number[] = simulatedAnnealing(inputArray, (arr) => arr.reduce((sum, num) => sum + num ** 2, 0));
console.log(`Optimized Array using Simulated Annealing: ${optimizedArray}`);
