(defun simulated-annealing (initial-solution cost-function)
  (let* ((current-solution (copy-seq initial-solution))
         (current-cost (funcall cost-function current-solution))
         (temperature 100.0)
         (min-temperature 0.01)
         (alpha 0.9))
    (loop while (> temperature min-temperature) do
      (let* ((next-solution (copy-seq current-solution))
             (i (random (length next-solution)))
             (j (random (length next-solution))))
        (rotatef (aref next-solution i) (aref next-solution j))
        (let ((next-cost (funcall cost-function next-solution)))
          (when (or (< next-cost current-cost)
                    (> (exp (/ (- current-cost next-cost) temperature)) (random 1.0)))
            (setf current-solution next-solution
                  current-cost next-cost)))
        (setf temperature (* temperature alpha))))
    current-solution))

(defun calculate-cost (arr)
  (reduce #'+ (map 'vector (lambda (x) (* x x)) arr)))

(defun main ()
  (let* ((input-array #(10 20 30 40 50))
         (optimized-array (simulated-annealing input-array #'calculate-cost)))
    (format t "Optimized Array using Simulated Annealing: ~A~%" optimized-array)))

(main)
