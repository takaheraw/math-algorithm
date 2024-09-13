(defun calculate-cost (arr)
  (reduce #'+ (mapcar #'(lambda (x) (* x x)) arr)))

(defun local-search (arr)
  (let* ((n (length arr))
         (best-solution (copy-seq arr))
         (best-cost (calculate-cost best-solution)))
    (loop
      (let ((improved nil))
        (dotimes (i n)
          (dotimes (j (- n i 1))
            (let ((k (+ i j 1)))
              (rotatef (aref best-solution i) (aref best-solution k))
              (let ((current-cost (calculate-cost best-solution)))
                (if (< current-cost best-cost)
                    (setf best-cost current-cost
                          improved t)
                    (rotatef (aref best-solution i) (aref best-solution k)))))))
        (unless improved (return best-solution))))))

;; Example usage
(defun main ()
  (let* ((input-array #(10 20 30 40 50))
         (optimized-array (local-search input-array)))
    (format t "Optimized Array: ~A~%" optimized-array)))

(main)
