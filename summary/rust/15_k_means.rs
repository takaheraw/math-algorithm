use std::cmp::Ordering;

#[derive(Debug, Copy, Clone)]
struct Point {
    x: f64,
    y: f64,
}

impl Point {
    fn new(x: f64, y: f64) -> Point {
        Point { x, y }
    }

    fn distance(&self, other: &Point) -> f64 {
        ((self.x - other.x).powi(2) + (self.y - other.y).powi(2)).sqrt()
    }
}

#[derive(Debug)]
struct Cluster {
    centroid: Point,
    points: Vec<Point>,
}

impl Cluster {
    fn new(centroid: Point) -> Cluster {
        Cluster {
            centroid,
            points: Vec::new(),
        }
    }

    fn update_centroid(&mut self) {
        let sum_x: f64 = self.points.iter().map(|p| p.x).sum();
        let sum_y: f64 = self.points.iter().map(|p| p.y).sum();
        let num_points = self.points.len() as f64;
        self.centroid.x = sum_x / num_points;
        self.centroid.y = sum_y / num_points;
    }

    fn clear_points(&mut self) {
        self.points.clear();
    }
}

fn k_means(points: &[Point], k: usize, max_iterations: usize) -> Vec<Cluster> {
    let mut clusters: Vec<Cluster> = Vec::new();

    // Initialize clusters with random centroids
    for i in 0..k {
        let centroid = points[i];
        clusters.push(Cluster::new(centroid));
    }

    for _ in 0..max_iterations {
        // Assign points to clusters
        for point in points {
            let mut min_distance = f64::MAX;
            let mut closest_cluster_index = 0;
            for (i, cluster) in clusters.iter().enumerate() {
                let distance = point.distance(&cluster.centroid);
                if distance < min_distance {
                    min_distance = distance;
                    closest_cluster_index = i;
                }
            }
            clusters[closest_cluster_index].points.push(*point);
        }

        // Update centroids
        for cluster in &mut clusters {
            cluster.update_centroid();
        }

        // Clear points from clusters
        for cluster in &mut clusters {
            cluster.clear_points();
        }
    }

    clusters
}

fn main() {
    // Sample data points
    let points = vec![
        Point::new(1.0, 1.0),
        Point::new(2.0, 1.0),
        Point::new(1.5, 2.0),
        Point::new(8.0, 8.0),
        Point::new(7.0, 9.0),
        Point::new(9.0, 8.0),
    ];

    // Number of clusters
    let k = 2;

    // Maximum iterations
    let max_iterations = 100;

    // Run k-means algorithm
    let clusters = k_means(&points, k, max_iterations);

    // Output cluster centroids and points
    for (i, cluster) in clusters.iter().enumerate() {
        println!("Cluster {}: {:?}", i + 1, cluster);
    }
}
