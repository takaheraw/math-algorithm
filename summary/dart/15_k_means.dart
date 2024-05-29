import 'dart:math';

List<List<double>> kMeans(List<List<double>> data, int k) {
  List<List<double>> centroids = List.from(data)..shuffle();
  centroids = centroids.take(k).toList();
  Map<List<double>, List<List<double>>> clusters;

  bool centroidsChanged;

  do {
    centroidsChanged = false;
    clusters = {};

    // Assign points to the nearest centroid
    for (var point in data) {
      var nearest = centroids.reduce((a, b) => euclideanDistance(point, a) < euclideanDistance(point, b) ? a : b);
      clusters.putIfAbsent(nearest, () => []).add(point);
    }

    // Recalculate centroids
    List<List<double>> newCentroids = [];
    clusters.forEach((centroid, points) {
      List<double> newCentroid = [];
      int dimensions = points[0].length;
      for (int i = 0; i < dimensions; i++) {
        double mean = points.map((e) => e[i]).reduce((a, b) => a + b) / points.length;
        newCentroid.add(mean);
      }
      newCentroids.add(newCentroid);
    });

    // Check if centroids have changed
    for (int i = 0; i < centroids.length; i++) {
      if (!listEquals(centroids[i], newCentroids[i])) {
        centroidsChanged = true;
        break;
      }
    }

    centroids = newCentroids;
  } while (centroidsChanged);

  return centroids;
}

double euclideanDistance(List<double> point1, List<double> point2) {
  double sum = 0;
  for (int i = 0; i < point1.length; i++) {
    sum += pow(point1[i] - point2[i], 2);
  }
  return sqrt(sum);
}

bool listEquals(List<double> list1, List<double> list2) {
  if (list1.length != list2.length) return false;
  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) return false;
  }
  return true;
}

void main() {
  List<List<double>> data = [
    [1.0, 2.0], [1.0, 4.0], [1.0, 0.0],
    [10.0, 2.0], [10.0, 4.0], [10.0, 0.0]
  ];
  int k = 2;
  List<List<double>> centroids = kMeans(data, k);
  print("Centroids: $centroids");
}
