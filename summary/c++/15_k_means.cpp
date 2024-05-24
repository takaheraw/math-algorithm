#include <vector>
#include <cmath>
#include <limits>
#include <algorithm>
#include <iostream>

double euclidean_distance(const std::vector<double>& point1, const std::vector<double>& point2) {
    double sum = 0.0;
    for (size_t i = 0; i < point1.size(); ++i) {
        sum += (point1[i] - point2[i]) * (point1[i] - point2[i]);
    }
    return std::sqrt(sum);
}

void k_means(const std::vector<std::vector<double>>& data, int k, std::vector<std::vector<double>>& centroids, std::vector<std::vector<std::vector<double>>>& clusters) {
    // Initialize centroids randomly
    centroids.resize(k);
    std::vector<int> used_indices;
    for (int i = 0; i < k; ++i) {
        int index;
        do {
            index = rand() % data.size();
        } while (std::find(used_indices.begin(), used_indices.end(), index) != used_indices.end());
        used_indices.push_back(index);
        centroids[i] = data[index];
    }

    bool changed;
    do {
        // Create clusters
        std::vector<std::vector<std::vector<double>>> new_clusters(k);
        for (const auto& point : data) {
            int closest_centroid_index = 0;
            double min_distance = std::numeric_limits<double>::max();
            for (int i = 0; i < k; ++i) {
                double distance = euclidean_distance(point, centroids[i]);
                if (distance < min_distance) {
                    min_distance = distance;
                    closest_centroid_index = i;
                }
            }
            new_clusters[closest_centroid_index].push_back(point);
        }

        // Update centroids
        changed = false;
        for (int i = 0; i < k; ++i) {
            std::vector<double> new_centroid(data[0].size(), 0.0);
            for (const auto& point : new_clusters[i]) {
                for (size_t j = 0; j < point.size(); ++j) {
                    new_centroid[j] += point[j];
                }
            }
            for (size_t j = 0; j < new_centroid.size(); ++j) {
                new_centroid[j] /= new_clusters[i].size();
            }
            if (euclidean_distance(new_centroid, centroids[i]) > 0.001) {
                centroids[i] = new_centroid;
                changed = true;
            }
        }
        clusters = new_clusters;
    } while (changed);
}

int main() {
    std::vector<std::vector<double>> data = {{1.0, 2.0}, {1.5, 1.8}, {5.0, 8.0}, {8.0, 8.0}, {1.0, 0.6}, {9.0, 11.0}};
    int k = 2;
    std::vector<std::vector<double>> centroids;
    std::vector<std::vector<std::vector<double>>> clusters;
    k_means(data, k, centroids, clusters);

    for (int i = 0; i < k; ++i) {
        std::cout << "Cluster " << i + 1 << ": Centroid -> (";
        for (size_t j = 0; j < centroids[i].size(); ++j) {
            std::cout << centroids[i][j] << (j < centroids[i].size() - 1 ? ", " : "");
        }
        std::cout << ")" << std::endl;
        std::cout << "Points:" << std::endl;
        for (const auto& point : clusters[i]) {
            std::cout << "(";
            for (size_t j = 0; j < point.size(); ++j) {
                std::cout << point[j] << (j < point.size() - 1 ? ", " : "");
            }
            std::cout << ")" << std::endl;
        }
    }
    return 0;
}
