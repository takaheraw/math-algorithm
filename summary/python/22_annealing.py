import random
import math

def simulated_annealing(initial_solution, cost_function, temperature=100.0, cooling_rate=0.995, min_temperature=0.01):
    current_solution = initial_solution.copy()
    current_cost = cost_function(current_solution)
    best_solution = current_solution.copy()
    best_cost = current_cost

    while temperature > min_temperature:
        new_solution = current_solution.copy()
        i, j = random.sample(range(len(new_solution)), 2)
        new_solution[i], new_solution[j] = new_solution[j], new_solution[i]
        new_cost = cost_function(new_solution)

        if new_cost < current_cost or random.random() < math.exp((current_cost - new_cost) / temperature):
            current_solution = new_solution
            current_cost = new_cost

            if current_cost < best_cost:
                best_solution = current_solution.copy()
                best_cost = current_cost

        temperature *= cooling_rate

    return best_solution

def calculate_cost(arr):
    return sum(num ** 2 for num in arr)

# Example usage:
if __name__ == "__main__":
    input_array = list(map(int, input().split()))
    optimized_array = simulated_annealing(input_array, calculate_cost)
    print("Optimized Array using Simulated Annealing:", optimized_array)
