def greedy_algorithm(values, weights, capacity):
    items = sorted(
        [(i, v, w, v/w) for i, (v, w) in enumerate(zip(values, weights), 1)],
        key=lambda x: x[3],
        reverse=True
    )

    total_value = 0
    total_weight = 0
    selected_items = []

    for index, value, weight, _ in items:
        if total_weight + weight <= capacity:
            selected_items.append(index)
            total_value += value
            total_weight += weight

    return total_value, selected_items

# Example usage:
values = [60, 100, 120]
weights = [10, 20, 30]
capacity = 50
value, items = greedy_algorithm(values, weights, capacity)
print(f"Total value: {value}")
print(f"Items selected: {', '.join(map(str, items))}")
