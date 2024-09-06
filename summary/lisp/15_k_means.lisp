(defun euclidean-distance (point1 point2)
  (sqrt (reduce #'+ (mapcar (lambda (a b) (expt (- a b) 2)) point1 point2))))

(defun mean-point (points)
  (mapcar (lambda (dimension) (/ (reduce #'+ dimension) (length dimension)))
          (apply #'mapcar #'list points)))

(defun k-means (data k)
  (let* ((centroids (subseq data 0 k))
         (clusters nil))
    (loop
      (setf clusters (loop for point in data
                           for closest-centroid = (reduce (lambda (a b)
                                                            (if (< (euclidean-distance point a)
                                                                   (euclidean-distance point b))
                                                                a
                                                                b))
                                                          centroids)
                           collect (cons closest-centroid point)))
      
      (let ((new-centroids (loop for centroid in centroids
                                 for cluster = (mapcar #'cdr (remove-if-not (lambda (x) (equal (car x) centroid)) clusters))
                                 collect (mean-point cluster))))
        (when (equal new-centroids centroids)
          (return clusters))
        (setf centroids new-centroids)))
    clusters))

;; Example usage:
(let ((data '((1 2) (1 4) (1 0) (10 2) (10 4) (10 0)))
      (k 2))
  (let ((clusters (k-means data k)))
    (loop for cluster in (remove-duplicates clusters :key #'car :test #'equal)
          for i from 1
          do (format t "Cluster ~A: Centroid -> ~A, Points -> ~A~%"
                     i
                     (car cluster)
                     (mapcar #'cdr (remove-if-not (lambda (x) (equal (car x) (car cluster))) clusters))))))
