(defun cumulative-sum (visitors)
  (let ((accumulates (make-array (1+ (length visitors)) :initial-element 0)))
    (loop for i from 1 to (length visitors) do
      (setf (aref accumulates i) (+ (aref accumulates (1- i)) (nth (1- i) visitors))))
    accumulates))

(defun calculate-range-sum (accumulates start end)
  (- (aref accumulates end) (aref accumulates (1- start))))

(let* ((visitors '(62 65 41 13 20 11 18 44 53 12 18 17 14 10 39))
       (accumulates (cumulative-sum visitors))
       (targets '((2 4) (4 13))))
  (dolist (target targets)
    (destructuring-bind (start end) target
      (format t "~A日目から~A日目までの来場者数~%" start end)
      (format t "~A~%" (calculate-range-sum accumulates start end)))))
