function greedyAlgorithm(values: number[], weights: number[], capacity: number): [number, number[]] {
    const items = values.map((value, index) => ({
        index: index + 1,
        value: value,
        weight: weights[index],
        ratio: value / weights[index]
    }));
    items.sort((a, b) => b.ratio - a.ratio);

    let totalValue = 0;
    let totalWeight = 0;
    const selectedItems: number[] = [];

    items.forEach(item => {
        if (totalWeight + item.weight <= capacity) {
            selectedItems.push(item.index);
            totalValue += item.value;
            totalWeight += item.weight;
        }
    });

    return [totalValue, selectedItems];
}

// Example usage:
const values = [60, 100, 120];
const weights = [10, 20, 30];
const capacity = 50;
const [value, items] = greedyAlgorithm(values, weights, capacity);
console.log(`Total value: ${value}`);
console.log(`Items selected: ${items.join(', ')}`);
