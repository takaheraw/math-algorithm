(defun dijkstra (graph source)
  (let ((distances (make-hash-table :test #'equal))
        (priority-queue (list source)))
    
    ;; Initialize distances
    (maphash (lambda (vertex _)
               (setf (gethash vertex distances) most-positive-fixnum))
             graph)
    (setf (gethash source distances) 0)
    
    (loop while priority-queue do
      (let* ((current-vertex (car (sort (copy-list priority-queue) #'< 
                                        :key (lambda (v) (gethash v distances)))))
             (current-distance (gethash current-vertex distances)))
        
        (setf priority-queue (remove current-vertex priority-queue))
        
        (maphash 
         (lambda (neighbor weight)
           (let ((new-distance (+ current-distance weight)))
             (when (< new-distance (gethash neighbor distances))
               (setf (gethash neighbor distances) new-distance)
               (push neighbor priority-queue))))
         (gethash current-vertex graph))))
    
    distances))

;; Example usage:
(defvar *graph* 
  (let ((g (make-hash-table :test #'equal)))
    (setf (gethash "A" g) (list (cons "B" 1) (cons "C" 4)))
    (setf (gethash "B" g) (list (cons "A" 1) (cons "C" 2) (cons "D" 5)))
    (setf (gethash "C" g) (list (cons "A" 4) (cons "B" 2) (cons "D" 1)))
    (setf (gethash "D" g) (list (cons "B" 5) (cons "C" 1)))
    g))

(maphash (lambda (k v) (format t "~a: ~a~%" k v)) 
         (dijkstra *graph* "A"))
