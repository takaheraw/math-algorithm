(defun greedy-algorithm (values weights capacity)
  (let* ((items (loop for v in values
                      for w in weights
                      for i from 1
                      collect (list :index i :value v :weight w :ratio (/ v w))))
         (sorted-items (sort items #'> :key #'(lambda (item) (getf item :ratio))))
         (total-value 0)
         (total-weight 0)
         (selected-items '()))
    (dolist (item sorted-items)
      (when (<= (+ total-weight (getf item :weight)) capacity)
        (push (getf item :index) selected-items)
        (incf total-value (getf item :value))
        (incf total-weight (getf item :weight))))
    (values total-value (nreverse selected-items))))

;; Example usage:
(let ((values '(60 100 120))
      (weights '(10 20 30))
      (capacity 50))
  (multiple-value-bind (value items) (greedy-algorithm values weights capacity)
    (format t "Total value: ~A~%" value)
    (format t "Items selected: ~{~A~^, ~}" items)))
