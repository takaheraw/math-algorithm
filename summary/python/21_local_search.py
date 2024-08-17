def local_search_algorithm(arr):
    n = len(arr)
    best_solution = arr.copy()
    best_cost = calculate_cost(best_solution)

    while True:
        improved = False
        for i in range(n):
            for j in range(i + 1, n):
                current_solution = best_solution.copy()
                current_solution[i], current_solution[j] = current_solution[j], current_solution[i]
                current_cost = calculate_cost(current_solution)
                if current_cost < best_cost:
                    best_solution = current_solution
                    best_cost = current_cost
                    improved = True
        
        if not improved:
            break

    return best_solution

def calculate_cost(arr):
    return sum(num ** 2 for num in arr)

# Example usage:
input_array = list(map(int, input().split()))
best_array = local_search_algorithm(input_array)
print("Optimized Array:", best_array)
