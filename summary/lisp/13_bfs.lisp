(defun breadth-first-search (graph start-vertex)
  (let ((queue (list start-vertex))
        (visited (make-hash-table :test #'equal))
        (order-of-visit nil))
    
    (setf (gethash start-vertex visited) t)
    
    (loop while queue do
      (let ((current-vertex (pop queue)))
        (push current-vertex order-of-visit)
        
        (dolist (neighbor (gethash current-vertex graph))
          (unless (gethash neighbor visited)
            (push neighbor queue)
            (setf (gethash neighbor visited) t)))))
    
    (nreverse order-of-visit)))

;; Example usage:
(defvar *graph* 
  (let ((g (make-hash-table :test #'equal)))
    (setf (gethash "A" g) '("B" "C"))
    (setf (gethash "B" g) '("A" "D" "E"))
    (setf (gethash "C" g) '("A" "F"))
    (setf (gethash "D" g) '("B"))
    (setf (gethash "E" g) '("B" "F"))
    (setf (gethash "F" g) '("C" "E"))
    g))

(format t "~a~%" (breadth-first-search *graph* "A"))
