#include <iostream>
#include <cmath>
#include <cstdlib>
#include <ctime>

// 目的関数
double objectiveFunction(double x) {
    return x * x + 4 * cos(x);  // 例：単純な二次関数とコサイン関数の組み合わせ
}

// ランダムな隣接解を生成
double getNeighbor(double x) {
    double delta = ((rand() / (double)RAND_MAX) - 0.5) * 2;  // -1から1の範囲でランダムな変化量
    return x + delta;
}

// 焼きなまし法
double simulatedAnnealing(double initialTemp, double finalTemp, double alpha, int maxIter) {
    double x = ((rand() / (double)RAND_MAX) * 20) - 10;  // -10から10の範囲でランダムな初期解を生成
    double currentTemp = initialTemp;
    double bestX = x;
    double bestEval = objectiveFunction(x);

    for (int i = 0; i < maxIter; ++i) {
        if (currentTemp < finalTemp) break;

        double newX = getNeighbor(x);
        double currentEval = objectiveFunction(x);
        double newEval = objectiveFunction(newX);

        if (newEval < currentEval || (exp((currentEval - newEval) / currentTemp) > (rand() / (double)RAND_MAX))) {
            x = newX;
            if (newEval < bestEval) {
                bestX = newX;
                bestEval = newEval;
            }
        }

        currentTemp *= alpha;
    }

    return bestX;
}

int main() {
    srand(time(0));

    double initialTemp = 100.0;
    double finalTemp = 0.01;
    double alpha = 0.99;
    int maxIter = 1000;

    double solution = simulatedAnnealing(initialTemp, finalTemp, alpha, maxIter);
    std::cout << "最適解: " << solution << std::endl;
    std::cout << "目的関数の値: " << objectiveFunction(solution) << std::endl;

    return 0;
}
