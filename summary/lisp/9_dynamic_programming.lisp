(defun min-cost (room-count pattern1 pattern2)
  (let ((dp (make-array (1+ room-count) :initial-element nil)))
    (setf (aref dp 1) 0)
    (setf (aref dp 2) (first pattern1))
    (loop for i from 3 to room-count do
      (setf (aref dp i)
            (min (+ (aref dp (1- i)) (nth (- i 2) pattern1))
                 (+ (aref dp (- i 2)) (nth (- i 3) pattern2)))))
    (aref dp room-count)))

(defun read-numbers ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(let* ((room-count 5)
       (pattern1 '(2 4 1 3))
       (pattern2 '(5 3 7))
       (result (min-cost room-count pattern1 pattern2)))
  (format t "~A~%" result))
